do

  local spr = app.activeSprite
  if not spr then return app.alert "There is no active sprite" end

  app.transaction(
    function()
	local celcol = app.activeSprite.layers[1].cels
	for i = 2, #celcol, 1 do
		local newLay = spr:newLayer()
		local newcel = spr:newCel(app.activeSprite.layers[i], app.activeSprite.frames[1])
		local image = app.activeSprite.layers[1].cels[2].image
		local copy = image:clone()
		newcel.image = copy
		app.activeSprite:deleteFrame(2)
    end
    end)
end