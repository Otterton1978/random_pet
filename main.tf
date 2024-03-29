terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.3"
    }
    null = {
      source = "hashicorp/null"
      version = "3.0.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "null" {
}

resource "random_pet" "name" {
  length = var.pet_name_length
}

resource "null_resource" "hello" {
    provisioner "local-exec" {
        command = "echo hello ${random_pet.name.id}"
    }
}

output "my_pet_name" {
    value = "${random_pet.name.id}"
}
