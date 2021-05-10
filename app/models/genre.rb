class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '以下から選択' },
    { id: 1, name: '買い物' },
  ]

  include ActiveHash::Associations
  has_many :notes
end