require 'rails_helper'

RSpec.describe CartPresenter do
  describe '#items' do
    let!(:user) { User.create(email: "amar@asia.com")}
    let!(:cart) { Cart.create(user: user)}
    let(:product) { Product.create( name: 'A', price: 30) }

    subject { described_class.new(cart) }

    context 'with 3 products' do
      before do
        cart.add_item({product_id: product.id, qty: 1})
        product1 = Product.create( name: 'B', price: 20)
        product2 = Product.create( name: 'C', price: 50)
        cart.add_item({product_id: product1.id, qty: 1})
        cart.add_item({product_id: product2.id, qty: 1})
      end

      it 'item total should be 100' do
        expect(subject.total).to eq 100
      end
    end


    context 'with product disount' do
      before do
        cart.add_item({product_id: product.id, qty: 1})
        cart.add_item({product_id: product.id, qty: 1})
        cart.add_item({product_id: product.id, qty: 1})
        product1 = Product.create( name: 'B', price: 20)
        cart.add_item({product_id: product1.id, qty: 2})

        promo = PromotionCategory.n_for_m.create(rules: {"qty"=>3, "price"=>75})
        promo1 = PromotionCategory.n_for_m.create(rules: {"qty"=>2, "price"=>35})
        promo.product_promotions.create(product_id: product.id)
        promo1.product_promotions.create(product_id: product1.id)
      end

      it 'should have discounts' do
        expect(subject.items[0][:name]).to eq(product.name)
        expect(subject.items[0][:discount]).to eq(15)
        expect(subject.total).to eq(110)
      end

      context 'with product and cart disount' do
        before do
          cart.add_item({product_id: product.id, qty: 3})
          PromotionCategory.cart_logic.create!(rules: {"min_val"=>150, "discount"=>20})
        end

        it 'should have discounts' do
          expect(subject.items[0][:name]).to eq(product.name)
          expect(subject.items[0][:discount]).to eq(30)
          expect(subject.total).to eq(165)
        end
      end
    end
  end
end
