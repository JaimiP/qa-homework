defmodule ScreenshotFailureTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "failing screenshot test" do
    try do
      navigate_to "https://the-internet.herokuapp.com/login"
      # Locate fields and enter login credentials.
      fill_field({:id, "username"}, "Divvy's next top Employee: Jaimi!")
      fill_field({:id, "password"}, "SuperSecretPassword!")
      # Submit form.
      submit_element({:css, "[type='submit']"})
      # Check for login failure.
      assert element_displayed?({:class, "success"})
    rescue
      error ->
        test_name = "screenshot test"
        # I'd love to chat about this section.
        # I tried to implement a timestamp in the screenshot title so that locating a specific failed test image would be easy.
        # I ran out of time trying to do so.
        take_screenshot("./screenshots/#{test_name}.png")
        raise error
    end
  end
end
