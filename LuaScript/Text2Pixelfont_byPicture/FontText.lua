function convertTexttoPicture(inputText) 
    app.transaction(

        function()
            -- テキスト画像の1文字当たりのX軸方向のサイズ
            UNIT_TEXT_X_PX = 5
            -- テキスト画像の1文字当たりのY軸方向のサイズ
            UNIT_TEXT_Y_PX = 5
            -- UTF-8の文字コードの数字の開始位置
            UNICODE_NUMBER_INITIAL = 48
            -- UTF-8の文字コードの文字の開始位置
            UNICODE_CHAR_INITIAL = 97

            -- フォント画像(レイヤー)を取得する
            local fontImage = app.activeSprite.layers[1].cels[1].image:clone()

            -- 画像ファイルの場合
            -- local fontImage = Image{ fromFile=filename }

            -- 出力先レイヤー取得
            local newLayer = app.activeSprite:newLayer()
            local destinationCel = app.activeSprite:newCel(app.activeSprite.layers[2], app.activeSprite.frames[1])


            -- 横方向の出力変数
            local Xposition = 0
            --　文字抜粋用：X軸
            local textX = 1
            --　文字抜粋用：Y軸
            local textY = 1

            --ループ：入力された文字数分
            for pos, text in utf8.codes(inputText) do

                if text < UNICODE_CHAR_INITIAL then
                -- 数字の場合
                textY = 1
                textX = 1 + UNIT_TEXT_X_PX * (text - UNICODE_NUMBER_INITIAL) + 1 * (text - UNICODE_NUMBER_INITIAL)
                else
                -- 文字の場合
                -- 単位+枠線分 2px
                textY = UNIT_TEXT_Y_PX + 2
                textX = 1 + UNIT_TEXT_X_PX * (text - UNICODE_CHAR_INITIAL) + 1 * (text - UNICODE_CHAR_INITIAL)
                end


                -- 文字の描画
                for it in fontImage:pixels(Rectangle{x=textX, y=textY, width=UNIT_TEXT_X_PX, height=UNIT_TEXT_Y_PX}) do
                local pixelValue = it() -- get pixel
                destinationCel.image:drawPixel(Xposition + it.x - textX, it.y - textY, pixelValue)
                end

                -- 描画横位置を次に進める
                Xposition = Xposition + UNIT_TEXT_X_PX + 1

                --   -- a:97
                --   -- l:108
                --   -- w:119
                --   -- 0:48   1:49   9:57

                --   app.alert("done.")


                --   -- minus:48
                --   -- 0:0
                --   -- 1:1
                --   -- a:49
                --   -- b:50
                --   -- c:51
                --   -- l:60
                --   -- w:71

            end 

        end)
end

do


  local dlg1 = Dialog{ title="ドット絵文字入力ツール" }

  local outputText = ""

  dlg1:newrow()
  dlg1:label   {   text= "出力する文字を入力してください。" }
  dlg1:entry  {id = "outputText",
  text=outputText
  }
  dlg1:newrow()
  dlg1:button  {  text = "出力",
                  onclick=
                    function()
                      local outputText = dlg1.data.outputText
                      convertTexttoPicture(outputText)
                    end
  }
  dlg1:button  {  text = "やめやめ",
                  onclick=
                    function()
                      dlg1:close()
                    end
  }
  dlg1:show    {   wait=true
  }

end