require "application_system_test_case"

class EquipeEscolarsTest < ApplicationSystemTestCase
  setup do
    @equipe_escolar = equipe_escolars(:one)
  end

  test "visiting the index" do
    visit equipe_escolars_url
    assert_selector "h1", text: "Equipe Escolars"
  end

  test "creating a Equipe escolar" do
    visit equipe_escolars_url
    click_on "New Equipe Escolar"

    fill_in "Cargo", with: @equipe_escolar.cargo
    fill_in "Nome", with: @equipe_escolar.nome
    fill_in "Turma", with: @equipe_escolar.turma_id
    click_on "Create Equipe escolar"

    assert_text "Equipe escolar was successfully created"
    click_on "Back"
  end

  test "updating a Equipe escolar" do
    visit equipe_escolars_url
    click_on "Edit", match: :first

    fill_in "Cargo", with: @equipe_escolar.cargo
    fill_in "Nome", with: @equipe_escolar.nome
    fill_in "Turma", with: @equipe_escolar.turma_id
    click_on "Update Equipe escolar"

    assert_text "Equipe escolar was successfully updated"
    click_on "Back"
  end

  test "destroying a Equipe escolar" do
    visit equipe_escolars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equipe escolar was successfully destroyed"
  end
end
