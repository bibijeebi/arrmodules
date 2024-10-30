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
pub enum UpdateMechanism {
    #[serde(rename = "builtIn")]
    BuiltIn,
    #[serde(rename = "script")]
    Script,
    #[serde(rename = "external")]
    External,
    #[serde(rename = "apt")]
    Apt,
    #[serde(rename = "docker")]
    Docker,

}

impl std::fmt::Display for UpdateMechanism {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Self::BuiltIn => write!(f, "builtIn"),
            Self::Script => write!(f, "script"),
            Self::External => write!(f, "external"),
            Self::Apt => write!(f, "apt"),
            Self::Docker => write!(f, "docker"),
        }
    }
}

impl Default for UpdateMechanism {
    fn default() -> UpdateMechanism {
        Self::BuiltIn
    }
}
