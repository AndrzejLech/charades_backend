class CreateBasicWords < ActiveRecord::Migration[6.0]
  def change
    create_table :basic_words do |t|
      t.integer :category
      t.string :word
    end
  end
end
