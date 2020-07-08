class AddEntryRefToSections < ActiveRecord::Migration[6.0]
  def change
    add_reference :sections, :entry, null: false, foreign_key: true
  end
end
