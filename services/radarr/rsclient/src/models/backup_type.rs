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

/// 
#[derive(Clone, Copy, Debug, Eq, PartialEq, Ord, PartialOrd, Hash, Serialize, Deserialize)]
pub enum BackupType {
    #[serde(rename = "scheduled")]
    Scheduled,
    #[serde(rename = "manual")]
    Manual,
    #[serde(rename = "update")]
    Update,

}

impl std::fmt::Display for BackupType {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Self::Scheduled => write!(f, "scheduled"),
            Self::Manual => write!(f, "manual"),
            Self::Update => write!(f, "update"),
        }
    }
}

impl Default for BackupType {
    fn default() -> BackupType {
        Self::Scheduled
    }
}
