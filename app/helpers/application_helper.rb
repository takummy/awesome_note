module ApplicationHelper
  def new_or_confirm
    if action_name == 'new' || action_name == 'confirm'
      confirm_notes_path
    elsif action_name == 'edit'
      note_path
    end
  end
end
