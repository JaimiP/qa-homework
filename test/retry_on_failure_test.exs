defmodule RetryOnFailureTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "failing login retry test" do
    try do
      navigate_to "https://the-internet.herokuapp.com/login"
      # Locate fields and enter login credentials.
      fill_field({:id, "username"}, "Divvy's next top Employee: Jaimi!")
      fill_field({:id, "password"}, "SuperSecretPassword!")
      # Submit form.
      submit_element({:css, "[type='submit']"})
      # Check for login failure.
      assert element_displayed?({:class, "Oh no, this text doesn't exist!"})
    rescue
      for(i = 0; i < 1; i++){
        # Do I need to wrap the test in a function so I can call it here?
        # Will this for loop work? It works with Ruby but that doesn't mean much.
        # Ideally I'd find a way to combine this with the screenshot on failure and implement it for each test, but I'm not sure how to do that in Elixir/Hound yet.
      }
    end
  end
end
