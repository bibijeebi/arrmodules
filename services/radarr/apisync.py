#!/usr/bin/env python3

import json
import sys
from typing import Any, Dict
import urllib3

from radarr_client import AuthenticatedClient
from radarr_client.api.host_config import put_config_host_id
from radarr_client.api.ui_config import put_config_ui_id
from radarr_client.api.download_client import put_download_client_id
from radarr_client.api.indexer import put_indexer_id
from radarr_client.api.media_management_config import put_config_mediamanagement_id
from radarr_client.api.quality_definition import put_qualitydefinition_update
from radarr_client.api.quality_profile import put_qualityprofile_id
from radarr_client.api.naming_config import put_config_naming_id
from radarr_client.api.metadata_config import put_config_metadata_id

from radarr_client.models.host_config_resource import HostConfigResource
from radarr_client.models.ui_config_resource import UiConfigResource
from radarr_client.models.download_client_resource import DownloadClientResource
from radarr_client.models.indexer_resource import IndexerResource
from radarr_client.models.media_management_config_resource import MediaManagementConfigResource
from radarr_client.models.quality_definition_resource import QualityDefinitionResource
from radarr_client.models.quality_profile_resource import QualityProfileResource
from radarr_client.models.naming_config_resource import NamingConfigResource
from radarr_client.models.metadata_config_resource import MetadataConfigResource

# Disable SSL warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def load_settings(filename: str) -> Dict[str, Any]:
    with open(filename) as f:
        return json.load(f)

def configure_radarr(base_url: str, api_key: str, settings: Dict[str, Any]) -> None:
    client = AuthenticatedClient(
        base_url=base_url,
        token=api_key,
        verify_ssl=False,
    )

    # Host Configuration
    host_settings = settings["settings"]["general"]["host"]
    host_config = HostConfigResource(
        id=1,  # Usually 1 for single config
        bind_address=host_settings["bind_address"],
        port=host_settings["port"],
        ssl_port=host_settings["ssl_port"],
        enable_ssl=host_settings["use_ssl"],
        url_base=host_settings["url_base"],
        instance_name=host_settings["instance_name"],
    )
    put_config_host_id.sync_detailed(client=client, id="1", json_body=host_config)

    # UI Configuration
    ui_settings = settings["settings"]["ui"]
    ui_config = UiConfigResource(
        id=1,
        first_day_of_week=1 if ui_settings["first_day_of_week"] == "monday" else 0,
        calendar_week_column_header=ui_settings["week_column_header"],
        movie_runtime_format=ui_settings["runtime_format"],
        short_date_format=ui_settings["short_date_format"],
        long_date_format=ui_settings["long_date_format"],
        time_format=ui_settings["time_format"],
        show_relative_dates=ui_settings["show_relative_dates"],
        enable_color_impaired_mode=ui_settings["enable_color_impaired_mode"],
        theme=ui_settings["theme"],
    )
    put_config_ui_id.sync_detailed(client=client, id="1", json_body=ui_config)

    # Media Management Configuration
    media_settings = settings["settings"]["media_management"]
    media_config = MediaManagementConfigResource(
        id=1,
        auto_unmonitor_previously_downloaded_movies=media_settings.get("unmonitor_deleted_movies", False),
        recycle_bin=media_settings.get("recycling_bin"),
        recycle_bin_cleanup_days=media_settings.get("recycling_bin_cleanup", 7),
        download_propers_and_repacks=media_settings.get("propers_and_repacks", "doNotPrefer"),
        create_empty_movie_folders=media_settings.get("create_missing_movie_folders", False),
        delete_empty_folders=media_settings.get("delete_empty_folders", False),
        file_date=media_settings.get("change_file_date", "none"),
        rescan_after_refresh=media_settings.get("rescan_folder_after_refresh", "always"),
        auto_rename_folders=media_settings.get("rename_movies", True),
        paths_default_static=True,
        set_permissions_linux=media_settings.get("set_permissions", False),
        chmod_folder=media_settings.get("chmod_folder", "755"),
        chown_group=media_settings.get("chown_group"),
        skip_free_space_check_when_importing=media_settings.get("skip_free_space_check", False),
        minimum_free_space_when_importing=media_settings.get("minimum_free_space", 100),
        copy_using_hardlinks=media_settings.get("use_hardlinks", True),
        import_extra_files=media_settings.get("import_extra_files", False),
        extra_file_extensions=media_settings.get("extra_file_extensions", ""),
        enable_media_info=True,
    )
    put_config_mediamanagement_id.sync_detailed(client=client, id="1", json_body=media_config)

    # Add more configuration sections as needed for your use case

def main():
    if len(sys.argv) != 4:
        print(f"Usage: {sys.argv[0]} <base_url> <api_key> <settings_file>")
        sys.exit(1)

    base_url = sys.argv[1]
    api_key = sys.argv[2]
    settings_file = sys.argv[3]

    settings = load_settings(settings_file)
    configure_radarr(base_url, api_key, settings)

if __name__ == "__main__":
    main()