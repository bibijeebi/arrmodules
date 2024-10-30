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
pub struct RenameMovieResource {
    #[serde(rename = "id", skip_serializing_if = "Option::is_none")]
    pub id: Option<i32>,
    #[serde(rename = "movieId", skip_serializing_if = "Option::is_none")]
    pub movie_id: Option<i32>,
    #[serde(rename = "movieFileId", skip_serializing_if = "Option::is_none")]
    pub movie_file_id: Option<i32>,
    #[serde(rename = "existingPath", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub existing_path: Option<Option<String>>,
    #[serde(rename = "newPath", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub new_path: Option<Option<String>>,
}

impl RenameMovieResource {
    pub fn new() -> RenameMovieResource {
        RenameMovieResource {
            id: None,
            movie_id: None,
            movie_file_id: None,
            existing_path: None,
            new_path: None,
        }
    }
}

