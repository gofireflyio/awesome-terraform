module "lots_of_vars" {
  source = "github.com/infralight/hcl-indexing-test-repo//modules/lots_of_vars"

  with_ugly_validation        = "sdsdsdsdsd"
  nullable_string             = "small"
  with_description_no_default = "fopp"
  number_without_default      = 7
  with_validation             = "gdfdfd"
}
