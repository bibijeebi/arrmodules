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
pub enum MovieHistoryEventType {
    #[serde(rename = "unknown")]
    Unknown,
    #[serde(rename = "grabbed")]
    Grabbed,
    #[serde(rename = "downloadFolderImported")]
    DownloadFolderImported,
    #[serde(rename = "downloadFailed")]
    DownloadFailed,
    #[serde(rename = "movieFileDeleted")]
    MovieFileDeleted,
    #[serde(rename = "movieFolderImported")]
    MovieFolderImported,
    #[serde(rename = "movieFileRenamed")]
    MovieFileRenamed,
    #[serde(rename = "downloadIgnored")]
    DownloadIgnored,

}

impl std::fmt::Display for MovieHistoryEventType {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            Self::Unknown => write!(f, "unknown"),
            Self::Grabbed => write!(f, "grabbed"),
            Self::DownloadFolderImported => write!(f, "downloadFolderImported"),
            Self::DownloadFailed => write!(f, "downloadFailed"),
            Self::MovieFileDeleted => write!(f, "movieFileDeleted"),
            Self::MovieFolderImported => write!(f, "movieFolderImported"),
            Self::MovieFileRenamed => write!(f, "movieFileRenamed"),
            Self::DownloadIgnored => write!(f, "downloadIgnored"),
        }
    }
}

impl Default for MovieHistoryEventType {
    fn default() -> MovieHistoryEventType {
        Self::Unknown
    }
}

