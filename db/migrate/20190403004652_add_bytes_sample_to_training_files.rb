class AddBytesSampleToTrainingFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :training_files, :bytes_sample, :text
  end
end
