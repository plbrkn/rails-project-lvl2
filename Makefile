test:
	bin/rails test

setup:
	bin/setup
	bin/rails db:fixtures:load

server:
	bin/rails s

console:
	bin/rails c

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

deploy:
	git push heroku main

.PHONY: test
