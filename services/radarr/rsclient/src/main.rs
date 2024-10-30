
use openapi::apis::{
    download_client_api,
    indexer_api,
    media_management_config_api,
    static_resource_api,
    configuration
};

#[tokio::main]
async fn main() {
    let config = configuration::Configuration::default();
    static_resource_api::root_get(&config, "/").await.unwrap();

    let download_client = download_client_api::api_v3_downloadclient_id_get(&config, 1).await.unwrap();
    println!("{:?}", download_client);

    let indexer = indexer_api::api_v3_indexer_id_get(&config, 1).await.unwrap();
    println!("{:?}", indexer);

    let media_management_config = media_management_config_api::api_v3_config_mediamanagement_get(&config).await.unwrap();
    println!("{:?}", media_management_config);
}
