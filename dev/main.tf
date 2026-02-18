resource "auth0_client" "test_app" {
  name     = "terraform-test-Rex"
  app_type = "regular_web"
}
resource "auth0_action" "add_claim" {
  name    = "add-custom-claim"
  runtime = "node18"
  deploy  = true

  code = <<EOT
exports.onExecutePostLogin = async (event, api) => {
  api.idToken.setCustomClaim(
    "https://example.com/role",
    "user"
  );
};
EOT

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }
}
