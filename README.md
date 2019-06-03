# SCF-Assessment

## Install

```
bundle install
```

## Usage

To query by an account

```
bundle exec bin/scf --account <ID>
bundle exec bin/scf --account 29

```


To query by latitude longitude

```
bundle exec bin/scf --geo <LATITUDE>,<longitude>
bundle exec bin/scf --geo 41.307153,-72.925791

```


## Test

```
bundle exec rake
```