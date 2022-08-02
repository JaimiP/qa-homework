defmodule ScreenshotFailureTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "failing login screenshot test" do
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
        test_name = "login image test"
        dt_now = DateTime.utc_now
        #truncate date time to remove miliseconds
        trunc_dt = DateTime.truncate(dt_now, :second)
        # change type to string
        tdt_string = DateTime.to_string(trunc_dt)
        # remove Z from end of string and replace with default time zone.
        tdt_noz = String.replace(tdt_string, "Z", " utc")
        # remove : and replace with . so that file name is possible.
        tdt_clean = String.replace(tdt_noz, ":", ".")
        take_screenshot("./screenshots/#{test_name} #{tdt_clean}.png")
        raise error
    end
  end

  test "failing dropdown screenshot test" do
    try do
      navigate_to "https://the-internet.herokuapp.com/dropdown"
      # Check that dropdown is displayed.
      element_displayed?({:id, "dropdown"})
      # Click on dropdown
      click({:id, "dropdown"})
      # Click desired option, located using xpath.
      click({:xpath, "//div/select/option[contains(text(), 'Option 1')]"})
      # Make sure the visible text in the drop down matches the selected option.
      assert visible_text({:id, "dropdown"}) =~ "Forcing failure"
    rescue
      error ->
        test_name = "dropdown image test"
        dt_now = DateTime.utc_now
        #truncate date time to remove miliseconds
        trunc_dt = DateTime.truncate(dt_now, :second)
        # change type to string
        tdt_string = DateTime.to_string(trunc_dt)
        # remove Z from end of string and replace with default time zone.
        tdt_noz = String.replace(tdt_string, "Z", " utc")
        # remove : and replace with . so that file name is possible.
        tdt_clean = String.replace(tdt_noz, ":", ".")
        take_screenshot("./screenshots/#{test_name} #{tdt_clean}.png")
        raise error
    end
  end
end
