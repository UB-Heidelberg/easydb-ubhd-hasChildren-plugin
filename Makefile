PLUGIN_NAME = easydb-ubhd-hasChildren-plugin

INSTALL_FILES = \
	$(WEB)/l10n/cultures.json \
	$(WEB)/l10n/de-DE.json \
	$(WEB)/l10n/en-US.json \
	$(CSS) \
	$(WEB)/easydb-ubhd-hasChildren-plugin.js \
	manifest.yml

L10N_FILES = l10n/easydb-ubhd-hasChildren-plugin.csv

CSS = $(WEB)/easydb-ubhd-hasChildren-plugin.css

SCSS_FILES = src/webfrontend/easydb-ubhd-hasChildren-plugin.scss

COFFEE_FILES = \
	src/webfrontend/UbhdHasChildrenPlugin.coffee

call_scss = sass --scss --no-cache --sourcemap=inline

all: build

include easydb-library/tools/base-plugins.make

build: code css

$(CSS): $(SCSS_FILES)
	mkdir -p $(dir $@)
	cat $(SCSS_FILES) | $(call_scss) > $(CSS)

code: $(JS) $(L10N)

css: $(CSS)

clean: clean-base
