module RestaurantHelper

  def average_cafe_mark
    array_of_marks = []
    Comment.where(place_id: session[:rest_id]).each { |comment| array_of_marks << comment.grade }
    @average_mark = array_of_marks.inject{ |sum, el| sum + el }.to_f / array_of_marks.size
  end

  def info_about_selected_cafe
    redirect 'sign_in' unless login?
    @rest = Restaurant.all.find_by(name: params[:name])
    session[:rest_id] = @rest.id
    average_cafe_mark
  end

end
