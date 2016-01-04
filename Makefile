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
	install -d build/css



#
# Various test to pass build
#
.PHONY: lint

list: csslint



#
# less
#
.PHONY: less

less: build
	lessc --clean-css style/style.less build/css/style.css



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
