require 'test_helper'

class EquipeEscolarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipe_escolar = equipe_escolars(:one)
  end

  test "should get index" do
    get equipe_escolars_url
    assert_response :success
  end

  test "should get new" do
    get new_equipe_escolar_url
    assert_response :success
  end

  test "should create equipe_escolar" do
    assert_difference('EquipeEscolar.count') do
      post equipe_escolars_url, params: { equipe_escolar: { cargo: @equipe_escolar.cargo, nome: @equipe_escolar.nome, turma_id: @equipe_escolar.turma_id } }
    end

    assert_redirected_to equipe_escolar_url(EquipeEscolar.last)
  end

  test "should show equipe_escolar" do
    get equipe_escolar_url(@equipe_escolar)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipe_escolar_url(@equipe_escolar)
    assert_response :success
  end

  test "should update equipe_escolar" do
    patch equipe_escolar_url(@equipe_escolar), params: { equipe_escolar: { cargo: @equipe_escolar.cargo, nome: @equipe_escolar.nome, turma_id: @equipe_escolar.turma_id } }
    assert_redirected_to equipe_escolar_url(@equipe_escolar)
  end

  test "should destroy equipe_escolar" do
    assert_difference('EquipeEscolar.count', -1) do
      delete equipe_escolar_url(@equipe_escolar)
    end

    assert_redirected_to equipe_escolars_url
  end
end
