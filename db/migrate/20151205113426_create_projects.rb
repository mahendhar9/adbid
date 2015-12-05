class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :image_url
      t.text :short_description
      t.text :description
      t.decimal :goal, precision: 8, scale: 2
      t.string :status, default: "pending"
      t.date :ends_on
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
