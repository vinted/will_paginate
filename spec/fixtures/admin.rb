class Admin < User
  has_many :companies, lambda { from('companies') }
end
