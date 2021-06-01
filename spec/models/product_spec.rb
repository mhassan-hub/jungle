require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before do
      @category = Category.new(:name => "Test Category")
      @product = @category.products.new(:name => "nameOfProduct", :price => 22, :quantity => 1)
      
    end

    it "returns an error when name is nil" do
      @product.name = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "returns an error when price is nil" do
      @product.price_cents = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "returns an error when quantity is nil" do
      @product.quantity = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end
  
    it "returns an error when category is nil" do
      @product2 = Product.create({name: "burner",price: 123, quantity: 5, category: nil})
      @product2.save
      expect(@product2).to_not be_valid
      expect(@product2.errors.full_messages).to include "Category can't be blank"
    end
  end
end
