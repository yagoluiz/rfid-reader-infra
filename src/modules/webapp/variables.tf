variable "location" {
  default = "eastus"
}

variable "apps" {
  type = map(object({
    rg_group_name     = string
    service_plan_name = string
    webapp_name       = string
    app_insights_name = string
  }))
}
