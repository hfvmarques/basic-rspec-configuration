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
    customer2 = create(:customer)

    puts customer.email
    puts customer.name
    puts customer2.email
    puts customer2.name

    expect(customer.name).to be_a(String)
  end

  it 'builds a customer with factory bot' do
    customer = build(:customer)

    expect(customer.email).to be_a(String)
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }

  it 'creates a default customer' do
    customer = create(:customer, :default)
    expect(customer.vip).to be_falsey
  end

  it 'creates a vip customer' do
    customer = create(:customer, :with_vip)
    expect(customer.vip).to be_truthy
  end

  it 'creates using attributes for' do
    attrs = attributes_for(:customer, :with_vip)
    customer = Customer.create(attrs)

    expect(customer.vip).to be_truthy
  end

  it 'transient attribute' do
    customer = create(:customer, :default, upcased: false)

    expect(customer.name.upcase).not_to eq(customer.name)
  end

  it 'Male customer with vip' do
    customer = create(:customer, :with_vip, :male)
    expect(customer.gender).to eq 'M'
    expect(customer.vip).to eq true
  end

  it '#travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer, :with_vip)
    end

    expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 01, 04, 44))
    expect(@customer.created_at).to be < Time.now
  end
end
