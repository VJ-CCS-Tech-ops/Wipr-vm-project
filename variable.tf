

variable "vmname"{
  description = "name of the image"
  type = list(string)
  default = ["vm1","vm2"]
}

variable "size"{
  description = "name of the image"
  type = list(string)
  default = ["Standard_F2","Standard_DS1_v2"]

}
/*

variable "size"{
  type = map(object({
    effect = string

   vmname1 = {
    "size"= "Standard_F2"

  }
  vmname2 = {
    "size" = "Standard_DS1_v2"
  }
  })
}
*/
