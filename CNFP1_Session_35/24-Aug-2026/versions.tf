terraform {
  cloud {
    organization = "aungcloud-tfc"
    hostname = "app.terraform.io"

    workspaces {
      name = "random-string-2"
    }
  }
}
