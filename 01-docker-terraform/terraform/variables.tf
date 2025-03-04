variable "project" {
  description = "Project name"
  default     = "de-zoomcamp-449017"
}

variable "credentials" {
    description = "Path to the service account key file"
    default     = "./keys/key.json"
}

variable "region" {
  description = "Project Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery dataset name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage bucket name"
  default     = "de-zoomcamp-449017-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket storage class"
  default     = "STANDARD"

}