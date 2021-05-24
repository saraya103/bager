class Next < ActiveHash::Base
  self.data = [
    { id: 0, name: '未定' },
    { id: 1, name: '1日' },
    { id: 2, name: '2日' },
    { id: 3, name: '3日' },
    { id: 4, name: '4日' },
    { id: 5, name: '5日' },
    { id: 6, name: '6日' },
    { id: 7, name: '1週間' },
    { id: 8, name: '2週間' },
    { id: 9, name: '3週間' },
    { id: 10, name: '1ヶ月' },
    { id: 11, name: '2ヶ月' },
    { id: 12, name: '3ヶ月' },
    { id: 13, name: '半年' },
    { id: 14, name: '1年' },
  ]

  include ActiveHash::Associations
  has_many :reserves
end