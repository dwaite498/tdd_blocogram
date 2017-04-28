require 'rails_helper'

feature 'create multiple posts' do
    scenario 'the index displays correct created post information' do
       post_one = create(:post, caption: "This is post one")
       post_two = create(:post, caption: "This is post two")
       
       visit '/'
       expect(page).to have_content("This is post one")
       expect(page).to have_content("This is post two")
       expect(page).to have_css("img[src*='coffee']")
    end
end

# Create multiple posts using factories.
# User visits the root route.
# User can see the comments and images of the posts we’ve created.