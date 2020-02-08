# lets-talk


By Steven Tat.

Lets-Talk is a instant chat messaging application designed to be a simple chat that you can use for your own
person usage. 

##Prepare your environment
Follow the instructions below to prepare your environment to host and run the Chat Application.

Make sure that your Ruby version is 2.3.7
```
$ ruby -v
ruby 2.3.7
```
Rails requires Ruby version 2.5.0 or later. If the version number returned is less than that number, you'll need to install a fresh copy of Ruby.


To quickly install Ruby and Ruby on Rails on your system in Windows, you can use Rails Installer. For more installation methods for most Operating Systems take a look at ruby-lang.org.

If you are working on Windows, you should also install the Ruby Installer Development Kit.

You will also need an installation of the SQLite3 database. Many popular UNIX-like OSes ship with an acceptable version of SQLite3. On Windows, if you installed Rails through Rails Installer, you already have SQLite installed. Others can find installation instructions at the SQLite3 website. Verify that it is correctly installed and in your PATH:

Make sure that SQLite is installed

```
$ sqlite3 --version 
3.19.3
```

To install Rails, use the gem install command provided by RubyGems:

```
$ gem install rails
```

Make sure that Rails version is at least 5.2.4.1 before proceeding
```
$ rails -v
Rails 5.2.4.1
```

You also need to install yarn to install JavaScript dependencies to use Bootstrap.
https://classic.yarnpkg.com/en/docs/install/#mac-stable

Installing rbenv will help to manage and install different Ruby versions.
https://github.com/rbenv/rbenv

You can use rbenv to change the local and global versions of Ruby.

Add Ruby to your PATH.

## Getting started

To get started with the app, first clone the repo and `cd` into the directory:

```
$ git clone https://github.com/steventat/lets-talk.git
$ cd lets-talk
```

Then install the needed gems:

```
$ bundle install
```

Install JavaScript dependencies:

```
$ yarn install
```

Next, migrate the database:

```
$ rails db:migrate
```

This project requires an instance of Twilio Programmable Chat to chat between users. A Twilio account is required to create an instance of the Programmable Chat.
If you don't yet have a Twilio account, you can create one for free. Once you're logged into your account, navigate to the Programmable Chat Dashboard and create a new chat service

The Rails application will need access to the Twilio chat service ID and a few other credentials. 
Create a new .env file to store them now.
```
# ./.env

TWILIO_ACCOUNT_SID=your_account_sid
TWILIO_API_KEY=your_api_key
TWILIO_API_SECRET=your_api_secret
TWILIO_CHAT_SERVICE_SID=your_chat_service_sid
```


Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Help page

For more help with installing Rails, check out the tutorial.(https://guides.rubyonrails.org/getting_started.html)
