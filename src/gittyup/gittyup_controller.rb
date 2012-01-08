include_class javax.swing.JFileChooser

class GittyupController < ApplicationController
  set_model 'GittyupModel'
  set_view 'GittyupView'
  set_close_action :exit

	def addRepo_action_performed
		chooser = JFileChooser.new
		chooser.file_selection_mode = JFileChooser::DIRECTORIES_ONLY
		chooser.dialog_title = "Select a repository directory"

		case chooser.show_open_dialog(nil)
		when JFileChooser::APPROVE_OPTION
			model.add_repository(chooser.getSelectedFile)
			update_view
		end
	end

end
