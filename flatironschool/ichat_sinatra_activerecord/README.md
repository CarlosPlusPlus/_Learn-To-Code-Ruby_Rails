#iChat using Sinatra and Active Record

## Objectives
* integrate Active Record with Sinatra
* make an http request from a script (rather than a web browser)
* use a model to access data from a database
* display data from a database in a view

## Resources
* http://rubydoc.info/gems/activerecord/4.0.0/frames
* https://github.com/janko-m/sinatra-activerecord
* http://danneu.com/posts/15-a-simple-blog-with-sinatra-and-active-record-some-useful-tools/
* https://github.com/typhoeus/typhoeus
* https://github.com/cldwalker/tux

## Instructions

### Setup

--note: '$' means command should be run on command line --

* fork this repo `git clone`
* `$cd repo_name`
* `$bundle install`
* `$rake db:migrate`
* `$shotgun`
* Open up a second terminal tab and run `$tux`
* In the post_message.rb script modify the uri variable to match your the port your server is running on. For Example:

````bash
  == Shotgun/Thin on http://127.0.0.1:9393/
  >> Thin web server (v1.5.0 codename Knife)
  >> Maximum connections set to 1024
  >> Listening on 127.0.0.1:9393, CTRL+C to stop
````
* In the above example '127.0.0.1:9393' is your uri

### Posting a Params hash from a ruby script

* first try posting a hash to a url `Typhoeus.post(uri, :body => {:key => 'value'})` and put the debugger into your post route. Then, in the console print out "params." You can do this in your post_message.rb script like this:

````ruby
  uri = "127.0.0.1:9393/"
  Typhoeus.post(uri, {key: 'value'})
`````
* When you do, you should `{key => 'value'}` printed in the debugger.
* You access this is the same way that you do when using a form `params[:key] #=> 'value'`
* Now, using Typhoeus gem, post the sender,  receiver and message variables to the `post '/'`

******************************************************************************
 *NOTE: When doing this, keep in mind what the params hash looked like when your input came from a form, this is no different except you are directly passing the hash to the url from the ruby script.*
******************************************************************************

* Modify the `post '/'` route to create a message based on user input from the post_message.rb script

******************************************************************************
 *HINT: Thanks to active record magic, you don't have to assign them all individually. Take a look at the [create method](http://apidock.com/rails/ActiveRecord/Base/create/class/)*
******************************************************************************

* Modify the `get '/reset'` route to delete all messages in the database.
* At this point, in another terminal tab you should be able to run the post_message.rb script and it should successfully post to the server.
* You will know it works by going into the 'tux' terminal and typing `Message.all`. You should see the message that you sent.
* Now, modify the messages view to display all of the messages in the database.
* Your resulting view should look something like this:


![Imgur](http://i.imgur.com/Aao1Vul.png)