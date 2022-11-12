# Deploying your Web server (on Render)

_**This is a Makers Vine.** Vines are designed to gradually build up
sophisticated skills. They contain a mixture of text and video, and may contain
some challenge exercises without proposed solutions. [Read more about how to use
Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to deploy an application using Render.

## Intro

It is now time to deploy your application so it runs remotely. Remember that
this is how web server programs work in real-world situations: they run on a
remote machine, and clients access it through the network, using HTTP requests
and responses.

In this section, you will use Render, which is a Cloud service allowing us to
deploy programs without too much configuration and work. It has a limited free
tier you can use for simple projects.

First, [you'll need to create an
account](https://dashboard.render.com/register). Then follow the steps below.

## Project Setup

This guidance assumes you have a small Ruby + Sinatra web application you want
to deploy. 

Your code will need to be deployed to a public github repository.

First, run the following in your project directory to make sure all the required
gems are installed, and the code is pushed to Github.

```bash
# Make sure the different gems are listed in the Gemfile
$ bundle add sinatra sinatra-contrib webrick rackup
$ bundle install

# This command will allow Render to run the `bundle` commands
$ bundle lock --add-platform x86_64-linux

# Make sure it's all committed and pushed to the Github repo
$ git add .
$ git commit -m "Setup for deploy"
$ git push -u origin main
```

## Setting Up The Server on Render

1. On [the dashboard](https://dashboard.render.com/), select "New Web Service"
2. You'll need to connect your Github repository containing your project.
   Connect your Github account and select the project repository.
3. Give a name to the web service (such as `my-web-app`), and leave all the
   default values. For the "Start Command", type in `rackup`, so Render knows it
   needs to run this command to run the server.
4. Select the "Free" plan and click the button "Create Web Service".
5. Wait for Render to retrieve the project's code and run the server. It should
   then be accessible in your browser at the URL given on the project page.

_You might have to wait a bit (sometimes up to an hour) before the web
application is accessible via that URL._

## Using a PostgreSQL Database on Render

### Step 1 - Creating the database on Render

1. On [the dashboard](https://dashboard.render.com/), select "New PostgreSQL"
2. On the setting up page, choose a name for the resource (such as
   `my-app-database`) and leave all the other fields empty. Render will generate
   some unique PostgreSQL database and user names for us.
3. Wait a few minutes for the database to be ready, then copy the "Internal
   Database URL" from the Connections panel on the page.

### Step 2 - Setting up the environment variable

1. Go back to your Web service on Render, and select "Environment" in the
   sidebar menu.
2. Add an environment variable with key `DATABASE_URL` and copy the value of the
   Internal Database URL copied in the previous section.
3. Save changes.

### Step 3 - Seeding the database

The database on Render needs to be seeded with the correct tables.

To connect to the database using `psql`, go on the database page on Render and
click the "Connect" button in the top-right corner of the page. Copy the PSQL
Command, and paste it directly into your terminal. It should look like this:

```bash
PGPASSWORD=********* psql -h dpg-cd7taj9gp3jgp4i9k55g-a.oregon-postgres.render.com -U my_app_database_user my_app_database
```

Run the command and `psql` should then connect to the remote database. Once
you're in the REPL, you can load the SQL structure and seeds of your tables by
copy pasting the SQL code in there.

### Step 4 - Update the code

Modify the `DatabaseConnection` class so it uses the environment variable set in
the previous section, if it is present, and connects to the right database.

```ruby
# file: lib/database_connection.rb

def self.connect
  # If the environment variable (set by Render)
  # is present, use this to open the connection.
  if ENV['DATABASE_URL'] != nil
    @connection = PG.connect(ENV['DATABASE_URL'])
    return
  end

  if ENV['ENV'] == 'test'
    database_name = 'music_library_test'
  else
    database_name = 'music_library'
  end
  @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
end
```

You can now commit your changes to the file, push it to Github, and redeploy the
web service on Render.

## Exercise

Deploy your previous challenge project to a new Render app.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F07_deploying_render.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F07_deploying_render.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F07_deploying_render.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F07_deploying_render.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications-in-python&prefill_File=html_challenges%2F07_deploying_render.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
