# LinkChecker

This is a demo application.  The basic functionality is a site that allows the user to enter a url.  The LinkChecker will then parse the contents of the url entered using nokogiri, get all the link tags in the page, and check if the links are valid (returns a 200 or 300).

## Objectives

* Show a use case for doing work in the background
* Demonstrate Redis and Sidekiq to fix the problem

## Best Practices

* Notice that the `.gitignore` file adds a line for `*.rdb`.  This is the backup file for redis and should not be stored in git.
* Remember that redis should not store complex objects.  Therefore, when passing a parameter to a `preform_async` method, never use something complicated like an active recrod object.  Instead, use a simple identifier like the id of the record in the database.
* Take a look at the `Procfile`.  It is used by heroku when deploying the app.  The `Procfile` tells heroku what server to run and where to find the config file.
* Don't forget to add the important gems for a sidekiq and unicorn setup:  `sidekiq`, `unicorn`, `unicorn-rails` (development purposes).


