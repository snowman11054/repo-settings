resource "github_repository_vulnerability_alerts" "alerts" {
  for_each   = local.repos
  repository = github_repository.repos[each.key].name
  enabled    = true
}

resource "github_repository_dependabot_security_updates" "updates" {
  for_each   = local.repos
  repository = github_repository.repos[each.key].name
  enabled    = true

  depends_on = [github_repository_vulnerability_alerts.alerts]
}
