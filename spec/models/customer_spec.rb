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
end
