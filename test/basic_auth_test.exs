defmodule AuthTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "basic auth test" do
    # Pass in authentication info in URL.
    navigate_to "https://admin:admin@the-internet.herokuapp.com/basic_auth"
    # =~ matches the term on the left against the string on the right.
    assert visible_page_text() =~ "Congratulations!"
  end

  test "basic auth invalid credentials test" do
    # Pass in authentication info in URL.
    navigate_to "https://ADMIN:pass@the-internet.herokuapp.com/basic_auth"
    # =~ matches the term on the left against the string on the right.
    refute visible_page_text() =~ "Congratulations!"
  end
end
