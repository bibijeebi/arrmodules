{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.services.radarr;
in {
  options.services.radarr = {
    enable = mkEnableOption "Radarr, a movie collection manager for Usenet and BitTorrent users";

    package = mkPackageOption pkgs "radarr" {};

    dataDir = mkOption {
      type = types.str;
      default = "/var/lib/radarr/.config/Radarr";
      description = "The directory where Radarr stores its data files.";
    };

    port = mkOption {
      type = types.port;
      default = 7878;
      description = "Port for the web interface.";
    };

    enableSsl = mkOption {
      type = types.bool;
      default = false;
      description = "Enable HTTPS access to the web interface.";
    };

    sslPort = mkOption {
      type = types.port;
      default = 9898;
      description = "Port for HTTPS access when SSL is enabled.";
    };

    sslCertPath = mkOption {
      type = types.str;
      default = "";
      description = "Path to SSL certificate file.";
    };

    sslCertPassword = mkOption {
      type = types.str;
      default = "";
      description = "Password for SSL certificate.";
    };

    openFirewall = mkOption {
      type = types.bool;
      default = false;
      description = "Open ports in the firewall for the web interface.";
    };

    user = mkOption {
      type = types.str;
      default = "radarr";
      description = "User account under which Radarr runs.";
    };

    group = mkOption {
      type = types.str;
      default = "radarr";
      description = "Group under which Radarr runs.";
    };

    urlBase = mkOption {
      type = types.str;
      default = "";
      description = "URL base for reverse proxy support.";
    };

    bindAddress = mkOption {
      type = types.str;
      default = "*";
      description = "IP address to bind to.";
    };

    apiKey = mkOption {
      type = types.str;
      default = "";
      description = "API key for external access.";
    };

    authenticationMethod = mkOption {
      type = types.enum ["None" "Basic" "Forms"];
      default = "Basic";
      description = "Authentication method for web interface.";
    };

    authenticationRequired = mkOption {
      type = types.enum ["Enabled" "DisabledForLocalAddresses"];
      default = "Enabled";
      description = "Authentication requirement policy.";
    };

    settings = mkOption {
      type = types.attrs;
      default = {};
      description = "Additional configuration options for Radarr.";
    };
  };

  config = mkIf cfg.enable {
    systemd.tmpfiles.rules = [
      "d '${cfg.dataDir}' 0700 ${cfg.user} ${cfg.group} - -"
    ];

    systemd.services.radarr = {
      description = "Radarr";
      after = ["network.target"];
      wantedBy = ["multi-user.target"];

      environment = {
        RADARR_DATA_DIR = cfg.dataDir;
        RADARR_CONFIG_FILE = "${cfg.dataDir}/config.xml";
      };

      preStart = let
        configFile = pkgs.writeText "radarr-config.xml" ''
          <Config>
            <BindAddress>${cfg.bindAddress}</BindAddress>
            <Port>${toString cfg.port}</Port>
            <SslPort>${toString cfg.sslPort}</SslPort>
            <EnableSsl>${boolToString cfg.enableSsl}</EnableSsl>
            <ApiKey>${cfg.apiKey}</ApiKey>
            <AuthenticationMethod>${cfg.authenticationMethod}</AuthenticationMethod>
            <AuthenticationRequired>${cfg.authenticationRequired}</AuthenticationRequired>
            <UrlBase>${cfg.urlBase}</UrlBase>
            <LogLevel>Info</LogLevel>
            <InstanceName>Radarr</InstanceName>
            ${optionalString (cfg.sslCertPath != "") "<SslCertPath>${cfg.sslCertPath}</SslCertPath>"}
            ${optionalString (cfg.sslCertPassword != "") "<SslCertPassword>${cfg.sslCertPassword}</SslCertPassword>"}
          </Config>
        '';
      in ''
        mkdir -p ${cfg.dataDir}
        if [ ! -f ${cfg.dataDir}/config.xml ]; then
          cp ${configFile} ${cfg.dataDir}/config.xml
        fi
        chown -R ${cfg.user}:${cfg.group} ${cfg.dataDir}
        chmod 600 ${cfg.dataDir}/config.xml
        cp ${builtins.toJSON cfg.settings} ${cfg.dataDir}/settings.json
      '';

      postStart = ''
        ${setOptionsScript} ${cfg.dataDir}/settings.json
      '';

      serviceConfig = {
        Type = "simple";
        User = cfg.user;
        Group = cfg.group;
        ExecStart = "${cfg.package}/bin/Radarr -nobrowser -data='${cfg.dataDir}'";
        Restart = "on-failure";
        RestartSec = "10s";

        # Security hardening
        CapabilityBoundingSet = "";
        DevicePolicy = "closed";
        LockPersonality = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        PrivateDevices = true;
        PrivateTmp = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectSystem = "strict";
        ReadWritePaths = [cfg.dataDir];
        RemoveIPC = true;
        RestrictAddressFamilies = ["AF_INET" "AF_INET6"];
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        SystemCallArchitectures = "native";
        SystemCallFilter = ["@system-service"];
        UMask = "0077";
      };
    };

    networking.firewall = mkIf cfg.openFirewall {
      allowedTCPPorts = [cfg.port] ++ optional cfg.enableSsl cfg.sslPort;
    };

    users.users = mkIf (cfg.user == "radarr") {
      radarr = {
        group = cfg.group;
        home = cfg.dataDir;
        isSystemUser = true;
        description = "Radarr service user";
        uid = config.ids.uids.radarr;
      };
    };

    users.groups = mkIf (cfg.group == "radarr") {
      radarr.gid = config.ids.gids.radarr;
    };
  };
}
