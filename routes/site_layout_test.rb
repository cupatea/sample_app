require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user       = users(:michael)
    @other_user = users(:archer)
  end

  test "layout links" do
    get root_path
    assert_template 'static_page/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
    get login_path
    assert_select "title", full_title("Log in")
    log_in_as (@user)
    get users_path
    assert_select "title", full_title("All users")

    assert_select "a[href=?]", user_path(@user.id) # find url for edit current user
    get user_path @user.id
    assert_response :success
    assert_select "title", full_title(@user.name)

    assert_select "a[href=?]", edit_user_path(@user.id) # find url for show current user
    get edit_user_path @user.id
    assert_response :success
    assert_select "title", full_title("Edit user")

    assert_select "a[href=?]", logout_path # find url for destroy current user session
    delete logout_path
    assert_not is_logged_in?
  end

end
