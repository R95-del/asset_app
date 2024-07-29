class HomeController < ApplicationController
  before_action :set_user_id, only: %i[edit_user update_user destroy_user]

  def index
  end

  def user_show
    @users = User.all
  end

  def edit_user
  end

  def update_user
    if @user.update(user_params)
      redirect_to root_path, flash: {success: "updated successfully"}
    else
      render 'edit_user'
    end
  end

  def destroy_user
    @user.destroy
    redirect_to root_path, flash: { success: "user destroy" }, status: 303
  end

  def export_pdf
    @users = User.all
    respond_to do |format|
      format.pdf do
        pdf = UserPdf.new(@users)
        send_data pdf.render, filename: 'users.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  private

  def set_user_id
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password,:password_confirmation)
  end

end
