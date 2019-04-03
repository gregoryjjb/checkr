class CreateTrainingFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :training_files do |t|
      t.string :content_hash

      t.timestamps
    end
  end
end
