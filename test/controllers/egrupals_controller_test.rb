require 'test_helper'

class EgrupalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @egrupal = egrupals(:one)
  end

  test "should get index" do
    get egrupals_url
    assert_response :success
  end

  test "should get new" do
    get new_egrupal_url
    assert_response :success
  end

  test "should create egrupal" do
    assert_difference('Egrupal.count') do
      post egrupals_url, params: { egrupal: { impreso_id: @egrupal.impreso_id, persona_id: @egrupal.persona_id } }
    end

    assert_redirected_to egrupal_url(Egrupal.last)
  end

  test "should show egrupal" do
    get egrupal_url(@egrupal)
    assert_response :success
  end

  test "should get edit" do
    get edit_egrupal_url(@egrupal)
    assert_response :success
  end

  test "should update egrupal" do
    patch egrupal_url(@egrupal), params: { egrupal: { impreso_id: @egrupal.impreso_id, persona_id: @egrupal.persona_id } }
    assert_redirected_to egrupal_url(@egrupal)
  end

  test "should destroy egrupal" do
    assert_difference('Egrupal.count', -1) do
      delete egrupal_url(@egrupal)
    end

    assert_redirected_to egrupals_url
  end
end
