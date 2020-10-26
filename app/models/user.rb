class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
              
             
           validates :nickname,         presence: true
           validates :birthday,         presence: true
                
             with_options presence: true do
            validates :first_name,:last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
            validates :first_name_kana,:last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
            validates :password, length: { minimum: 6 } ,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
            
                has_many :items
                has_many :orders
              end
             
        end

    