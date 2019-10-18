class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.string :password_digest
      #passwordを_digestをつけるとmodelでhas_secure_passwordが使用可能になる。
      #has_secure_passwordが可能になると、パスワードとその確認ができるようになる。詳しくはmodelへ
      t.timestamps
    end
  end
end



#Migrationファイルはrubyで書かれたテーブルの設計図
# $ rails db:migrateでマイグレーションファイルを実行し、DBのテーブルを操作するコマンド
# $ rails g migrate  はマイグレーションファイルをrubyで作成するコマンド。  でもmodel g でも可能
