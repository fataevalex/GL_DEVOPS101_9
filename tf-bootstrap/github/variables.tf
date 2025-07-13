variable "namespace" {
  default = "flux-system"
}

variable "github_repo" {
  description = "GitHub repo full path exclude https://github.com"
}

variable "kubeconfig" {
  type        = string
  description = "kubeconfig path By default used KUBECONFIG or ~/.kube/config"
  default     = ""
}

variable "flux_cluster_path" {
  description = "kubernetes cluster name"
}

variable "github_token" {
  type = string
}