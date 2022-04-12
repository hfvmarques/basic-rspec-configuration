require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has an order' do
    order = create(:order)

    puts order.description
    puts order.customer.name

    expect(order.customer).to be_kind_of(Customer)
  end

  it 'has another order' do
    customer = create(:customer)
    order = create(:order, customer: customer)

    puts order.description
    puts order.customer.name

    expect(order.customer).to be_kind_of(Customer)
  end
end
