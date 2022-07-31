defmodule DropdownTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "Dropdown selection test" do
    navigate_to "https://the-internet.herokuapp.com/dropdown"
    # Check that dropdown is displayed.
    element_displayed?({:id, "dropdown"})
    # Click on dropdown
    click({:id, "dropdown"})
    # Click desired option, located using xpath.
    click({:xpath, "//div/select/option[contains(text(), 'Option 1')]"})
    # Make sure the visible text in the drop down matches the selected option.
    assert visible_text({:id, "dropdown"}) =~ "Option 1"
  end
end
