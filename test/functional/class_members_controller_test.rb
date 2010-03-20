require 'test_helper'

class ClassMembersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_member" do
    assert_difference('ClassMember.count') do
      post :create, :class_member => { }
    end

    assert_redirected_to class_member_path(assigns(:class_member))
  end

  test "should show class_member" do
    get :show, :id => class_members(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => class_members(:one).to_param
    assert_response :success
  end

  test "should update class_member" do
    put :update, :id => class_members(:one).to_param, :class_member => { }
    assert_redirected_to class_member_path(assigns(:class_member))
  end

  test "should destroy class_member" do
    assert_difference('ClassMember.count', -1) do
      delete :destroy, :id => class_members(:one).to_param
    end

    assert_redirected_to class_members_path
  end
end
