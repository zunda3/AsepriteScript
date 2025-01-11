do

	local listfiledestination = "C:\\sikuliX\\AsepriteScript\\Layerlist\\list.txt"
	local spr = app.activeSprite

	-- app.alert(listfiledestination)
  
	-- io.openで、ファイルを開く
	f = io.open(listfiledestination, "r")

	tbl = {} 
	linecount = 1

	for line in f:lines() do
		tbl[linecount] = line
		linecount = linecount + 1
	end

	-- 最後にf:closeでファイルを閉じる
	f:close()

	if not spr then return app.alert "There is no active sprite" end
    
	local dlg = Dialog()
	dlg:entry   {   id= "rows",
	label= "ready?"
	}
  
	dlg:button{ id="ok", text="OK" }
	dlg:button{ id="cancel", text="Cancel" }
	dlg:show()
  
	local data = dlg.data

	LAYER_COUNT = linecount
	app.transaction(
		function()
		for i = 1, LAYER_COUNT-1, 1 do
			app.activeSprite.layers[LAYER_COUNT-i].name = tbl[i]
		end
		app.alert ("finished")
	end)
	
end