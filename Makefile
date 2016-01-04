#!/usr/bin/make -f
#
#



# Build and development environment using make
#
NPM_PACKAGES = 							\
	csslint								\
	less								\
	less-plugin-clean-css				\



#
# Build
#
.PHONY: build

build: 
	rm -rf build
	install -d build/css build/lint



#
# less
#
.PHONY: less

less: build
	lessc style/style.less build/css/style.css
	lessc --clean-css style/style.less build/css/style.min.css



#
# Lint
#
.PHONY: lint

lint: less
	lessc --lint style/style.less > build/lint/style.less
	- csslint build/css/style.css > build/lint/style.css
	ls -l build/lint/



#
# npm
#
.PHONY: npm-config npm-installl npm-update

npm-config: 
	npm config set prefix '~/.npm-packages'
	
npm-install: 
	npm -g install $(NPM_PACKAGES)

npm-update: 
	npm -g update
