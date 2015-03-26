module API
	class TopicsController < ApplicationController
		def index
			@topic = Topic.all
			respond_to do |format|
				format.json {render json: @topic.as_json(only:[:id,:topic_name])}
			end
		end
	end
end 