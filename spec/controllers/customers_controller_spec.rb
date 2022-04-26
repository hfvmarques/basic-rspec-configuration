require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as a guest' do
    context 'GET #index' do
      before do
        get :index
      end

      it { expect(response).to be_successful }
      it { expect(response).to have_http_status(200) }
    end
  
    context 'GET #show' do
      before do
        customer = create(:customer)
    
        get :show, params: { id: customer.id }
      end

      it { expect(response).not_to be_successful }
      it { expect(response).to have_http_status(302) }
    end
  end

  describe 'as a member' do
    context 'GET #show' do
      before do
        member = create(:member)
        sign_in member

        customer = create(:customer)    
    
        get :show, params: { id: customer.id }
      end

      it { expect(response).to be_successful }
      it { expect(response).to have_http_status(200) }
      it { expect(response).to render_template(:show) }
    end
  end
end
