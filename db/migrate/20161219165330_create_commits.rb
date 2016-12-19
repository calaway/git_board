class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.references :user, foreign_key: true
      t.string :sha
      t.string :message
      t.string :url

      t.timestamps
    end
  end
end
