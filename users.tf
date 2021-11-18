# Please keep the list in alphabetical order

module "aaron_borden" {
  source = "./user"
  name   = "aaron.borden@gsa.gov"
  groups = [
    "developers",
    "Admin",
  ]
}

module "bret_mogilefsky" {
  source = "./user"
  name   = "bret.mogilefsky@gsa.gov"
  groups = [
    "developers",
    "Admin",
  ]
}

module "fuhu_xia" {
  source = "./user"
  name   = "fuhu.xia@gsa.gov"
  groups = [
    "developers",
  ]
}

module "james_brown" {
  source = "./user"
  name   = "jbrown@xentity.com"
  groups = [
    "developers",
  ]
}

module "kishore_vuppala" {
  source = "./user"
  name   = "kishore.vuppala@gsa.gov"
  groups = ["developers"]
}

module "nicholas_kumia" {
  source = "./user"
  name   = "nicholas.kumia@gsa.gov"
  groups = ["developers"]
}

