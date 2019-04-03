class AddUserRefToTrainingFiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :training_files, :user, foreign_key: true
  end
end
