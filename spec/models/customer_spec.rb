require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  fixtures :customers

  it 'creates a customer' do
    # customer = Customer.create(name: 'John Doe', email: 'example@example.com')
    # subject.name = 'John Doe'
    # subject.email = 'john@doe.com'
    # subject.save

    customer = customers(:john)

    expect(customer.name).to eq('John Doe')
  end

  it 'creates a customer with factory bot' do
    customer = create(:customer)

    expect(customer.name).to be_a(String)
  end

  it 'builds a customer with factory bot' do
    customer = build(:customer)

    expect(customer.email).to be_a(String)
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it 'creates a default customer' do
    customer = create(:customer_default)
    expect(customer.vip).to be_falsey
  end

  it 'creates a vip customer' do
    customer = create(:customer_with_vip)
    expect(customer.vip).to be_truthy
  end

  it 'creates using attributes for' do
    attrs = attributes_for(:customer_with_vip)
    customer = Customer.create(attrs)

    expect(customer.vip).to be_truthy
  end
end
