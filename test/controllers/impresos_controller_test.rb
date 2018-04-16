require 'test_helper'

class ImpresosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @impreso = impresos(:one)
  end

  test "should get index" do
    get impresos_url
    assert_response :success
  end

  test "should get new" do
    get new_impreso_url
    assert_response :success
  end

  test "should create impreso" do
    assert_difference('Impreso.count') do
      post impresos_url, params: { impreso: { denuncium_id: @impreso.denuncium_id, personas_id: @impreso.personas_id, user_id: @impreso.user_id } }
    end

    assert_redirected_to impreso_url(Impreso.last)
  end

  test "should show impreso" do
    get impreso_url(@impreso)
    assert_response :success
  end

  test "should get edit" do
    get edit_impreso_url(@impreso)
    assert_response :success
  end

  test "should update impreso" do
    patch impreso_url(@impreso), params: { impreso: { denuncium_id: @impreso.denuncium_id, personas_id: @impreso.personas_id, user_id: @impreso.user_id } }
    assert_redirected_to impreso_url(@impreso)
  end

  test "should destroy impreso" do
    assert_difference('Impreso.count', -1) do
      delete impreso_url(@impreso)
    end

    assert_redirected_to impresos_url
  end
end
