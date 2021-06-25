class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :tittle #an attribute/column in an sql table
      t.text :description
    end
  end
end
