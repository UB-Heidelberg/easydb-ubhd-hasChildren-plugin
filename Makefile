PLUGIN_NAME = ubhd-has_children-plugin

INSTALL_FILES = \
	$(WEB)/l10n/cultures.json \
	$(WEB)/l10n/de-DE.json \
	$(WEB)/l10n/en-US.json \
	$(CSS) \
	$(WEB)/ubhd-has_children-plugin.js \
	ubhd-has_children-plugin.yml

L10N_FILES = l10n/ubhd-has_children-plugin.csv

#L10N_GOOGLE_KEY = 1Z3UPJ6XqLBp-P8SUf-ewq4osNJ3iZWKJB83tc6Wrfn0
#L10N_GOOGLE_GID = 1105524345

CSS = $(WEB)/ubhd-has_children-plugin.css

SCSS_FILES = src/webfrontend/ubhd-has_children-plugin.scss

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
