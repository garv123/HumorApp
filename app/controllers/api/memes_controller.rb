module API
	class MemesController < ApplicationController
		def index
			@memes = Meme.all
			respond_to do |format|
				format.json {render json: @memes.as_json(only:[:id,:topic_id,:likes,:dislikes,:src])}
			end
		end

		def show
			@memes = Meme.find(params[:id])
  	        
  	        puts @memes
  	        respond_to do |format|
				format.json {render json: @memes.as_json(only:[:id,:topic_id,:likes,:dislikes,:src])}
			end
		end
	end
end 