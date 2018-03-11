require 'test_helper'

class ElegidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @elegido = elegidos(:one)
  end

  test "should get index" do
    get elegidos_url
    assert_response :success
  end

  test "should get new" do
    get new_elegido_url
    assert_response :success
  end

  test "should create elegido" do
    assert_difference('Elegido.count') do
      post elegidos_url, params: { elegido: { borrado: @elegido.borrado, cargo_id: @elegido.cargo_id, fecha: @elegido.fecha, lista: @elegido.lista, persona_id: @elegido.persona_id } }
    end

    assert_redirected_to elegido_url(Elegido.last)
  end

  test "should show elegido" do
    get elegido_url(@elegido)
    assert_response :success
  end

  test "should get edit" do
    get edit_elegido_url(@elegido)
    assert_response :success
  end

  test "should update elegido" do
    patch elegido_url(@elegido), params: { elegido: { borrado: @elegido.borrado, cargo_id: @elegido.cargo_id, fecha: @elegido.fecha, lista: @elegido.lista, persona_id: @elegido.persona_id } }
    assert_redirected_to elegido_url(@elegido)
  end

  test "should destroy elegido" do
    assert_difference('Elegido.count', -1) do
      delete elegido_url(@elegido)
    end

    assert_redirected_to elegidos_url
  end
end
