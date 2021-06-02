require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

      # VERIFY INITIAL STATE
      expect(page).to have_content 'My Cart (0)'

      click_button('Add', :match => :first)      

      # DEBUG
      sleep 1
      save_screenshot
  
      # VERIFY CHANGE
      expect(page).to have_content 'My Cart (1)'
    end
end
