module UserHelper
  def create_user(params)
    @user = User.new
    @user.name = (params[:username])
    @user.email = params[:email]
    @user.password = params[:password]
    @user.save!
  end

  def valid_password?(params)
    params["password"] == params["confirm_password"]
  end

  def login(session)
    @user = User.find_by(email:params[:email])
    p params
    if @user.password_hash == params[:password]
      session[:login] = true
      p 1
    else
      session[:login] = false
      p 2
    end
   p session
  end

end
