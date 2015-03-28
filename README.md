# HumorApp

Its an app for scraping 9gag memes.

Setup

1.Install mysql,create a database  and edit the config/database.yaml
2. Run bundle install
3. Run rake db:migrate to setup the database
3. Feed some topic which you want to scrape for in the topics table.



Major Gems Used-

1. Nokogiri - For scraping websites. ( A rake task in libs/tasks/memes.rake)
2. Mechanize - for saving images while scraping. 
3. Whenever - For running cron tasks.(Code in config/schedule.rb)


API'S can be accessed by changing the host file if running on localhost 

example- 127.0.0.1 humor-app-dev.com
         127.0.0.1	api.humor-app-dev.com

and can be accessed as http://api.humor-app-dev.com:3000/api/topics.json

