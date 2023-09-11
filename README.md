# GCP Worload Identity Federation Multi Provider Module
The Workload identity federation module is used to impersonate a gcp service account from the credentials issued by an external identity provider and access resources on Google Cloud. 
This module will create pool,providers(aws/oidc)and service account used for setting up workload identity federation.
## Roles Needed

* roles/iam.workloadIdentityPoolAdmin
* roles/iam.serviceAccountAdmin


## Enable Apis and Services
* cloudresourcemanager.googleapis.com
* iam.googleapis.com
* iamcredentials.googleapis.com
* sts.googleapis.com


## Sample Usage
```hcl

module "wif" {
  source = "./module"

  project_id = var.project_id
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

```