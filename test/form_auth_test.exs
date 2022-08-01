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
  end

  test "incorrect password login test" do
    navigate_to "https://the-internet.herokuapp.com/login"
    # Locate correct field and enter correct username.
    click(find_element(:id, "username"))
    send_text("tomsmith")
    # Locate correct field and enter correct password.
    click(find_element(:id, "password"))
    send_text("AWrongPassword123")
    # Submit form.
    submit_element({:css, "[type='submit']"})
    # Check for login failure.
    assert visible_page_text() =~ "password is invalid"
  end

  test "incorrect username login test" do
    navigate_to "https://the-internet.herokuapp.com/login"
    # Locate fields and enter login credentials.
    fill_field({:id, "username"}, "Divvy's next top Employee: Jaimi!")
    fill_field({:id, "password"}, "SuperSecretPassword!")
    # Submit form.
    submit_element({:css, "[type='submit']"})
    # Check for login failure.
    assert visible_page_text() =~ "username is invalid"
  end
end
