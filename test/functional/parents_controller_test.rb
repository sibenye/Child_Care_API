require 'test_helper'

class ParentsControllerTest < ActionController::TestCase
  setup do
    @parent = parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent" do
    assert_difference('Parent.count') do
      post :create, :parent => { :address => @parent.address, :city => @parent.city, :deleted_at => @parent.deleted_at, :email1 => @parent.email1, :email2 => @parent.email2, :family_name => @parent.family_name, :father_name => @parent.father_name, :home_phone => @parent.home_phone, :mobile_phone1 => @parent.mobile_phone1, :mobile_phone2 => @parent.mobile_phone2, :mother_name => @parent.mother_name, :state => @parent.state, :work_phone => @parent.work_phone, :zip_code => @parent.zip_code }
    end

    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should show parent" do
    get :show, :id => @parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @parent
    assert_response :success
  end

  test "should update parent" do
    put :update, :id => @parent, :parent => { :address => @parent.address, :city => @parent.city, :deleted_at => @parent.deleted_at, :email1 => @parent.email1, :email2 => @parent.email2, :family_name => @parent.family_name, :father_name => @parent.father_name, :home_phone => @parent.home_phone, :mobile_phone1 => @parent.mobile_phone1, :mobile_phone2 => @parent.mobile_phone2, :mother_name => @parent.mother_name, :state => @parent.state, :work_phone => @parent.work_phone, :zip_code => @parent.zip_code }
    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should destroy parent" do
    assert_difference('Parent.count', -1) do
      delete :destroy, :id => @parent
    end

    assert_redirected_to parents_path
  end
end
