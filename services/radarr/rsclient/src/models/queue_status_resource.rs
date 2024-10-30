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
pub struct QueueStatusResource {
    #[serde(rename = "id", skip_serializing_if = "Option::is_none")]
    pub id: Option<i32>,
    #[serde(rename = "totalCount", skip_serializing_if = "Option::is_none")]
    pub total_count: Option<i32>,
    #[serde(rename = "count", skip_serializing_if = "Option::is_none")]
    pub count: Option<i32>,
    #[serde(rename = "unknownCount", skip_serializing_if = "Option::is_none")]
    pub unknown_count: Option<i32>,
    #[serde(rename = "errors", skip_serializing_if = "Option::is_none")]
    pub errors: Option<bool>,
    #[serde(rename = "warnings", skip_serializing_if = "Option::is_none")]
    pub warnings: Option<bool>,
    #[serde(rename = "unknownErrors", skip_serializing_if = "Option::is_none")]
    pub unknown_errors: Option<bool>,
    #[serde(rename = "unknownWarnings", skip_serializing_if = "Option::is_none")]
    pub unknown_warnings: Option<bool>,
}

impl QueueStatusResource {
    pub fn new() -> QueueStatusResource {
        QueueStatusResource {
            id: None,
            total_count: None,
            count: None,
            unknown_count: None,
            errors: None,
            warnings: None,
            unknown_errors: None,
            unknown_warnings: None,
        }
    }
}

