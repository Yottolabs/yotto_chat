class CreateChatQueCustomers < ActiveRecord::Migration
  def change
    create_table :chat_que_customers do |t|
      t.references :customer, index: true
      t.references :chat_que, index: true

      t.timestamps
    end
  end
end
