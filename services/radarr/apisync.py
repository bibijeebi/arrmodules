#!/usr/bin/env python3

import json
import sys
from typing import Any, Dict
import urllib3
from datetime import datetime

from radarr_client import AuthenticatedClient
from radarr_client.api.host_config import get_api_v3_config_host
from radarr_client.api.ui_config import get_api_v3_config_ui
from radarr_client.api.download_client import get_api_v3_downloadclient
from radarr_client.api.indexer import get_api_v3_indexer
from radarr_client.api.media_management_config import get_api_v3_config_mediamanagement
from radarr_client.api.quality_profile import get_api_v3_qualityprofile
from radarr_client.api.custom_format import get_api_v3_customformat
from radarr_client.api.tag import get_api_v3_tag

# Disable SSL warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def parse_response(response):
    """Helper function to parse API responses consistently"""
    if response.status_code == 200:
        return json.loads(response.content.decode('utf-8'))
    return None

def get_client_settings(base_url: str, api_key: str) -> Dict[str, Any]:
    # Add protocol if not present
    if not base_url.startswith(('http://', 'https://')):
        base_url = f'http://{base_url}'
    
    client = AuthenticatedClient(
        base_url=base_url,
        token=api_key,
        verify_ssl=False,
    )

    settings: Dict[str, Any] = {
        "hostname": base_url.split("://")[1].split(":")[0],
        "port": int(base_url.split(":")[-1]) if ":" in base_url.split("://")[1] else 7878,
        "protocol": base_url.split("://")[0],
        "api_key": api_key,
        "settings": {}
    }

    try:
        # Get Host Configuration
        host_config_dict = parse_response(get_api_v3_config_host.sync_detailed(client=client))
        if host_config_dict:
            settings["settings"]["general"] = {
                "host": {
                    "bind_address": host_config_dict.get("bindAddress"),
                    "port": host_config_dict.get("port"),
                    "ssl_port": host_config_dict.get("sslPort"),
                    "use_ssl": host_config_dict.get("enableSsl"),
                    "ssl_cert_path": host_config_dict.get("sslCertPath"),
                    "ssl_cert_password": host_config_dict.get("sslCertPassword"),
                    "url_base": host_config_dict.get("urlBase"),
                    "instance_name": host_config_dict.get("instanceName")
                },
                "security": {
                    "authentication": host_config_dict.get("authenticationMethod"),
                    "username": host_config_dict.get("username"),
                    "password": None,  # Don't dump passwords
                    "certificate_validation": host_config_dict.get("certificateValidation")
                },
                "proxy": {
                    "enable": host_config_dict.get("proxyEnabled"),
                    "proxy_type": host_config_dict.get("proxyType"),
                    "hostname": host_config_dict.get("proxyHostname"),
                    "port": host_config_dict.get("proxyPort"),
                    "username": host_config_dict.get("proxyUsername"),
                    "password": None,  # Don't dump passwords
                    "bypass_proxy_for_local_addresses": host_config_dict.get("proxyBypassLocalAddresses"),
                    "ignored_addresses": [addr.strip() for addr in (host_config_dict.get("proxyBypassFilter") or "").split(",") if addr.strip()]
                },
                "logging": {
                    "log_level": host_config_dict.get("logLevel")
                },
                "analytics": {
                    "send_anonymous_usage_data": host_config_dict.get("analyticsEnabled")
                },
                "updates": {
                    "branch": host_config_dict.get("branch"),
                    "automatic": host_config_dict.get("updateAutomatically"),
                    "mechanism": host_config_dict.get("updateMechanism"),
                    "script_path": host_config_dict.get("updateScriptPath")
                },
                "backup": {
                    "folder": host_config_dict.get("backupFolder"),
                    "interval": host_config_dict.get("backupInterval"),
                    "retention": host_config_dict.get("backupRetention")
                }
            }

        # Get UI Configuration
        ui_config_dict = parse_response(get_api_v3_config_ui.sync_detailed(client=client))
        if ui_config_dict:
            settings["settings"]["ui"] = {
                "first_day_of_week": "monday" if ui_config_dict.get("firstDayOfWeek") == 1 else "sunday",
                "week_column_header": ui_config_dict.get("calendarWeekColumnHeader"),
                "runtime_format": ui_config_dict.get("movieRuntimeFormat"),
                "short_date_format": ui_config_dict.get("shortDateFormat"),
                "long_date_format": ui_config_dict.get("longDateFormat"),
                "time_format": ui_config_dict.get("timeFormat"),
                "show_relative_dates": ui_config_dict.get("showRelativeDates"),
                "enable_color_impaired_mode": ui_config_dict.get("enableColorImpairedMode"),
                "movie_info_language": ui_config_dict.get("movieInfoLanguage"),
                "ui_language": ui_config_dict.get("uiLanguage"),
                "theme": ui_config_dict.get("theme")
            }

        # Get Media Management Configuration
        media_config_dict = parse_response(get_api_v3_config_mediamanagement.sync_detailed(client=client))
        if media_config_dict:
            settings["settings"]["media_management"] = {
                "rename_movies": media_config_dict.get("autoRenameFolders"),
                "replace_illegal_characters": True,
                "colon_replacement": "dash",
                "standard_movie_format": "",  # This would need to come from naming config
                "movie_folder_format": "",  # This would need to come from naming config
                "create_missing_movie_folders": media_config_dict.get("createEmptyMovieFolders"),
                "delete_empty_folders": media_config_dict.get("deleteEmptyFolders"),
                "skip_free_space_check": media_config_dict.get("skipFreeSpaceCheckWhenImporting"),
                "minimum_free_space": media_config_dict.get("minimumFreeSpaceWhenImporting"),
                "use_hardlinks": media_config_dict.get("copyUsingHardlinks"),
                "import_using_script": False,
                "import_script_path": None,
                "import_extra_files": media_config_dict.get("importExtraFiles"),
                "extra_file_extensions": media_config_dict.get("extraFileExtensions"),
                "unmonitor_deleted_movies": media_config_dict.get("autoUnmonitorPreviouslyDownloadedMovies"),
                "propers_and_repacks": media_config_dict.get("downloadPropersAndRepacks"),
                "analyze_video_files": media_config_dict.get("enableMediaInfo"),
                "rescan_folder_after_refresh": media_config_dict.get("rescanAfterRefresh"),
                "change_file_date": media_config_dict.get("fileDate"),
                "recycling_bin": media_config_dict.get("recycleBin"),
                "recycling_bin_cleanup": media_config_dict.get("recycleBinCleanupDays"),
                "set_permissions": media_config_dict.get("setPermissionsLinux"),
                "chmod_folder": media_config_dict.get("chmodFolder"),
                "chown_group": media_config_dict.get("chownGroup")
            }

        # Get Download Clients
        download_clients_dict = parse_response(get_api_v3_downloadclient.sync_detailed(client=client))
        if download_clients_dict:
            settings["settings"]["download_clients"] = {
                "delete_unmanaged": False,
                "definitions": {
                    client.get("name"): {
                        "enable": client.get("enable"),
                        "priority": client.get("priority"),
                        "remove_completed": client.get("removeCompletedDownloads"),
                        "tags": client.get("tags", []),
                        **{k: v for k, v in client.items() if v is not None and k not in ['tags', 'enable', 'priority', 'removeCompletedDownloads']}
                    } for client in download_clients_dict
                }
            }

        # Get Indexers
        indexers_dict = parse_response(get_api_v3_indexer.sync_detailed(client=client))
        if indexers_dict:
            settings["settings"]["indexers"] = {
                "delete_unmanaged": False,
                "definitions": {
                    indexer.get("name"): {
                        "enable_rss": indexer.get("enableRss"),
                        "enable_automatic_search": indexer.get("enableAutomaticSearch"),
                        "enable_interactive_search": indexer.get("enableInteractiveSearch"),
                        "priority": indexer.get("priority"),
                        "download_client": None,
                        "tags": indexer.get("tags", []),
                        **{k: v for k, v in indexer.items() if v is not None and k not in ['tags', 'enableRss', 'enableAutomaticSearch', 'enableInteractiveSearch', 'priority']}
                    } for indexer in indexers_dict
                }
            }

        # Get Quality Profiles
        quality_profiles_dict = parse_response(get_api_v3_qualityprofile.sync_detailed(client=client))
        if quality_profiles_dict:
            settings["settings"]["profiles"] = {
                "quality_profiles": {
                    "delete_unmanaged": False,
                    "definitions": {
                        profile.get("name"): {
                            "upgrades_allowed": profile.get("upgradeAllowed"),
                            "qualities": [
                                qual.get("quality", {}).get("name")
                                for qual in profile.get("items", [])
                                if qual.get("quality") is not None
                            ],
                            "upgrade_until_quality": next((
                                qual.get("quality", {}).get("name")
                                for qual in profile.get("items", [])
                                if qual.get("quality") is not None
                            ), None),
                            "minimum_custom_format_score": profile.get("minFormatScore"),
                            "upgrade_until_custom_format_score": profile.get("cutoffFormatScore"),
                            "language": profile.get("language", {}).get("name")
                        } for profile in quality_profiles_dict
                    }
                }
            }

        # Get Custom Formats
        custom_formats_dict = parse_response(get_api_v3_customformat.sync_detailed(client=client))
        if custom_formats_dict:
            settings["settings"]["custom_formats"] = {
                "delete_unmanaged": False,
                "definitions": {
                    fmt.get("name"): {
                        "trash_id": None,
                        "include_when_renaming": fmt.get("includeCustomFormatWhenRenaming"),
                        "delete_unmanaged_conditions": False,
                        "conditions": {
                            spec.get("name"): {
                                "negate": spec.get("negate"),
                                "required": spec.get("required"),
                                "type": spec.get("implementation"),
                                **{k: v for k, v in spec.items() if v is not None}
                            } for spec in fmt.get("specifications", [])
                        }
                    } for fmt in custom_formats_dict
                }
            }

        # Get Tags
        tags_dict = parse_response(get_api_v3_tag.sync_detailed(client=client))
        if tags_dict:
            settings["settings"]["tags"] = {
                "definitions": [tag.get("label") for tag in tags_dict]
            }

    except Exception as e:
        print(f"Error fetching settings: {str(e)}", file=sys.stderr)
        raise

    return settings

def dump_settings(base_url: str, api_key: str, output_file: str | None = None) -> None:
    settings = get_client_settings(base_url, api_key)
    
    if output_file:
        with open(output_file, 'w') as f:
            json.dump(settings, f, indent=2)
        print(f"Settings dumped to {output_file}")
    else:
        print(json.dumps(settings, indent=2))

def main():
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} <base_url> <api_key> [output_file]")
        sys.exit(1)

    base_url = sys.argv[1]
    api_key = sys.argv[2]
    output_file = sys.argv[3] if len(sys.argv) > 3 else None

    try:
        dump_settings(base_url, api_key, output_file)
    except Exception as e:
        print(f"Error: {str(e)}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()