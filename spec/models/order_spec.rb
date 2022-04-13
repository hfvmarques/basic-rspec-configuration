require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    order = create(:order)

    puts order.description
    puts order.customer.name

    expect(order.customer).to be_kind_of(Customer)
  end

  it 'belongs_to too' do
    customer = create(:customer)
    order = create(:order, customer: customer)

    puts order.description
    puts order.customer.name

    expect(order.customer).to be_kind_of(Customer)
  end

  it 'create_list' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'has a pair of orders' do
    orders = create_pair(:order)

    expect(orders.count).to eq(2)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders)

    expect(customer.orders.count).to eq(3)
  end

  it 'has_many too' do
    customer = create(:customer, :with_orders, orders_count: 5)

    expect(customer.orders.count).to eq(5)
  end
end
