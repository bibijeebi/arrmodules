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
pub enum AddMovieMethod {
    #[serde(rename = "manual")]
    Manual,
    #[serde(rename = "list")]
    List,
    #[serde(rename = "collection")]
    Collection,

}

impl std::fmt::Display for AddMovieMethod {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Self::Manual => write!(f, "manual"),
            Self::List => write!(f, "list"),
            Self::Collection => write!(f, "collection"),
        }
    }
}

impl Default for AddMovieMethod {
    fn default() -> AddMovieMethod {
        Self::Manual
    }
}

