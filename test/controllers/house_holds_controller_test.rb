require 'test_helper'

class HouseHoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house_hold = house_holds(:one)
  end

  test "should get index" do
    get house_holds_url
    assert_response :success
  end

  test "should get new" do
    get new_house_hold_url
    assert_response :success
  end

  test "should create house_hold" do
    assert_difference('HouseHold.count') do
      post house_holds_url, params: { house_hold: { description: @house_hold.description, name: @house_hold.name } }
    end

    assert_redirected_to house_hold_url(HouseHold.last)
  end

  test "should show house_hold" do
    get house_hold_url(@house_hold)
    assert_response :success
  end

  test "should get edit" do
    get edit_house_hold_url(@house_hold)
    assert_response :success
  end

  test "should update house_hold" do
    patch house_hold_url(@house_hold), params: { house_hold: { description: @house_hold.description, name: @house_hold.name } }
    assert_redirected_to house_hold_url(@house_hold)
  end

  test "should destroy house_hold" do
    assert_difference('HouseHold.count', -1) do
      delete house_hold_url(@house_hold)
    end

    assert_redirected_to house_holds_url
  end
end
