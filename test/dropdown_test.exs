defmodule DropdownTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "Dropdown selection test" do
    navigate_to "https://the-internet.herokuapp.com/dropdown"
    element_displayed?({:id, "dropdown"})
    click({:id, "dropdown"})
    click({:xpath, "//div/select/option[contains(text(), 'Option 1')]"})
    assert visible_text({:id, "dropdown"}) =~ "Option 1"
  end
end
