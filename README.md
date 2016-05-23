# Makers BnB

Makers Academy Week 6 Group Project

MVP of an AirBnB clone using Ruby, Sinatra, Postgresql, DataMapper, Javascript, JQuery (including AJAX), Bootstrap, and test driven using RSpec/Capybara.

Hosted on Heroku at [https://still-beyond-14508.herokuapp.com/](https://still-beyond-14508.herokuapp.com/)

- Users can sign up for an account, and add a listing.
- Once a listing has been added, the user can add inventory dates that the accommodation is available to be booked.
- Inventory can only be added by the user who listed the accommodation.
- A date can only be added to the inventory once for each acommodation - dates are blocked off the datepicker once the inventory has been added for that date.

- Users can also request to stay at accommodation that they have not listed.
- The creates a reject object that the accommodation owner can accept or reject.
- This updates the request object, so the requestor can see if it has been accepted or rejected.
- Accepting the request also makes a custom AJAX PUT request to update the relevant inventory dates as booked.
- A date can only be requested if it has not already been booked - again this is done through blocking dates out of the datepicker.

- An AJAX get request is made to get inventory data for the selected accommodation when the page with datepickers is loaded. The returned json data is then used to block out out the dates as required.

[![Build Status](https://travis-ci.org/harrim91/makers-bnb.svg?branch=master)](https://travis-ci.org/harrim91/makers-bnb)
[![Coverage Status](https://coveralls.io/repos/github/harrim91/makers-bnb/badge.svg?branch=master)](https://coveralls.io/github/harrim91/makers-bnb?branch=master)


Collaborators
-------
 - [Daniel Ortiz](http://www.github.com/Vollcode)
 - [Michael Harrison](http://www.github.com/harrim91)
 - [Noah Pollock](http://www.github.com/knowerlittle)
 - [Ruta Baltiejute](http://www.github.com/Melodija)
