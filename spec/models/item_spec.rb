require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品'
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.image = fixture_file_upload('public/images/PENTAFANPK009_TP_V.jpg')
  end

  it '全ての項目があれば登録できること' do
    expect(@item).to be_valid
  end

  it '商品名が必須' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it '商品名が40字以内なら出品できる' do
    @item.name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    @item.valid?
    expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
  end

  it '商品の画像が1枚必須' do
    @item.images = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it '商品の説明が必須' do
    @item.item_description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item description can't be blank")
  end

  it 'カテゴリーの情報が必須' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it '商品の状態が必須' do
    @item.item_condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item condition can't be blank")
  end

  it '配送料の負担情報が必須' do
    @item.delivery_fee_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
  end

  it '発送元の地域情報が必須' do
    @item.shipping_area_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping area can't be blank")
  end

  it '発送までの日数情報が必須' do
    @item.shipping_days_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping days can't be blank")
  end

  it '価格情報が必須' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end

  it '価格が300以下では出品できない' do
    @item.price = '10'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end

  it '価格が9,999,999以上では出品できない' do
    @item.price = '1,000,000,000'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is out of setting range')
  end
end
