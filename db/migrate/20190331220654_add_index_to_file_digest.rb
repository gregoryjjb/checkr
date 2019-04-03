class AddIndexToFileDigest < ActiveRecord::Migration[5.2]
  def change
    add_index :training_files, :file_digest, unique: true
  end
end
