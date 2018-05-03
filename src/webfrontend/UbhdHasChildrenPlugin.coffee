class UbhdHasChildrenPlugin extends DetailSidebarPlugin

	prefName: ->
		"ubhd-has_children-plugin"

	getPane: ->
		"top"

	renderObjectDetailSidebar: ->
		console.info("UbhdHasChildrenPlugin.renderObjectDetailSidebar():");
		console.log(this._detailSidebar);
		has_parent = false
		has_children = false
		el_parent = CUI.dom.findElement(@_detailSidebar.__detail_div.DOM,'div.ez5-linked-object-hierarchy')
		if (el_parent)
			console.log('HAS PARENT')
			has_parent = true
		if (this._detailSidebar.object.data._has_children)
			console.log('HAS CHILDREN')
			has_children = true
		if (has_children || has_parent)
			el_hbutton = CUI.dom.findElement(@_detailSidebar.toolbar.DOM,'div[ez5-loca-key="detail.sidebar.hierarchy.button"]')
			if (el_hbutton)
				CUI.dom.data(el_hbutton).element.addClass("ubhd-hierarchy-button-red")	
		if (has_children)
	                el = CUI.dom.findElement(@_detailSidebar.__detail_div,'div.ez5-fields-renderer-head-container div.fields-renderer-plain')
			if (el)
				console.log('found')
				i = new CUI.Icon({icon: "svg-hierarchy"})
				t = new CUI.Label(text: $$("ubhd-hierarchy-text"))
				b = new CUI.HorizontalLayout
					left:
						content: i 
					center:
						content: t 
						class: 'ubhd-hierarchy-text'
					class: 'ez5-field-block'
				CUI.dom.append(el, b)

	isAvailable: ->
		true

	hideDetail: ->
		@_detailSidebar.mainPane.empty("top")



ez5.session_ready =>
	DetailSidebar.plugins.registerPlugin(UbhdHasChildrenPlugin)
	ez5.pluginManager.getPlugin("ubhd-has_children-plugin").loadCss()
