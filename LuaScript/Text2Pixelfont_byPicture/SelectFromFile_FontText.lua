function convertTexttoPicture(inputText, filepath, unitX, unitY) 
    app.transaction(

        function()
            -- テキスト画像の1文字当たりのX軸方向のサイズ
            UNIT_TEXT_X_PX = unitX
            -- テキスト画像の1文字当たりのY軸方向のサイズ
            UNIT_TEXT_Y_PX = unitY
            -- UTF-8の文字コードの数字の開始位置
            UNICODE_NUMBER_INITIAL = 48
            -- UTF-8の文字コードの文字の開始位置
            UNICODE_CHAR_INITIAL = 97

            -- 画像ファイルからImageを生成する。
            local fontImage = Image{ fromFile=filepath}

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
            --pos:文字位置(バイト単位)
            for pos, text in utf8.codes(inputText) do
              
                if text < UNICODE_CHAR_INITIAL then
                -- 数字の場合(画像の1段目)
                textY = 1
                -- 文字単位+枠線分 2px
                -- 数字の場合(画像の1段目)
                textX = 1 + UNIT_TEXT_X_PX * (text - UNICODE_NUMBER_INITIAL) + 1 * (text - UNICODE_NUMBER_INITIAL)
                else
                -- 文字の場合(画像の2段目)
                -- 文字単位+枠線分 2px
                textY = UNIT_TEXT_Y_PX + 2
                textX = 1 + UNIT_TEXT_X_PX * (text - UNICODE_CHAR_INITIAL) + 1 * (text - UNICODE_CHAR_INITIAL)
                end

                -- 文字の描画(Imageから文字に相当する範囲を抜粋したピクセル群に対して処理する)
                for it in fontImage:pixels(Rectangle{x=textX, y=textY, width=UNIT_TEXT_X_PX, height=UNIT_TEXT_Y_PX}) do
                  -- ピクセルの色を抜粋
                  local pixelValue = it()
                  -- 出力先セルの該当位置に1ピクセル出力する
                  destinationCel.image:drawPixel(Xposition + it.x - textX, it.y - textY, pixelValue)
                end

                -- 描画横位置を次に進める
                Xposition = Xposition + UNIT_TEXT_X_PX + 1

                -- 参考：UTF-8の文字コード
                --   -- a:97
                --   -- l:108
                --   -- w:119
                --   -- 0:48   1:49   9:57

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

-- メインの処理はここから
do

  local dlg1 = Dialog{ title="ドット絵文字入力ツール" }

  local outputText = ""
  local filepath = ""
  local unitX = 5
  local unitY = 5

  -- ここからはダイアログを作る処理

  dlg1:newrow()
  dlg1:label   {   text= "出力する文字を小文字で入力してください。" }
  dlg1:entry  {id = "outputText",
  text=outputText
  }
  dlg1:newrow()

  -- ファイル選択ボタン
  dlg1:file{ id="filepath",
  filetypes={"png"},
  open=true,
  onchange=
    function()
      filepath = dlg1.data.filepath
    end
  }

  dlg1:newrow()

  dlg1:number{ id="X",
  label="1文字あたりのX軸ピクセル数",
  decimal=5,
  onchange=
  function()
    unitX = dlg1.data.X
  end
  }
  
  dlg1:number{ id="Y",
  label="1文字あたりのY軸ピクセル数",
  decimal=5,
  onchange=
  function()
    unitY = dlg1.data.Y
  end
  }
  

  dlg1:newrow()
  dlg1:button  {  text = "出力",
                  onclick=
                    function()
                      local outputText = dlg1.data.outputText
                      convertTexttoPicture(outputText,filepath,unitX,unitY)
                      dlg1:close()
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