module MoviesHelper
  def current_movie_sort
    session[:movies_sort].presence || 'title'
  end

  def current_movie_sort_direction
    session[:movies_direction] == 'asc' ? 'asc' : 'desc'
  end

  def sorted_column?(column)
    current_movie_sort == column.to_s
  end

  def sorted_column_class(column)
    return unless sorted_column?(column)

    "sorted-column sorted-#{current_movie_sort_direction}"
  end

  def next_sort_direction(column)
    sorted_column?(column) && current_movie_sort_direction == 'desc' ? 'asc' : 'desc'
  end

  def rating_class(rating)
    case rating.to_s.upcase
      when "G"     then "rating-g"
      when "PG"    then "rating-pg"
      when "PG-13" then "rating-pg-13"
      when "R"     then "rating-r"
      when "NC-17" then "rating-nc-17"
      else "rating-other"
    end
  end
end
