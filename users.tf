module "test_iam" {
  source = "./user"
  name   = "test_iam"
  groups = ["developers"]
}

module "test_iam2" {
  source = "./user"
  name   = "test_iam2"
  groups = ["developers"]
}

module "aaron_borden" {
  source = "./user"
  name   = "aaron.borden@gsa.gov"
  groups = [
    "developers",
    "Admin"
  ]
}
