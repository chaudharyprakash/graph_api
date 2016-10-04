module API
	class Users < Grape::API
		include API::Defaults
		
		desc "Return all Users"
		 	get "user" do
		    User.all
		  end

		desc "create User"
			params do 
				requires :email, :name, :password, :password_confirmation
			end
			post "user" do
				ActiveRecord::Base::User.create(user_params)
			end

		desc "delete User"
			delete "user/:id" do
				ActiveRecord::Base::User.destroy(params[:id])
			end

		desc "show User"
			get "user/:id" do
				ActiveRecord::Base::User.find_by_id(params[:id])
			end

		desc "update User"
			params do 
				optional :name, :email, :phone, :city, :password, :password_confirmation
			end
			put "user/:id" do
				ActiveRecord::Base::User.find_by_id(params[:id]).update_attributes(user_params)
			end

		helpers do
	    def user_params
	      ActionController::Parameters.new(params).permit(:name, :email, :phone, :city, :password, :password_confirmation)
	    end
  	end
	end
end