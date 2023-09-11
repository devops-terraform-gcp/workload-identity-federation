module "wif" {
  source = "./module"

  project_id = var.PROJECT_ID
  pool_id    = "my-pool-${random_id.name.hex}"
  wif_providers = [
    { provider_id     = "my-provider-1"
      select_provider = "oidc"
      provider_config = {
        issuer_uri = "https://token.actions.githubusercontent.com"
      }
      disabled = false
      attribute_mapping = {
        "attribute.actor"      = "assertion.actor"
        "attribute.repository" = "assertion.repository"
        "google.subject"       = "assertion.sub"
      }
    }
  ]
  service_accounts = [
    {
      name           = "wif-sa-1"
      attribute      = "attribute.repository/devops-terraform-gcp/workload-identity-federation"
      all_identities = true
      roles          = ["roles/iam.workloadIdentityUser", "roles/compute.admin"]
    }
  ]
}

resource "random_id" "name" {
  byte_length = 2
}