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
pub enum Modifier {
    #[serde(rename = "none")]
    None,
    #[serde(rename = "regional")]
    Regional,
    #[serde(rename = "screener")]
    Screener,
    #[serde(rename = "rawhd")]
    Rawhd,
    #[serde(rename = "brdisk")]
    Brdisk,
    #[serde(rename = "remux")]
    Remux,

}

impl std::fmt::Display for Modifier {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Self::None => write!(f, "none"),
            Self::Regional => write!(f, "regional"),
            Self::Screener => write!(f, "screener"),
            Self::Rawhd => write!(f, "rawhd"),
            Self::Brdisk => write!(f, "brdisk"),
            Self::Remux => write!(f, "remux"),
        }
    }
}

impl Default for Modifier {
    fn default() -> Modifier {
        Self::None
    }
}
