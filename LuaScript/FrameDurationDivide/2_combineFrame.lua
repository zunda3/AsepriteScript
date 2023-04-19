function combineFrameDuration() 
    app.transaction(

        function()
			-- Get active sprite
			local spr = app.activeSprite

			--変数
			local currentFrame = 1
			local devideCount = 0
			local nowframes = spr.frames
			local framescount = #nowframes

			--既存のフレーム数分処理する
			for i = 1, framescount-1, 1 do
				--比較用のイメージ取得
				cmprImage = app.activeSprite.layers[1].cels[currentFrame].image

				--次のフレームのイメージと比較して同じなら、フレームの時間足した上で次のフレーム削除
				if app.activeSprite.layers[1].cels[currentFrame+1].image:isEqual(cmprImage) then
					spr.frames[currentFrame].duration = (spr.frames[currentFrame].duration * 1000 + spr.frames[currentFrame+1].duration * 1000) /1000
					spr:deleteFrame(currentFrame+1)
				else
					--異なるなら次のフレームを処理対象にする。
					currentFrame = currentFrame + 1
				end
			end
	end)
end

do
	combineFrameDuration()
end