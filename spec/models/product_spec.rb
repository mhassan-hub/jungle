require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before do
      @category = Category.new(:name => "Test Category")
      @product = @category.products.new(:name => "nameOfProduct", :price => 22, :quantity => 1)
    end
  end
end
