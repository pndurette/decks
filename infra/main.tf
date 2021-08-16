# Google Cloud Storage bucket with decks files
# * <name> must be the domain name
# * DNS must be validated with https://search.google.com/search-console
# * TXT record <name>, contents 'google-site-verification=...' (from above)
# * CNAME record <name>, contents 'c.storage.googleapis.com'
# * Service Account email running this must be a domain owner
#  (https://cloud.google.com/storage/docs/domain-name-verification#additional_verified_owners)

resource "google_storage_bucket" "decks_site" {
  name          = var.decks_domain
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  website {
    main_page_suffix = "index.html"
  }
}

# Google Cloud Storage bucket IAM binding
# Give 'roles/storage.legacyObjectReader' to 'allUsers' because
# 'roles/storage.objectViewer' allows bucket listing

resource "google_storage_bucket_iam_binding" "decks_site_binding" {
  bucket = google_storage_bucket.decks_site.name
  role   = "roles/storage.legacyObjectReader"
  members = [
    "allUsers"
  ]
}
