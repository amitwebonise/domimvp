class Tenant < User
  has_many :appointments
end