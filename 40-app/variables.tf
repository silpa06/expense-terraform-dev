variable "project_name" {
 type = string 
 default = "expense"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "expense"
    Environment = "dev"
    Terraform = true
  }
}

variable "mysql_tags" {
  default = {
    Component = "mysql"
  }
}

variable "backend_tags" {
  default = {
    Component = "backend"
  }
}

variable "frontend_tags" {
  default = {
    Component = "frontend"

  }
}

variable "ansible_tags" {
  default = {
    Component = "ansible"
  }
}









