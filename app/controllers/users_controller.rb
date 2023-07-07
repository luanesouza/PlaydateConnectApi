class UsersController < ApplicationController
  before_action :set_user, except: [:index, :create]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # GET /users/1/connections
  def user_connections
    if has_connections?
      @connections = Connection.where(follower_id: @user.id) || [] + Connection.where(followee_id: @user.id) || []
      render json: @connections
    else
      render json: { message: 'No connections found. Don\'t be shy, find new friends!' }
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /users/1
  def destroy
    @user.destroy
  end

  #GET /users/1/playdates
  def user_playdates
    @playdates = @user.playdates + @user.invited_playdates
    render json: @playdates
  end

  def has_connections?
    @connections = Connection.where(followed_id: @user.id) || [] + Connection.where(follower_id: @user.id) || []
    @connections.length > 0 ? true : false
  end

  #POST /users/1/playdates/create
  def create_playdate_if_connection
    if has_connections?
      @playdate = Playdate.create(invitee_id: params[:invitee_id], inviter_id: params[@user.id])
      if @playdate.save
        render json: @playdate
      else
        render json: @playdate.errors, status: :unprocessable_entity
      end
    else
      render json: { message: "Connect to user first" }
    end
  end

  # POST /users/1/connection/create
  def create_connection
    if user_has_connection?
      render json: { message: 'User already connected' }
      return
    end
    @connection = Connection.create(followed_id: params[:followed_id], follower_id: @user.id, date: params[:date])
    if @connection.save 
      render json: @connection
    else
      render json: @connection.errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def user_has_connection?
      @connection = Connection.find_by(followed_id: params[:followed_id], follower_id: @user.id)
      @connection ? true : false
    end
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "allow list" through.
    def user_params
      params.require(:user).permit(:name, :role, :email, :password_digest)
    end
end
