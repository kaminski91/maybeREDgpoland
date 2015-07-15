require 'test_helper'

class TranslationsControllerTest < ActionController::TestCase
  setup do
    @translation = translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create translation" do
    assert_difference('Translation.count') do
      post :create, translation: { aboutHeader_en: @translation.aboutHeader_en, aboutHeader_it: @translation.aboutHeader_it, aboutHeader_pl: @translation.aboutHeader_pl, carieerHeader_en: @translation.carieerHeader_en, carieerHeader_it: @translation.carieerHeader_it, carieerHeader_pl: @translation.carieerHeader_pl, contactFollow_en: @translation.contactFollow_en, contactFollow_it: @translation.contactFollow_it, contactFollow_pl: @translation.contactFollow_pl, contactHeader_en: @translation.contactHeader_en, contactHeader_it: @translation.contactHeader_it, contactHeader_pl: @translation.contactHeader_pl, formContent_en: @translation.formContent_en, formContent_it: @translation.formContent_it, formContent_pl: @translation.formContent_pl, formEmail_en: @translation.formEmail_en, formEmail_it: @translation.formEmail_it, formEmail_pl: @translation.formEmail_pl, formName_en: @translation.formName_en, formName_it: @translation.formName_it, formName_pl: @translation.formName_pl, formTel_en: @translation.formTel_en, formTel_it: @translation.formTel_it, formTel_pl: @translation.formTel_pl, portfolioHeader_en: @translation.portfolioHeader_en, portfolioHeader_it: @translation.portfolioHeader_it, portfolioHeader_pl: @translation.portfolioHeader_pl, portfolioMore_en: @translation.portfolioMore_en, portfolioMore_it: @translation.portfolioMore_it, portfolioMore_pl: @translation.portfolioMore_pl, salonHeader_en: @translation.salonHeader_en, salonHeader_it: @translation.salonHeader_it, salonHeader_pl: @translation.salonHeader_pl, startMore_en: @translation.startMore_en, startMore_it: @translation.startMore_it, startMore_pl: @translation.startMore_pl }
    end

    assert_redirected_to translation_path(assigns(:translation))
  end

  test "should show translation" do
    get :show, id: @translation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @translation
    assert_response :success
  end

  test "should update translation" do
    patch :update, id: @translation, translation: { aboutHeader_en: @translation.aboutHeader_en, aboutHeader_it: @translation.aboutHeader_it, aboutHeader_pl: @translation.aboutHeader_pl, carieerHeader_en: @translation.carieerHeader_en, carieerHeader_it: @translation.carieerHeader_it, carieerHeader_pl: @translation.carieerHeader_pl, contactFollow_en: @translation.contactFollow_en, contactFollow_it: @translation.contactFollow_it, contactFollow_pl: @translation.contactFollow_pl, contactHeader_en: @translation.contactHeader_en, contactHeader_it: @translation.contactHeader_it, contactHeader_pl: @translation.contactHeader_pl, formContent_en: @translation.formContent_en, formContent_it: @translation.formContent_it, formContent_pl: @translation.formContent_pl, formEmail_en: @translation.formEmail_en, formEmail_it: @translation.formEmail_it, formEmail_pl: @translation.formEmail_pl, formName_en: @translation.formName_en, formName_it: @translation.formName_it, formName_pl: @translation.formName_pl, formTel_en: @translation.formTel_en, formTel_it: @translation.formTel_it, formTel_pl: @translation.formTel_pl, portfolioHeader_en: @translation.portfolioHeader_en, portfolioHeader_it: @translation.portfolioHeader_it, portfolioHeader_pl: @translation.portfolioHeader_pl, portfolioMore_en: @translation.portfolioMore_en, portfolioMore_it: @translation.portfolioMore_it, portfolioMore_pl: @translation.portfolioMore_pl, salonHeader_en: @translation.salonHeader_en, salonHeader_it: @translation.salonHeader_it, salonHeader_pl: @translation.salonHeader_pl, startMore_en: @translation.startMore_en, startMore_it: @translation.startMore_it, startMore_pl: @translation.startMore_pl }
    assert_redirected_to translation_path(assigns(:translation))
  end

  test "should destroy translation" do
    assert_difference('Translation.count', -1) do
      delete :destroy, id: @translation
    end

    assert_redirected_to translations_path
  end
end
