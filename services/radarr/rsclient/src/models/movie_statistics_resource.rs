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
pub struct MovieStatisticsResource {
    #[serde(rename = "movieFileCount", skip_serializing_if = "Option::is_none")]
    pub movie_file_count: Option<i32>,
    #[serde(rename = "sizeOnDisk", skip_serializing_if = "Option::is_none")]
    pub size_on_disk: Option<i64>,
    #[serde(rename = "releaseGroups", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub release_groups: Option<Option<Vec<String>>>,
}

impl MovieStatisticsResource {
    pub fn new() -> MovieStatisticsResource {
        MovieStatisticsResource {
            movie_file_count: None,
            size_on_disk: None,
            release_groups: None,
        }
    }
}

