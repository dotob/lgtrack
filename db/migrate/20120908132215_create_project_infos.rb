class CreateProjectInfos < ActiveRecord::Migration
  def change
    create_table :project_infos do |t|
      t.string :name
      t.decimal :duration
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :project_infos, :user_id
  end
end
