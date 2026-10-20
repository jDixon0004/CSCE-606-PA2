class Movie < ActiveRecord::Base
  SORT_COLUMNS = {
    'title' => :title,
    'rating' => :rating,
    'release_date' => :release_date
  }.freeze

  def self.sorted(sort:, direction:)
    column = SORT_COLUMNS.fetch(sort.to_s, :title)
    direction = direction.to_s == 'asc' ? :asc : :desc

    order(column => direction)
  end
end