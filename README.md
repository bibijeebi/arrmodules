# Radarr Configuration Guide

## Overview
This guide details the configuration process for Radarr in a NixOS environment, including both initial setup and advanced configuration through the API.

## NixOS Module Extension

### Disabling Default Module
```nix
disabledModules = [ "<nixos/modules/misc/radarr.nix>" ]
```

### Custom Module Implementation
1. Base the custom module on the disabled default
2. Add additional configuration options as needed

## Configuration Process

### 1. Initial Setup (config.xml)
- Location: `$HOME/.config/Radarr` (when run as nixpkg)
- Must be configured before first service start
- Handles basic service configuration

```xml
<Config>
  <BindAddress>*</BindAddress>
  <Port>7878</Port>
  <SslPort>9898</SslPort>
  <EnableSsl>False</EnableSsl>
  <LaunchBrowser>True</LaunchBrowser>
  <ApiKey>93099ad47ee546acb569d8d5b7a5eb2c</ApiKey>
  <AuthenticationMethod>Basic</AuthenticationMethod>
  <AuthenticationRequired>Enabled</AuthenticationRequired>
  <Branch>master</Branch>
  <LogLevel>debug</LogLevel>
  <UrlBase></UrlBase>
  <InstanceName>Radarr</InstanceName>
</Config>
```

### 2. Service Configuration Steps
1. **PreStart**: Write initial configuration from NixOS module options
2. **PostStart**: Configure via API calls

### 3. Configuration Management
Two approaches for managing configuration:

#### Option 1: Line-by-Line API Calls
1. GET request to check current setting
2. POST/PUT/DELETE request if modification needed
3. Repeat until all settings match desired state

#### Option 2: Database Comparison
1. Hash comparison of current vs desired state
2. Dump and diff databases if mismatch
3. Apply necessary changes

### 4. Configuration Dumping
Use Buildarr to extract current configuration:
```bash
buildarr radarr dump-config http://localhost:7878 > radarr.yml
```

The resulting YAML contains all possible configuration options, including:
- Media management settings
- Quality profiles
- Custom formats
- Indexer configurations
- Download client settings
- Notification settings
- UI preferences

## Example Configuration Structure
```yaml
hostname: localhost
port: 7878
protocol: http
settings:
  media_management:
    # Media handling settings
    rename_movies: true
    replace_illegal_characters: true
    # ... other media settings ...

  profiles:
    # Quality and delay profiles
    quality_profiles:
      # ... quality settings ...
    delay_profiles:
      # ... delay settings ...

  indexers:
    # Indexer configurations
    minimum_age: 0
    retention: 0
    # ... indexer definitions ...

  download_clients:
    # Download client settings
    definitions:
      Transmission:
        # ... transmission settings ...

  general:
    # General service settings
    host:
      # ... host settings ...
    security:
      # ... security settings ...
```

## Notes
- Configuration should be idempotent
- API key from config.xml required for API access
- Consider using structured error handling for API calls
- Backup configuration before making changes
