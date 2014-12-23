class CreateChatQues < ActiveRecord::Migration
  def change
    create_table :chat_ques do |t|
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end
end
