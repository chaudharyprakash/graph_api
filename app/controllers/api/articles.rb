module API
	class Articles < Grape::API
		include API::Defaults

		desc "Return all Articles"
		 	get "article" do
		    Article.all
		  end

		desc "create Article"
			post "article" do
				ActiveRecord::Base::User.first.articles.create(article_params)
			end


		desc "update Article"
			params do
			  optional :title,:s_description,:l_description,:image,:categories
			end
			
			put "article/:id" do
				ActiveRecord::Base::Article.find_by_id(params[:id]).update_attributes(article_params)
			end

		desc "Delete Article"
			delete "article/:id" do
				ActiveRecord::Base::Article.destroy(params[:id])
			end

			helpers do
				def article_params
					ActionController::Parameters.new(params).permit(:title,:s_description,:l_description,:image,:categories)
				end
			end

	end
end