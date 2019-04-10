class User < ApplicationRecord
    has_many :training_files

    validates :name, presence: true, length: { minimum: 2, maximum: 50 }, format: { with: /\A[a-zA-Z1-9_-]+\Z/ }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :admin, inclusion: { in: [true, false] }
    validates :password, presence: true, length: { minimum: 6 }, allow_blank: true

    has_secure_password
end
