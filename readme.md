Test Questions:

What is Sinatra? Where does it run?

Sinatra is a lightweight framework (compared so something like Rails) that allows the developer to build their project from the ground up rather than having files made for them with a scaffold when they create a project.  Essentially, the developer builds their own scaffold by creating a project file, then a views folder, a library folder (for ruby files/logic), a public folder for all viewable files (CSS, Images, etc) and perhaps a database folder to store migrations.  Its really flexible!

Sinatra can run locally on your computer, like Rails, or on a server like Heroku (meaning external server of your choosing).

What is a Gemfile? How do you use it in your Sinatra Application? Give step by step instructions.

A gemfile stores all the gems that are going to be used in a file.  For example, if the developer wanted to use bootstrap, sqlite3 and perhaps shotgun (a gem that automatically reloads changes when files are saved, rather than having to restart the server every time), they would just write out all the files like this:

gem 'bootstrap'
gem 'sqlite3'
gem 'shotgun'

If the gems are to only be used at certain times, like development, things can also be specified to load those gems when starting.  For example:

for development do
gem 'shotgun'
end

and the server will know only to load the other gems outside of this section of the file.

What is an ORM? What are the basic features of an ORM? Why is it helpful?

An ORM is an Object Record..  something.  Object Record Mapper?  There are versions such as ActiveRecord, DataMapper and Sequel which basically (in my inerpretation) act as a buffer between the database and the rest of the project- they make requests from the database and return information without ever really having to touch the database itself.  Like a personal assistant of projects, in a way.  They take requests from the model, field them to the database and then give something back to the model, which then passes it to the view, which then gives it to you, the viewer.

What is the public folder? What do we use it for?

A public folder holds any files that are viewable on the client side, such as CSS, images, font files, JavaScript files, et cetera.  This is the part of your project that holds everything that makes the site visually appealing and perhaps somewhat useful (e.g. JavaScript files).

What is REST? Why is it useful?

Its REpresentative State Transfer.  Its a file protocol that (as I imagine it) gives a logical map of how an app should run.  For example, the user can GET a file and then POST to a file.  I connect this with CRUD- the user can create, read, update and destroy files based on a logical pattern....?

Suppose I, with my browser, send an HTTP get request to the route that will render the view of all the SpaceCats. Walk me through step by step how your application handles that request.

HOW SPACECATS GET TO YOU  (You = "user")
1. You make an HTTP request to the server.  In this case, http://spacecats.com
2. The rack up file is the first thing that the request will hit.  This is, in our project, the Config file.  The config file says "start doing your thing, with the app.rb file, there's a module and new version of the class being created now!"
3. The request is sent to the app.rb file, which has the routes and the models within it.  There might also be a request for the library files for logic too.
4. The server goes down the app document line by line to see what the first GET request is.  It will then do whatever is in that first get request- such as:
	get '/' do <--- this is the route
		@thing = Thing.new <--- this is something we'll be rendering later in the view, 							basically saying make a new thing.
		erb :this_file <--- this is the view that you'll get
	end <-- this is saying, we're done, go do whatever we just asked for.

5. The server will then do whatever you requested in this first request. For this example, make a new instance of a Thing, then when that's done, spit the this_file.erb (embedded ruby file) back out to the user to get more stuff or show more stuff.
5a. If there's a database involved (such as for getting form information), this is when the data input method will gather the data to be stored.
6. The next request could be a post request, which shows you the results of what you asked for or input in the get request.
7. There are other functions as well, such as UPDATE and EDIT, but for this project you wouldn't really use them as much.
8. In the same fashion, further GET and POST requests could be made, such as to edit an item or to make a new one.  Repeat steps 4-6.

When all of this is done, at the end of the app.rb the class and module are closed.

Here's a more concise explanation of all of that:

client sends HTTP Request --> Config.ru --> app.rb(route/controller) -->get request sent to model -->model queries DB --> DB sends back to model -->model sends to views --->views sent back through app.rb--> client gets results of said request. 