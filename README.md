# Foodilicious - A food ordering web app

## Getting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle config set without production
$ bundle
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
