require 'test_helper'

class AddressGeocodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address_geocode = address_geocodes(:one)
  end

  test "should get index" do
    get address_geocodes_url
    assert_response :success
  end

  test "should get new" do
    get new_address_geocode_url
    assert_response :success
  end

  test "should create address_geocode" do
    assert_difference('AddressGeocode.count') do
      post address_geocodes_url, params: { address_geocode: { address: @address_geocode.address, latitude: @address_geocode.latitude, longtitude: @address_geocode.longtitude } }
    end

    assert_redirected_to address_geocode_url(AddressGeocode.last)
  end

  test "should show address_geocode" do
    get address_geocode_url(@address_geocode)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_geocode_url(@address_geocode)
    assert_response :success
  end

  test "should update address_geocode" do
    patch address_geocode_url(@address_geocode), params: { address_geocode: { address: @address_geocode.address, latitude: @address_geocode.latitude, longtitude: @address_geocode.longtitude } }
    assert_redirected_to address_geocode_url(@address_geocode)
  end

  test "should destroy address_geocode" do
    assert_difference('AddressGeocode.count', -1) do
      delete address_geocode_url(@address_geocode)
    end

    assert_redirected_to address_geocodes_url
  end
end
