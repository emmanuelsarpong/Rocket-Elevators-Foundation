require "application_system_test_case"

class AddressGeocodesTest < ApplicationSystemTestCase
  setup do
    @address_geocode = address_geocodes(:one)
  end

  test "visiting the index" do
    visit address_geocodes_url
    assert_selector "h1", text: "Address Geocodes"
  end

  test "creating a Address geocode" do
    visit address_geocodes_url
    click_on "New Address Geocode"

    fill_in "Address", with: @address_geocode.address
    fill_in "Latitude", with: @address_geocode.latitude
    fill_in "Longtitude", with: @address_geocode.longtitude
    click_on "Create Address geocode"

    assert_text "Address geocode was successfully created"
    click_on "Back"
  end

  test "updating a Address geocode" do
    visit address_geocodes_url
    click_on "Edit", match: :first

    fill_in "Address", with: @address_geocode.address
    fill_in "Latitude", with: @address_geocode.latitude
    fill_in "Longtitude", with: @address_geocode.longtitude
    click_on "Update Address geocode"

    assert_text "Address geocode was successfully updated"
    click_on "Back"
  end

  test "destroying a Address geocode" do
    visit address_geocodes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address geocode was successfully destroyed"
  end
end
