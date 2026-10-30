terraform {
  encryption {
    method "aes_gcm" "default" {
      keys = key_provider.pbkdf2.main
    }

    state {
      method   = method.aes_gcm.default
      enforced = true
    }

    plan {
      method   = method.aes_gcm.default
      enforced = true
    }
  }
}