#!/bin/sh
dropdb -U `whoami` clean_rails
createdb -U `whoami` clean_rails
dropdb -U `whoami` clean_rails_test
createdb -U `whoami` clean_rails_test
