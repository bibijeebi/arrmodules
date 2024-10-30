/*
 * Radarr
 *
 * Radarr API docs
 *
 * The version of the OpenAPI document: 3.0.0
 * 
 * Generated by: https://openapi-generator.tech
 */

use crate::models;
use serde::{Deserialize, Serialize};

#[derive(Clone, Default, Debug, PartialEq, Serialize, Deserialize)]
pub struct DownloadClientBulkResource {
    #[serde(rename = "ids", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub ids: Option<Option<Vec<i32>>>,
    #[serde(rename = "tags", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub tags: Option<Option<Vec<i32>>>,
    #[serde(rename = "applyTags", skip_serializing_if = "Option::is_none")]
    pub apply_tags: Option<models::ApplyTags>,
    #[serde(rename = "enable", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub enable: Option<Option<bool>>,
    #[serde(rename = "priority", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub priority: Option<Option<i32>>,
    #[serde(rename = "removeCompletedDownloads", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub remove_completed_downloads: Option<Option<bool>>,
    #[serde(rename = "removeFailedDownloads", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub remove_failed_downloads: Option<Option<bool>>,
}

impl DownloadClientBulkResource {
    pub fn new() -> DownloadClientBulkResource {
        DownloadClientBulkResource {
            ids: None,
            tags: None,
            apply_tags: None,
            enable: None,
            priority: None,
            remove_completed_downloads: None,
            remove_failed_downloads: None,
        }
    }
}

