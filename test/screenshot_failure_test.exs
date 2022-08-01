defmodule ScreenshotFailureTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "failing login test" do
    navigate_to "https://the-internet.herokuapp.com/login"
    # Locate fields and enter login credentials.
    fill_field({:id, "username"}, "Divvy's next top Employee: Jaimi!")
    fill_field({:id, "password"}, "SuperSecretPassword!")
    # Submit form.
    submit_element({:css, "[type='submit']"})
    # Check for login failure.
    assert element_displayed?({:class, "success"})
  end
end
