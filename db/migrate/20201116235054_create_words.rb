class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.belongs_to :category, index: true
      t.string :word
    end
  end
end