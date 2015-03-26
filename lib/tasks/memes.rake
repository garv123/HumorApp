
namespace :memes do
	desc "TODO"
  	task get_meme: :environment do
  		Topic.all.each do |tobject|
  			topic = tobject.topic_name.gsub(/\s/, '+')
  			check="http://9gag.com/search?query=#{topic}"
  			http = Curl.get("http://9gag.com/search?query=#{topic}") do |http|
				http.headers['User-Agent']='Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:36.0) Gecko/20100101 Firefox/36.0'
			end
			page = Nokogiri::HTML(http.body_str)
			
			count=page.css('li.badge-search-entry-entity').length
			if count>=6
				print count
				count=6
			end
			
			for i in 0..count-1
				id= page.css('li.badge-search-entry-entity')[i]["data-entry-id"]
				if Meme.where(data_entry_id:id).empty?
					

					title= page.css('li.badge-search-entry-entity')[i].css('div.info').at_css('h3').text.strip
					sleep 10
					begin
						ht = Curl.get("http://9gag.com/gag/#{id}") do |http|
						http.headers['User-Agent']='Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:36.0) Gecko/20100101 Firefox/36.0'
						end

						page_for_image = Nokogiri::HTML(ht.body_str)
						src= page_for_image.at_css('img.badge-item-img')["src"]
					
						photo= src.split("/")
						url = photo[photo.length-1]
						path_of_pic= "app/assets/images/"+"#{url}"
						agent = Mechanize.new
						agent.get(src).save "#{path_of_pic}"
						meme = Meme.new(:title =>title,:data_entry_id =>id,:src=>url)
						tobject.memes << meme
					rescue Exception
						puts 'Cant connect'
					end
				

				else
					break
				end

			end
			


  		end
  		

  	end
end