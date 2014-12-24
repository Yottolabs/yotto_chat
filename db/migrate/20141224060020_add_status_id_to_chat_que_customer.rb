class AddStatusIdToChatQueCustomer < ActiveRecord::Migration
  def change
    add_column :chat_que_customers, :status_id, :integer
  end
end
