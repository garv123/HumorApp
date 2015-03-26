require 'test_helper'

class TopicTest < ActionDispatch::IntegrationTest
	setup { host! 'api.example.com' }

	test 'returns list of all topics' do 
		get '/topics'
		assert_equal 200,response.status
		refute_empty response.body
		
	end

end