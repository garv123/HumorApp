class MemesController < ApplicationController
  
  def show
  	@topic = Topic.find(params[:id])
  	@memes=@topic.memes
  	

  end

  def update
  	@memes= Meme.find(params[:id])

  	if params[:flag] == 'yes'
  		likes = 1+@memes.likes
  		@memes.update_attributes(:likes => likes)
  		respond_to do |format|
  			format.json { render :json => {:likes => likes} }
  		end

  	else
  		dislikes = 1+@memes.dislikes
  		#puts dislikes
  		@memes.update_attributes(:dislikes => dislikes)
  		respond_to do |format|
  			format.json { render :json => {:dislikes => @memes.dislikes} }
  		end

  	end

  end

end
