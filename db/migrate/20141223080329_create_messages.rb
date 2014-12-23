class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content_text
      t.references :conversation, index: true
      t.references :participant, :polymorphic => true
      t.timestamps
    end

    add_index :messages, :participant_id
  end
end
