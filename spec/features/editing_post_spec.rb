require 'rails_helper'

feature 'Can edit posts' do  
    background do
      post = create(:post)
      
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
    end
    
    it "will not update without an image" do
      click_link 'Edit Post'
      attach_file('Image', "spec/files/images/dummy.zip")
      click_button "Update Post"
      expect(page).to have_content("No update hombre, try again.")
    
    end
  scenario 'Can update the caption of a post' do

      click_link "Edit Post"
      fill_in 'Caption', with: "Oh god, you weren’t meant to see this picture!"
      click_button "Update Post"
      expect(page).to have_content("Post updated hombre")
      expect(page).to have_content("Oh god, you weren’t meant to see this picture!")
      
    
  end
end