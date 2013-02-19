require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post :create, card: { ability: @card.ability, artist: @card.artist, card_type: @card.card_type, converted_manacost: @card.converted_manacost, flavor: @card.flavor, loyalty: @card.loyalty, manacost: @card.manacost, mtg_id: @card.mtg_id, name: @card.name, number: @card.number, power: @card.power, rarity: @card.rarity, ruling: @card.ruling, set_code: @card.set_code, set_name: @card.set_name, toughness: @card.toughness, watermark: @card.watermark }
    end

    assert_redirected_to card_path(assigns(:card))
  end

  test "should show card" do
    get :show, id: @card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card
    assert_response :success
  end

  test "should update card" do
    put :update, id: @card, card: { ability: @card.ability, artist: @card.artist, card_type: @card.card_type, converted_manacost: @card.converted_manacost, flavor: @card.flavor, loyalty: @card.loyalty, manacost: @card.manacost, mtg_id: @card.mtg_id, name: @card.name, number: @card.number, power: @card.power, rarity: @card.rarity, ruling: @card.ruling, set_code: @card.set_code, set_name: @card.set_name, toughness: @card.toughness, watermark: @card.watermark }
    assert_redirected_to card_path(assigns(:card))
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete :destroy, id: @card
    end

    assert_redirected_to cards_path
  end
end
