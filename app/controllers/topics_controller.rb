class TopicsController < ApplicationController
  layout 'index'
  def index
  	@topics = Topic.all

  end


end
