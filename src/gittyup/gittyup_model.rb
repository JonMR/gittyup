require 'grit'
include Grit

class GittyupModel
	attr_accessor :repos, :left_branches, :right_branches

	def initialize
		@repos = []
		@left_branches = []
		@right_branches = []
	end

	def add_repository(file)
		@repos << file.name
	end
end
