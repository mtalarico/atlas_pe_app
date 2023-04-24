provider "aws" {

}
provider "mongodbatlas" {
  public_key  = var.atlas.public_key
  private_key = var.atlas.private_key
}
