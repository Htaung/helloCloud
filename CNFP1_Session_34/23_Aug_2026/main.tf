locals  {
    pod_id = lower("${var.pod_name}-${random_string.suffix.id}")
    rds_credes ={
        username = var.rds_username
        password = var.rds_password
    }
  
}

output "pod_name"{
    value = local.pod_id
}

output "rds_credes"{
    value = local.rds_credes
}


resource "random_string" "suffix" {
  length           = 8
  special          = false
}

