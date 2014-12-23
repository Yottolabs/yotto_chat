class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :chat_que_customer, index: true

      t.timestamps
    end
  end
end
