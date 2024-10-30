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
pub struct LogResource {
    #[serde(rename = "id", skip_serializing_if = "Option::is_none")]
    pub id: Option<i32>,
    #[serde(rename = "time", skip_serializing_if = "Option::is_none")]
    pub time: Option<String>,
    #[serde(rename = "exception", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub exception: Option<Option<String>>,
    #[serde(rename = "exceptionType", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub exception_type: Option<Option<String>>,
    #[serde(rename = "level", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub level: Option<Option<String>>,
    #[serde(rename = "logger", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub logger: Option<Option<String>>,
    #[serde(rename = "message", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub message: Option<Option<String>>,
    #[serde(rename = "method", default, with = "::serde_with::rust::double_option", skip_serializing_if = "Option::is_none")]
    pub method: Option<Option<String>>,
}

impl LogResource {
    pub fn new() -> LogResource {
        LogResource {
            id: None,
            time: None,
            exception: None,
            exception_type: None,
            level: None,
            logger: None,
            message: None,
            method: None,
        }
    }
}
