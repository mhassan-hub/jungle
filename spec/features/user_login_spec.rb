require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
    # SETUP

    # Helper function to open product images
    def open_asset(file_name)
      File.open(Rails.root.join('db', 'seed_assets', file_name))
    end
  
    before :each do
      @category = Category.create! name: 'Apparel'

      @user = User.create(first_name: "Austin", last_name: "Powers", email: "a@a.com", password: "pass", password_confirmation: "pass")
  
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


      click_link('Login')

      # DEBUG
      sleep 1
      save_screenshot

      # FILL OUT LOGIN FIELDS WITH USER DATA
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      # DEBUG
      sleep 1
      save_screenshot

      click_button 'Submit'

      # DEBUG
      sleep 1
      save_screenshot

      # VERIFY FIRST NAME APPEARS
      expect(page).to have_content 'Austin'


      # VERIFY INITIAL STATE
      # expect(page).to have_content 'My Cart (0)'

      # click_button('Add', :match => :first)

      # # DEBUG
      # sleep 1
      # save_screenshot
  
      # # VERIFY CHANGE
      # expect(page).to have_content 'My Cart (1)'
    end
end
