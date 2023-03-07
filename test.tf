resource "google_service_account" "test_service_account" {
  project      = "tf-state-00"
  account_id   = "testservice-account-xxxxx"
  display_name = "Service Account"
}
