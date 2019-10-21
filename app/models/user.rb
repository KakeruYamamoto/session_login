class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }# nameなどはテーブルカラム
  validates :email, presence: true, length: { maximum: 255 },
            format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } , uniqueness: true  #コメントアウトにはきよつける
  before_validation { email.downcase! } #強制的に小文字に変える。
  has_secure_password#注意！カラムに_digestをつけないと使用できない
  #has_secure_passwordメソッドはパスワードをハッシュ化する。そしてその変換したものをDBのpassword_digestというカラムに保存する。
  #そして、新たなめっソッドが使用できる。authenticate   #スペルミスにはきよつける
  validates :password, presence: true, length: { minimum: 6 }#空の値禁止、文字制限
  # validates :name, presence: true,length: {maxium: 30}
  # validates :email, presence: true,length: {maxium: 255}
end



#has_secure_passwordの効果
# セキュアにハッシュ化したパスワードを、データベース内のpassword_digestというカラムに保存する
# 2つのペアの仮想的な属性 (passwordとpassword_confirmation) が使えるようになる。また、存在性と値が一致するかどうかのバリデーションも追加される
# authenticateメソッドが使えるようになる (引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド) 。
# しかし、このhas_secure_passwordメソッドを使用するためにはpassword_digestというカラムが必要だということに注意してください。
# カラム名をpassword_digestにしたのはこのためです。
