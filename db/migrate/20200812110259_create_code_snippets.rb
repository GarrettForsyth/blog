class CreateCodeSnippets < ActiveRecord::Migration[6.0]
  def change
    create_table :code_snippets do |t|
      t.text :code
      t.string :language
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
