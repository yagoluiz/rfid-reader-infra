module "rfid-asset-api" {
  source            = "../modules/webapp"
  service_plan_name = var.service_plan_name
  webapp_name       = var.webapp_name
}
