class UserSessionsController < MembersController
  skip_before_action :require_login, only: [:new, :create]
  layout 'application'

  def new
      # instance variable, accessible in the view if with "@"
      @user = User.new
  end

  def create
    # @user = login(params[:email], params[:password], params[:remember])
    # if @user 
    #   redirect_to root_path
    # else
    #   render 'new'
    # end
    respond_to do |format|
      if @user = login(params[:email], params[:password], params[:remember])
        format.html { redirect_back_or_to(:users, notice: 'Login successfull.') }
        format.xml { render xml: @user, status: :created, location: @user }
        format.json { render @user }
      else
        format.html { flash.now[:alert] = 'Login failed.'; render action: 'new' }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end