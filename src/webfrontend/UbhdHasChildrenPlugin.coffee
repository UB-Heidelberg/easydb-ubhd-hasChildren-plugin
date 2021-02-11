ez5.session_ready =>
	ez5.pluginManager.getPlugin("ubhd-has_children-plugin").loadCss()
	CUI.Events.listen
		type: "detail-sidebar-render-object"
		call: (ev, info) =>
			ds = info.detailSidebar
			obj = ds.getResultObject()
			btn = CUI.dom.findElement(ds.container.DOM, "[ez5-loca-key='detail.sidebar.hierarchy.button']")
			has_parent = false
			has_children = false
			if (obj.getData().objekte._id_parent)
				has_parent = true
			if (obj.getData()._has_children)
				has_children = true
			if (has_children || has_parent)
				if (btn)
					CUI.dom.data(btn).element.addClass("ubhd-hierarchy-button-red")
			if (has_children)
				console.log('ds',ds)
				el = CUI.dom.findElement(ds.__card_div, 'div.ez5-result-card-info')
				if (el)
					i = new CUI.Icon({icon: "svg-hierarchy"})
					t = new CUI.Label(text: $$("ubhd-hierarchy-text"))
					b = new CUI.HorizontalLayout
						left:
							content: i
						center:
							content: t
							class: 'ubhd-hierarchy-text'
						class: 'ubhd-hierarchy-block'
					CUI.dom.append(el, b)
