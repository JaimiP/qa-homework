defmodule HomeworkTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "goes to google" do
    navigate_to "http://google.com"
  end

  test "basic auth test" do
    # Pass in authentication info in URL.
    # This could also be done by assigning and referencing variables.
    navigate_to "https://admin:admin@the-internet.herokuapp.com/basic_auth"
    # =~ matches the term on the left against the string on the right.
    assert visible_page_text() =~ "Congratulations!"
  end
end
