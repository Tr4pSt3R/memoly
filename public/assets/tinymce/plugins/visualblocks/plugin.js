tinymce.PluginManager.add("visualblocks",function(e,t){var n,i,a;window.NodeList&&(e.addCommand("mceVisualBlocks",function(){var o,r=e.dom;n||(n=r.uniqueId(),o=r.create("link",{id:n,rel:"stylesheet",href:t+"/css/visualblocks.css"}),e.getDoc().getElementsByTagName("head")[0].appendChild(o)),e.on("PreviewFormats AfterPreviewFormats",function(t){a&&r.toggleClass(e.getBody(),"mce-visualblocks","afterpreviewformats"==t.type)}),r.toggleClass(e.getBody(),"mce-visualblocks"),a=e.dom.hasClass(e.getBody(),"mce-visualblocks"),i&&i.active(r.hasClass(e.getBody(),"mce-visualblocks"))}),e.addButton("visualblocks",{title:"Show blocks",cmd:"mceVisualBlocks"}),e.addMenuItem("visualblocks",{text:"Show blocks",cmd:"mceVisualBlocks",onPostRender:function(){i=this,i.active(e.dom.hasClass(e.getBody(),"mce-visualblocks"))},selectable:!0,context:"view",prependToContext:!0}),e.on("init",function(){e.settings.visualblocks_default_state&&e.execCommand("mceVisualBlocks",!1,null,{skip_focus:!0})}),e.on("remove",function(){e.dom.removeClass(e.getBody(),"mce-visualblocks")}))});