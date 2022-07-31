defmodule FormAuthTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "successful login test" do
    navigate_to "https://the-internet.herokuapp.com/login"
    # Locate correct field and enter correct username.
    click(find_element(:id, "username"))
    send_text("tomsmith")
    # Locate correct field and enter correct password.
    click(find_element(:id, "password"))
    send_text("SuperSecretPassword!")
    # Submit form.
    submit_element({:css, "[type='submit']"})
    # Check for success alert presence.
    assert element_displayed?({:class, "success"})
    # Could also be verified with URL change, presence of logout button, or successful API response.
  end

  test "" do

  end
end
