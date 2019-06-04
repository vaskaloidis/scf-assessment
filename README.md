# SCF-Assessment

## Install

```
bundle install
```

## Usage

Default parameters are `description, service_name, service_request_id`

To query by an account

```
bundle exec bin/scf --account <ID>
bundle exec bin/scf --account 29

```

To query by latitude and longitude

```
bundle exec bin/scf --geo <LATITUDE>,<longitude>
bundle exec bin/scf --geo 41.307153,-72.925791

```

Specify the parameters to return (default parameter delimeter is a ,)

```
bundle exec bin/scf --account 29 --params zipcode,address
bundle exec bin/scf --geo 41.307153,-72.925791 --params zipcode,address
```

To returns parameters using a different delimeter (like a +) use `--param_delimeter`

```
bundle exec bin/scf --account 29 --params zipcode+address --param_delimeter +
bundle exec bin/scf --geo 41.307153,-72.925791 --params zipcode+address --param_delimeter +
```

To filter results with a search-keywoard add the `--search` parameter

```
bundle exec bin/scf --account location4 --params zipcode+address --param_delimeter + --search KEYWORD
bundle exec bin/scf --geo 41.307153,-72.925791 --params zipcode+address --param_delimeter + --search KEYWORD
```


## Test

This gem will build on Travis CI automatically upon push to GitHub.

View On Travis: https://travis-ci.org/vaskaloidis/scf-assessment

To run tests:

```
bundle exec rake
```

## Locations

```
location1: 53
location2: 548
location3: 549
location4: 29
```