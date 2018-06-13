# Overview

The year is 2030. Elon Musk, the Marsfather, has declared intergalactic war
against robot-kind. It is your duty as the Overseer to seek out and
accredit an envoy of the galaxy's best Gunslingers and provide them with the
acclaim neccessary to defeat humanity's greatest enemy.

# Requirements

This application should be used to identify exceptionally talented gunslingers. Contenders are populated via [`db/seeds.rb`](db/seeds.rb)

* The Overseer (user) can view a list of Gunslingers and their Acclaimed status.

* The Overseer (user) can grant Acclaimed status to any non-acclaimed Gunslinger by issuing any Gunslinger-skill badge.

# Design considerations

A Gunslinger resource will represent an individual candidate. If a candidate is selected for duty, the Overseer will click 'Issue <badgename> badge' button, and the badge will be issued via a POST request to the [Acclaim API](0). The Gunslinger will be updated with badge information, and subsequently displayed in the interface as an 'Acclaimed Gunslinger'.

External API requests will be built in service objects, allowing for easy
compartmentalization and testing. API requests will be made with [`http (the Gem!)`](https://github.com/httprb/http)

Secrets/keys will be kept in the Rails 5.2 [`config/credentials.yml.enc`](2) file. The `RAILS_MASTER_KEY` env variable is set via Heroku configuration.

Continuous delivery is provided via [CircleCI](https://circleci.com). Successful builds will auto-deploy through Heroku pipelines.

# Roadmap

These features range from `[compulsory..nice-to-have]` in a production application (arranged roughly in prioritized order):

- [ ] Gunslinger can be issued multiple badges
- [ ] API response data is appropriately cached
- [ ] AcclaimAPI wrapper is extracted to gem
- [ ] AcclaimAPI wrapper accommodates all other endpoints
- [ ] User sees appropriate alerts/error messages when things go awry
- [ ] Many badges & templates will appropriately paginate
- [ ] Badge confirmation emails are actually triggered
- [ ] Badge issuance/revocation events trigger webhook callback to sync app & Acclaim data
- [ ] Badging feature accommodates high_volume endpoint
- [ ] Badges link through to vanity URL
- [ ] Users can authenticate (login), to allow for multiple Overseers
- [ ] Gunslinger candidates can be imported from [Marvel character API](1) or other external data source
- [ ] Application has 100% test coverage
- [ ] Application exhibits some semblance of modern styling/UX
- [ ] "Issue badge" button uses AJAX request for smoother UX
- [ ] User can read some interesting copy/flavor text

[0]: https://sandbox.youracclaim.com
[1]: https://developer.marvel.com/docs
[2]: https://www.engineyard.com/blog/rails-encrypted-credentials-on-rails-5.2
