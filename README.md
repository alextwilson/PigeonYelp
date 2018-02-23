# Yelp!

Yelp clone created by [Lewis Moore](https://github.com/lewmoore) | [Alex Wilson](https://github.com/alextwilson) | [Simon Bao](https://github.com/simonbao) | [Alexandra Fina](https://github.com/alexandragf)

The aim of this project was to create a working clone of Yelp using Rails. We split this projects development in to three phases; an MVP, Version 2 and Version 3. Each of these phases of development were split in to sprints with daily stand ups and team code reviews.

**Our MVP consisted of the following specifications:**

* A user can create a restaurant and specify a name and description.
* A restaurant can be deleted and edited
* A user can review a restaurant with a star rating and a comment
* A restaurant displays a list of all reviews

**Version 2 consisted of the following specification:**

* A user can register and sign up with an email address and password.
* User sign up requires password validation
* A user can see if they are logged in and have the ability to to change their own account details
* A users email address is displayed on every review that they leave
* A user can't review restaurants that they created themselves
* A user can log in with Facebook via OmniAuth

**Version 3 introduced the following features**
* A user must be logged in in order to be able to create a restaurant
* A user can only edit and delete restaurants that they have created
* A user can only leave one review per restaurant
* A user can delete a review they have left
* A user can upload an image of a restaurant they are creating. This image will be stored in an Amazon S3 bucket
