defmodule AuthTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "basic auth test" do
    # Pass in authentication info in URL.
    navigate_to "https://admin:admin@the-internet.herokuapp.com/basic_auth"
    # Confirm success message is visible.
    assert visible_page_text() =~ "Congratulations!"
  end

  test "basic auth invalid credentials test" do
    # Pass in invalid authentication info in URL.
    navigate_to "https://ADMIN:pass@the-internet.herokuapp.com/basic_auth"
    # Confirm success message is missing.
    refute visible_page_text() =~ "Congratulations!"
  end
end
