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
pub enum ProperDownloadTypes {
    #[serde(rename = "preferAndUpgrade")]
    PreferAndUpgrade,
    #[serde(rename = "doNotUpgrade")]
    DoNotUpgrade,
    #[serde(rename = "doNotPrefer")]
    DoNotPrefer,

}

impl std::fmt::Display for ProperDownloadTypes {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Self::PreferAndUpgrade => write!(f, "preferAndUpgrade"),
            Self::DoNotUpgrade => write!(f, "doNotUpgrade"),
            Self::DoNotPrefer => write!(f, "doNotPrefer"),
        }
    }
}

impl Default for ProperDownloadTypes {
    fn default() -> ProperDownloadTypes {
        Self::PreferAndUpgrade
    }
}
