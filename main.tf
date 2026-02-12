resource "auth0_client" "test_app" {
  name     = "terraform-test-Rex"
  app_type = "regular_web"
}
