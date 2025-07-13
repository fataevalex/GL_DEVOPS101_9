resource "kubernetes_namespace" "flux" {
  metadata {
    name = var.namespace
  }
}



resource "flux_bootstrap_git" "flux" {
  embedded_manifests = true
  path   = "clusters/${var.flux_cluster_path}"


}