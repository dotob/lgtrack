class ProjectInfo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :duration, :name

  def self.create_me(combi)
  	pi = ProjectInfo.new
  	# parse combi entry
  	# should have the format: <duration> <projectname> <description>
  	# ^(\d*,?\.?\d*) (\w*) ([\s\w]*)$
  	parts = /^(\d*,?\.?\d*) (\w*) ([\s\w]*)$/.match(combi)
  	if parts.length == 4
	  	pi.duration = parts[1].to_f
	  	pi.name = parts[2]
	  	pi.description = parts[3]
  	else
  		#fail
	end
	return pi
  end
end
