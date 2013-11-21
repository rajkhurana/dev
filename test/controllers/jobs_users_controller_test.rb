require 'test_helper'

class JobsUsersControllerTest < ActionController::TestCase
  setup do
    @jobs_user = jobs_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobs_user" do
    assert_difference('JobsUser.count') do
      post :create, jobs_user: {  job_id: @jobs_user. job_id, user_id: @jobs_user.user_id }
    end

    assert_redirected_to jobs_user_path(assigns(:jobs_user))
  end

  test "should show jobs_user" do
    get :show, id: @jobs_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobs_user
    assert_response :success
  end

  test "should update jobs_user" do
    patch :update, id: @jobs_user, jobs_user: {  job_id: @jobs_user. job_id, user_id: @jobs_user.user_id }
    assert_redirected_to jobs_user_path(assigns(:jobs_user))
  end

  test "should destroy jobs_user" do
    assert_difference('JobsUser.count', -1) do
      delete :destroy, id: @jobs_user
    end

    assert_redirected_to jobs_users_path
  end
end
