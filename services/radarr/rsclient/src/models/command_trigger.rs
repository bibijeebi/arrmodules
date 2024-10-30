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
pub enum CommandTrigger {
    #[serde(rename = "unspecified")]
    Unspecified,
    #[serde(rename = "manual")]
    Manual,
    #[serde(rename = "scheduled")]
    Scheduled,

}

impl std::fmt::Display for CommandTrigger {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Self::Unspecified => write!(f, "unspecified"),
            Self::Manual => write!(f, "manual"),
            Self::Scheduled => write!(f, "scheduled"),
        }
    }
}

impl Default for CommandTrigger {
    fn default() -> CommandTrigger {
        Self::Unspecified
    }
}

