
HTTPメソッド　一覧

GET　　リソースの取得 index new edit show #ページを持つもの かつ　prefixがある

POST　　リソースの作成など  create

PUT　リソースの更新など((更新というよりは置換))  update

DELETE　リソースの削除 destroy

PATCH 既存のリソースを更新・変更・修正(リソースの部分置換) update



1 $ rails new session_login -d postgresql #オプションで使用するDBを指定
2 $ cd session_login #対象ディレクトリに移動
3 $ rails db:create #DBを作成
4 $ rails s #確認  localhost3000
5 $ rails g controller sessions index #veiwファイルも確認（index.html.erb）blogsはコントロラ、命名の際は複数形、語尾はオプション（indexアクション制作）
6 config/routes.rb =>  resources :blogs  #30参照
7 rails g model user  #model名。注意！                     #モデル名は単数！　このコマンドで下記のコマンドのファイルも作成」　カリキュラムでは　--skipオプションで飛ばしていた。そのオプションはDBのmigrate制作を飛ばす
#$ rails g migration CreateBlogs #mgファイル名は慣例の命名規則に従い、目的＋命名で作成。ここからテーブルの設計をかく。記述後はdb:migrate
#modelファイルにて、blog.rbを確認
#modelコマンド入力後、DBのmigrateファイルも制作される。
8 テーブル作成   db/migrate/20191000000_create_blogs => データ型：カラム名を記述

create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest





#9.5 $ sudo service postgresql start #SQLを起動

9 $ rails db:migrate #スキーマファイルを確認






10  modelにバリデーション追加

app/models/user.rb


class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }# nameなどはテーブルカラム
  validates :email, presence: true, length: { maximum: 255 },
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
            # uniqueness: true
  #=1  before_validation { email.downcase! } #強制的に小文字に変える。
  #=1  has_secure_password#注意！カラムに_digestをつけないと使用できない
  #has_secure_passwordメソッドはパスワードをハッシュ化する。そしてその変換したものをDBのpassword_digestというカラムに保存する。
  #そして、新たなめっソッドが使用できる。authenticate   #スペルミスにはきよつける
  #=1  validates :password, presence: true, length: { minimum: 6 }#空の値禁止、文字制限
  # validates :name, presence: true,length: {maxium: 30}
end


11
