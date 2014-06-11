class UsersController < ApplicationController

	def edit_password
		@user = current_user
	end

  	def update_password
    	@user = current_user
    	# raise params.inspect
    	if @user.update_with_password(params[:user])
      	sign_in(@user, :bypass => true)
      	redirect_to root_path, :notice => "Your Password has been updated!"
    	else
     		render :edit,:locals => { :resource => @user, :resource_name => "user" }
    	end
  	end

  	def generate_new_password_email
  		user = User.find_by_email(params[:user_email])
    	if user
    		user.send_reset_password_instructions
    		flash[:notice] = "Reset password instructions have been sent to #{user.email}."
    		redirect_to "/users/sign_in"
    	else
     		flash[:notice] = "#{params[:user_email]} is not registered in the system"
    		redirect_to "/users/sign_in"   		
    	end
  	end

end
