require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with valid attributes' do
    product = create(:product)

    expect(product).to be_valid
  end

  it 'is invalid without a description' do
    product = build(:product, description: nil)

    expect(product).to be_invalid
    expect(product.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    product = build(:product, price: nil)

    expect(product).to be_invalid
    expect(product.errors[:price]).to include("can't be blank")
  end

  it 'is invalid without a category' do
    product = build(:product, category: nil)

    expect(product).to be_invalid
    expect(product.errors[:category]).to include("can't be blank")
  end

  it 'returns a full description' do
    product = create(:product)

    expect(product.full_description).to eq("#{product.description} - #{product.price}")
  end
end
