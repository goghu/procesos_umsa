require 'test_helper'

class DenunciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @denuncium = denuncia(:one)
  end

  test "should get index" do
    get denuncia_url
    assert_response :success
  end

  test "should get new" do
    get new_denuncium_url
    assert_response :success
  end

  test "should create denuncium" do
    assert_difference('Denuncium.count') do
      post denuncia_url, params: { denuncium: { carrera_id: @denuncium.carrera_id, ci: @denuncium.ci, codigo_caso: @denuncium.codigo_caso, direccion: @denuncium.direccion, facultad_id: @denuncium.facultad_id, fallo: @denuncium.fallo, fecha: @denuncium.fecha, nombre: @denuncium.nombre, observaciones: @denuncium.observaciones, ru_item: @denuncium.ru_item, telefono: @denuncium.telefono, tipo_pe_persona: @denuncium.tipo_pe_persona, tipo_resol: @denuncium.tipo_resol } }
    end

    assert_redirected_to denuncium_url(Denuncium.last)
  end

  test "should show denuncium" do
    get denuncium_url(@denuncium)
    assert_response :success
  end

  test "should get edit" do
    get edit_denuncium_url(@denuncium)
    assert_response :success
  end

  test "should update denuncium" do
    patch denuncium_url(@denuncium), params: { denuncium: { carrera_id: @denuncium.carrera_id, ci: @denuncium.ci, codigo_caso: @denuncium.codigo_caso, direccion: @denuncium.direccion, facultad_id: @denuncium.facultad_id, fallo: @denuncium.fallo, fecha: @denuncium.fecha, nombre: @denuncium.nombre, observaciones: @denuncium.observaciones, ru_item: @denuncium.ru_item, telefono: @denuncium.telefono, tipo_pe_persona: @denuncium.tipo_pe_persona, tipo_resol: @denuncium.tipo_resol } }
    assert_redirected_to denuncium_url(@denuncium)
  end

  test "should destroy denuncium" do
    assert_difference('Denuncium.count', -1) do
      delete denuncium_url(@denuncium)
    end

    assert_redirected_to denuncia_url
  end
end
