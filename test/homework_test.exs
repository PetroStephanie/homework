defmodule HomeworkTest do
  # Import helpers
  use Hound.Helpers
  use ExUnit.Case

  # Start hound session and destroy when tests are run
  hound_session()

  test "goes to simple table" do
    navigate_to "https://qa-homework.divvy.co/simple_table"
    # :timer.sleep(5000)
      # element = find_element(:css, "button")
      # attribute_value(element, "ShowText--Button-1")
      element = find_element(:css, "h2")
      visible_text(element)
      IO.puts(element)
  end

  test "goes to complex form" do
    navigate_to "https://qa-homework.divvy.co/complex_form"


    input_into_field({:name, "firstName"}, "John")
    input_into_field({:name, "lastName"}, "Doe")
    input_into_field({:name, "email"}, "john.doe@email.com")
    input_into_field({:name, "phone"}, "801-553-2266")
    input_into_field({:name, "addressLine1"}, "P Sherman, 42 Wallaby Way")
    input_into_field({:name, "city"}, "Sandy")
    selectDropDown = find_element(:class, "MuiSelect-select")
    click(selectDropDown)
    stateSelection = input_into_field({:class, "MuiMenuItem-root"}, "Florida")
    click(stateSelection)
    inner_text("MuiMenuItem-root")



    deliveryDateSelection = find_element(:name, "deliveryDate")
    input_into_field(deliveryDateSelection, "04-04-2023")
    deliveryTimeSelection = find_element(:name, "deliveryTime")
    input_into_field(deliveryTimeSelection, "14:05")

    :timer.sleep(10000)
  end

  test "goes to file download" do
    navigate_to "https://qa-homework.divvy.co/file_download"
    downloadButton = find_element(:class, "MuiButton-root")
    click(downloadButton)


    :timer.sleep(5000)
  end
end
