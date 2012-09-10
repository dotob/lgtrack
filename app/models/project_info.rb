class ProjectInfo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :duration, :name, :user

  def self.create_me(combi, user)
  	pi = ProjectInfo.new
  	# parse combi entry
  	# should have the format: <duration> <projectname> <description>
  	# ^(\d*,?\.?\d*) (\w*) ([\s\w]*)$
  	parts = /^(\d*,?\.?\d*) (\w*) ([\s\w]*)$/.match(combi)
  	if parts.length == 4
	  	pi.duration = parts[1].to_f
	  	pi.name = parts[2]
	  	pi.description = parts[3]
	  	pi.user = user
  	else
  		#fail
  		pi = null
	end
	return pi
  end

  def self.grouped_by_project
	groups = ProjectInfo.order("created_at DESC").group("name")
	ret = Hash.new
	groups.each{|g|
		ret[g.name] = ProjectInfo.where(:name => g.name).sum(:duration)
	}
	return ret;
  end
end
