function divideFrameDuration(timeslice) 
    app.transaction(

        function()
			-- Get active sprite
			local spr = app.activeSprite

			--変数
			local currentFrame = 1
			local divideCount = 0
			local nowframes = spr.frames
			local framescount = #nowframes

			--既存のフレーム数分処理する
			for i = 1, framescount, 1 do

				--1000 = milisecond
				-- divideCount = spr.frames[currentFrame].duration / timeslice * 1000
				divideCount = math.floor(spr.frames[currentFrame].duration / timeslice * 1000)

				spr.frames[currentFrame].duration = timeslice / 1000

				for copyfrm = 1, divideCount-1, 1  do
					local newLay = spr:newFrame(currentFrame)
				end

				currentFrame = currentFrame + divideCount
			end
	end)
end

do
	local dlg = Dialog{ title="フレーム分割ツール" }
	
	dlg:entry   {   id= "inputtimeslice",
	label= "分割する時間単位を入力してください。",
	text = "10"
	}

	dlg:button  {  text = "OK",
	onclick=
	  function()
		local timeslice = dlg.data.inputtimeslice
		divideFrameDuration(timeslice)
	  end
	}
	dlg:button  {  text = "やめやめ",
		onclick=
		function()
			dlg:close()
		end
	}

	dlg:show()
	
end