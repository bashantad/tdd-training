class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
      t.string :subject
      t.text :body
      t.datetime :read_at

      t.timestamps
    end
  end
end
