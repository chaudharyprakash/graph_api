module API
	class Articles < Grape::API
	include API::Defaults

	desc "Return all Articles"
	 	get "article" do
	    Article.all
	  end

	desc "create Article"
		params do
			optional :title,:s_description,:l_description
			# requires :image,type: File
			# optional
			# requires :title,type: Array[String]
		end
		post "article" do
			 ActiveRecord::Base::User.first.articles.create(article_params)
		# images = []
	  #   params[:image].each do |i|
	  #     images << article.pictures.create(image:params[:image])
	  #   end
	  #   categories_array = params[:article][:categories].map { |k,v| v }
	  #   categories = Category.where(id: categories_array)
	  #   article.categories << categories
		end

	desc "update Article"
		params do
		  optional :title,:s_description,:l_description
		  # optional :image
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