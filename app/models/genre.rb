class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '以下から選択' },
    { id: 1, name: '買い物' },
    { id: 2, name: '旅行' },
    { id: 3, name: '仕事' },
    { id: 4, name: '趣味' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :notes
end