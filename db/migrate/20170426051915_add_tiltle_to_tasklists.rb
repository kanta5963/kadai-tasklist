class AddTiltleToTasklists < ActiveRecord::Migration[5.0]
  def change
    add_column :tasklists, :status, :string
  end
end
