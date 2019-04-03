class RenameContentHashToFileDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :training_files, :content_hash, :file_digest
  end
end
