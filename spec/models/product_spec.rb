require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:category) }
    
    it 'is valid with valid attributes' do
      product = create(:product)
      
      expect(product).to be_valid
    end  
  end
  
  context 'associations' do
    it { is_expected.to belong_to(:category) }
  end
  
  context 'methods' do
    it 'returns a full description' do
      product = create(:product)

      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end
end
