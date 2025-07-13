terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.10.0"
    }

    flux = {
      source = "fluxcd/flux"
      version = ">=1.6.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "kubernetes" {
  config_path = var.kubeconfig != "" ? var.kubeconfig : null
}


provider "flux" {
  kubernetes  = {
    config_path = var.kubeconfig != "" ? var.kubeconfig : null
  }
  git = {
    url = "https://github.com/${var.github_repo}.git"
    http = {
      username = "git" # This can be any string when using a personal access token
      password = var.github_token
    }
    branch = "main"
  }
}

