Dir["./lib/*"].each {|file| require file }

module SpaceCats
	class Spacecat < Sinatra::Application
	#kept getting "NameError: uninitialized constant SpaceCats::Sinatra" error, 
	#spent a lot of time trying new things without looking it up, put aside this project, 
	#went to sql section of test. 2:49pm.

		get '/' do
			erb :index
		end

		post '/results' do

			erb :results
		end

		get '/results' do
	
		end

		post '/all_cats' do
			erb :all_cats
		end


			

	end
end