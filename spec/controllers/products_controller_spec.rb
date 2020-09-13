require 'spec_helper'

describe ProductsController, type: :controller do
  describe 'GET #index' do
    subject { get :index }
    let!(:product) { Product.create(name: "TEST", price: 123)}
    it 'renders index' do
      get :index

      expect(response.successful?).to be_truthy

      body = JSON.parse response.body
      expect(body['data'][0]).to eq(product.as_json(only: [:name, :price]))
    end
  end
end
