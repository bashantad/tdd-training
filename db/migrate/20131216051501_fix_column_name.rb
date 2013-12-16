class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :addresses, :Person_id, :person_id
  end
end
