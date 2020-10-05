class Patient < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :physicians, through: :appointments
end
