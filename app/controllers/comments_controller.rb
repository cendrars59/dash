class CommentsController < ApplicationController

	
	def create
		@log = Log.find(params[:log_id]) 
		@comment = @log.comments.create(comment_params)
		@comment.user_id = current_user.id 

		if @comment.save 
			redirect_to @log
		else 
			render 'new'
		end 
	end

	def show 

	end 

	def edit 

	end 

	def destroy 

	end

	 
	private

	def comment_params
		params.require(:comment).permit)(:comment)
	end 



end
