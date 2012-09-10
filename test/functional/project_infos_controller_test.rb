require 'test_helper'

class ProjectInfosControllerTest < ActionController::TestCase
  setup do
    @project_info = project_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_info" do
    assert_difference('ProjectInfo.count') do
      post :create, project_info: { description: @project_info.description, duration: @project_info.duration, name: @project_info.name }
    end

    assert_redirected_to project_info_path(assigns(:project_info))
  end

  test "should show project_info" do
    get :show, id: @project_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_info
    assert_response :success
  end

  test "should update project_info" do
    put :update, id: @project_info, project_info: { description: @project_info.description, duration: @project_info.duration, name: @project_info.name }
    assert_redirected_to project_info_path(assigns(:project_info))
  end

  test "should destroy project_info" do
    assert_difference('ProjectInfo.count', -1) do
      delete :destroy, id: @project_info
    end

    assert_redirected_to project_infos_path
  end
end
