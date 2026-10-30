resource "github_repository" "repo_settings" {
  name        = "repo-settings"
  description = "OpenTofu config for managing my GitHub repositories"
  visibility  = "public"

  has_issues = true

  allow_squash_merge = false
  allow_merge_commit = false
  allow_rebase_merge = true

  delete_branch_on_merge = true
}