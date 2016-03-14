require "test_helper"

class LoginSeeSiteTest < Capybara::Rails::TestCase
  test "Cannot view site when not logged in" do

    me = User.create email: "ardnehsan@exmail.com", password: "nf"
    visit root_path

    refute_content page, "#Mysite"
  end

  test "Can view site after logging in" do
    me = User.create email: "ardnehsan@exmail.com", password: "nf"
    visit root_path

    fill_in "Email", with: "ardnehsan@exmail.com"
    fill_in "Password", with: "nf"
    click_button "Sign In"

    assert_content page, "#Mysite"

  end
end
