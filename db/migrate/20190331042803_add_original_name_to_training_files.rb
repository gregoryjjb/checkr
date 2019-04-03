class AddOriginalNameToTrainingFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :training_files, :original_filename, :string
  end
end
