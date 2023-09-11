module "wif" {
  source = "./module"

  project_id = var.project_id
  pool_id    = "my-pool"
  wif_providers = [
    { provider_id     = "my-provider-1"
      select_provider = "oidc"
      provider_config = {
        issuer_uri        = "https://token.actions.githubusercontent.com"
      }
      disabled            = false
      attribute_condition = "\"e968c2ef-047c-498d-8d79-16ca1b61e77e\" in assertion.groups"
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
      attribute      = "attribute.repository/my-org/my-repo"
      all_identities = true
      roles          = ["roles/compute.admin"]
    }
  ]
}