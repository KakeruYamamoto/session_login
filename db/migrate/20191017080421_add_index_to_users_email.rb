class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
  end
end




# $ rails g migration add_index_to_users_email   で作成
#記入後 $ rails db:migrate
