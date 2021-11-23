class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :api_key, unique: true, index: true
    end
  end
end
