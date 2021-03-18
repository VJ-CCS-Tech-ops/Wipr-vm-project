variable "vmname"{
  description = "name of the digitalrig vm"
  type = list(string)
  default = ["rigcorree","woorkflowtestingvm"]
}

variable "location"{
  type = string
  default = "southindia"
}

variable "imagename"{
  description = "name of the image"
  type = list(string)
  default = ["DB1AMI","DB2AMI"]
}

variable "vmimage" {
  description = “Variable for defining each instance”
  type = map(string)
  default = {
    rigcorree = DB1AMI
    woorkflowtestingvm = DB2AMI
  }
}
