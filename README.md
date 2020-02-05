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
and Rails version is at least 5.2.4.1
```
$ rails -v
Rails 5.2.4.1
```

You also need to install node.js and yarn.

Install rbenv in order to manage and install different Ruby version.

Use rbenv to change the local and global versions of Ruby.

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

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

## Help page

For general help on the Rails Tutorial, see the [Rails Tutorial Help page](https://www.railstutorial.org/help).
