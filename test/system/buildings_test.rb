require "application_system_test_case"

class BuildingsTest < ApplicationSystemTestCase
  setup do
    @building = buildings(:one)
  end

  test "visiting the index" do
    visit buildings_url
    assert_selector "h1", text: "Buildings"
  end

  test "creating a Building" do
    visit buildings_url
    click_on "New Building"

    fill_in "Emailoftheadministratorofthebuilding", with: @building.EmailOfTheAdministratorOfTheBuilding
    fill_in "Fullnameofthebuildingadministrator", with: @building.FullNameOfTheBuildingAdministrator
    fill_in "Fullnameofthetechcontactforthebuilding", with: @building.FullNameOfTheTechContactForTheBuilding
    fill_in "Phonenumberofthebuildingadministrator", with: @building.PhoneNumberOfTheBuildingAdministrator
    fill_in "Techcontactemail", with: @building.TechContactEmail
    fill_in "Techcontactphone", with: @building.TechContactPhone
    click_on "Create Building"

    assert_text "Building was successfully created"
    click_on "Back"
  end

  test "updating a Building" do
    visit buildings_url
    click_on "Edit", match: :first

    fill_in "Emailoftheadministratorofthebuilding", with: @building.EmailOfTheAdministratorOfTheBuilding
    fill_in "Fullnameofthebuildingadministrator", with: @building.FullNameOfTheBuildingAdministrator
    fill_in "Fullnameofthetechcontactforthebuilding", with: @building.FullNameOfTheTechContactForTheBuilding
    fill_in "Phonenumberofthebuildingadministrator", with: @building.PhoneNumberOfTheBuildingAdministrator
    fill_in "Techcontactemail", with: @building.TechContactEmail
    fill_in "Techcontactphone", with: @building.TechContactPhone
    click_on "Update Building"

    assert_text "Building was successfully updated"
    click_on "Back"
  end

  test "destroying a Building" do
    visit buildings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Building was successfully destroyed"
  end
end
