require 'test_helper'

class ProjectInfoTest < ActiveSupport::TestCase
  test "create project info" do
    project_info = ProjectInfo.new("2 1234 test me")

	assert project_info.duration == 2
	assert project_info.name == "1234"
	assert project_info.description == "test me"
  end
end
