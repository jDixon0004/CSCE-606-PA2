module MoviesHelper
  def next_sort_direction(column)
    current_sort = session[:movies_sort].presence || 'title'
    current_direction = params[:movies_direction].presence || 'desc'

    current_sort == column.to_s && current_direction == 'desc' ? 'asc' : 'desc'
  end
end
