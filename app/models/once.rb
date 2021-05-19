class Once < ActiveHash::Base
  self.data = [
    { id: 0, name: '定期的' },
    { id: 1, name: '不定期' },
    { id: 2, name: '今回限り' },
  ]

  include ActiveHash::Associations
  has_many :reserves
end