class Interface::BooksController < ActionController::Base
  def all
    render :json => {
      :name =>'xiaowang',
      :sex =>'male',
      :age => 18,
      :adress =>'bejing'
    }
  end
end

