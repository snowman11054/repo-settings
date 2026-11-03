resource "github_repository_ruleset" "main" {
  name        = "protect-main"
  repository  = github_repository.repos["repo-settings"].name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    deletion                = true
    non_fast_forward        = true
    required_linear_history = true

    pull_request {
      required_approving_review_count = 0
      allowed_merge_methods           = ["rebase"]
    }

    required_status_checks {
      required_check {
        context = "checks"
      }
    }
  }
}
