require 'test_helper'

class ListaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listum = lista(:one)
  end

  test "should get index" do
    get lista_url
    assert_response :success
  end

  test "should get new" do
    get new_listum_url
    assert_response :success
  end

  test "should create listum" do
    assert_difference('Listum.count') do
      post lista_url, params: { listum: { borrado: @listum.borrado, descripcion: @listum.descripcion, nombre: @listum.nombre } }
    end

    assert_redirected_to listum_url(Listum.last)
  end

  test "should show listum" do
    get listum_url(@listum)
    assert_response :success
  end

  test "should get edit" do
    get edit_listum_url(@listum)
    assert_response :success
  end

  test "should update listum" do
    patch listum_url(@listum), params: { listum: { borrado: @listum.borrado, descripcion: @listum.descripcion, nombre: @listum.nombre } }
    assert_redirected_to listum_url(@listum)
  end

  test "should destroy listum" do
    assert_difference('Listum.count', -1) do
      delete listum_url(@listum)
    end

    assert_redirected_to lista_url
  end
end
