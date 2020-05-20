provider "google" {
 # To use Service Account Key either set env var in your shell as shown below
 # export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account-key.json
 # or set credentials option as shown below 
 #credentials = file("/path/to/service-account-key.json")
 project     = var.project_id
 region      = "us-central1"
}
