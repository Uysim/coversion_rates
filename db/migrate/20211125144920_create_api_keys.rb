class CreateApiKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :api_keys do |t|
      t.string :token, unique: true, index: true, null: false
      t.references :project, foreign_key: true
    end

    reversible do |dir|
      dir.up do 
        Project.find_each do |project|
          ApiKey.create!(token: project.api_key, project: project)
        end
      end
    end
    change_column_null :api_keys, :project_id, false
    remove_column :projects, :api_key
  end
end
