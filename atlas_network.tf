resource "mongodbatlas_privatelink_endpoint" "aws_app" {
  project_id    = var.atlas.project_id
  provider_name = "AWS"
  region        = var.aws.region
}

resource "mongodbatlas_privatelink_endpoint_service" "aws_app" {
  project_id          = mongodbatlas_privatelink_endpoint.aws_app.project_id
  private_link_id     = mongodbatlas_privatelink_endpoint.aws_app.id
  endpoint_service_id = aws_vpc_endpoint.atlas_interface.id
  provider_name       = "AWS"
}
