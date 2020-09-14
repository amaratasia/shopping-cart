require 'rails_helper'

RSpec.describe CartController, type: :controller do
  describe 'get #items' do
    subject { get :items }
    let!(:user) { User.create(email: "test@amar.com") }
    let!(:cart) { user.carts.create }
    let(:product) { Product.create(name: "test", price: 121) }
    let!(:cart_item) { cart.cart_items.create(product: product, qty: 2) }

    it 'returns cart items' do
      is_expected.to have_http_status(:ok)
      body = JSON.parse response.body

      expect(body['data'][0]['total'].to_f).to eq(cart_item.product.price * cart_item.qty)
    end
  end


  describe 'post #add to cart' do
    let(:param_obj) { {product_id: product.id, qty: 1} }

    subject { post :add_to_cart, params: param_obj }
    let!(:user) { User.create(email: "test@amar.com") }
    let!(:cart) { user.carts.create }
    let(:product) { Product.create(name: "test", price: 121) }

    it 'returns cart items' do
      is_expected.to have_http_status(:ok)
      body = JSON.parse response.body

      expect(cart.cart_items.count).to eq(1)
    end
  end
end
