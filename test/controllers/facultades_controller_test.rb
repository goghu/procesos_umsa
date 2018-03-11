require 'test_helper'

class FacultadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facultade = facultades(:one)
  end

  test "should get index" do
    get facultades_url
    assert_response :success
  end

  test "should get new" do
    get new_facultade_url
    assert_response :success
  end

  test "should create facultade" do
    assert_difference('Facultade.count') do
      post facultades_url, params: { facultade: { borrado: @facultade.borrado, estado: @facultade.estado, nombre: @facultade.nombre, observaciones: @facultade.observaciones } }
    end

    assert_redirected_to facultade_url(Facultade.last)
  end

  test "should show facultade" do
    get facultade_url(@facultade)
    assert_response :success
  end

  test "should get edit" do
    get edit_facultade_url(@facultade)
    assert_response :success
  end

  test "should update facultade" do
    patch facultade_url(@facultade), params: { facultade: { borrado: @facultade.borrado, estado: @facultade.estado, nombre: @facultade.nombre, observaciones: @facultade.observaciones } }
    assert_redirected_to facultade_url(@facultade)
  end

  test "should destroy facultade" do
    assert_difference('Facultade.count', -1) do
      delete facultade_url(@facultade)
    end

    assert_redirected_to facultades_url
  end
end
