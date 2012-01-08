include_class javax.swing.tree.DefaultMutableTreeNode
include_class javax.swing.tree.DefaultTreeModel
include_class javax.swing.DefaultComboBoxModel

class GittyupView < ApplicationView
  set_java_class 'gittyup.Gittyup'

	map :model => :repos,
		:view => 'repos.model',
		:using => [:build_repositories_tree, nil]

	map :model => :left_branches,
		:view => 'leftBranches.model',
		:using => [:build_combobox, nil]
	
	map :model => :right_branches,
		:view => 'rightBranches.model',
		:using => [:build_combobox, nil]

	# initialize view elements on load
	def load
		repos.model = DefaultTreeModel.new(nil)
		leftBranches.model = DefaultComboBoxModel.new
		rightBranches.model = DefaultComboBoxModel.new
	end

	# builds a tree representation of our repositories
	def build_repositories_tree(repos)
		root = DefaultMutableTreeNode.new("Repositories")
		repos.each do |repo|
			root.add DefaultMutableTreeNode.new(repo)
		end
		DefaultTreeModel.new(root)
	end

	# builds a combobox from an array of options
	def build_combobox(options)
		DefaultComboBoxModel.new(options.to_java)
	end

end
