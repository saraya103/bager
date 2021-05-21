class Reserve < ApplicationRecord
  belongs_to :note
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :next
  belongs_to :once

  with_options presence: true do
    validates :date
    validates :next_id
    validates :once_id
  end

  def date_check
    self.each do |reserve|
      if self.date <= Date.today
        if List.find_by(item_id: reserve.item_id) == nil
          @list = List.new
          @list.note_id = self.note_id
          @list.item_id = self.item_id
          @list.save
          check_once
        end
      end
    end
  end

  def set_date
    case self.next_id
    when 0
      self.date = Date.today.next_year(1000)
    when 1
      self.date = Date.tomorrow
    when 2
      self.date = Date.today.next_day(2)
    when 3
      self.date = Date.today.next_day(3)
    when 4
      self.date = Date.today.next_day(4)
    when 5
      self.date = Date.today.next_day(5)
    when 6
      self.date = Date.today.next_day(6)
    when 7
      self.date = Date.today.next_day(7)
    when 8
      self.date = Date.today.next_day(14)
    when 9
      self.date = Date.today.next_day(21)
    when 10
      self.date = Date.today.next_month
    when 11
      self.date = Date.today.next_month(2)
    when 12
      self.date = Date.today.next_month(3)
    when 13
      self.date = Date.today.next_month(6)
    else
      self.date = Date.today.next_year
    end
  end

  def check_once
    case self.once_id
    when 0
      set_date
      self.save
    when 1
      self.next_id = 0
      self.date = Date.today.next_year(1000)
      self.save
    else
      self.destroy
    end
  end
end
