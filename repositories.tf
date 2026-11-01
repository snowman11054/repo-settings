locals {
  repos = {
    "repo-settings"    = { description = "OpenTofu config for managing my GitHub repositories" }
    "code-standards"   = { description = "Shared code style guides and standards" }
    "package-template" = { description = "Template for starting new packages" }
  }
}

resource "github_repository" "repos" {
  for_each = local.repos

  name        = each.key
  description = each.value.description
  visibility  = "public"

  has_issues = true

  allow_squash_merge = false
  allow_merge_commit = false
  allow_rebase_merge = true

  delete_branch_on_merge = true
}

moved {
  from = github_repository.repo_settings
  to   = github_repository.repos["repo-settings"]
}