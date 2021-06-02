require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js:true do

  # SETUP
  # Helper function to open product images
  def open_asset(file_name)
    File.open(Rails.root.join('db', 'seed_assets', file_name))
  end
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click on a product to see more product details" do
    # ACT
    visit root_path
    click_link('Details', :match => :first)

    # DEBUG
    sleep 1
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end
