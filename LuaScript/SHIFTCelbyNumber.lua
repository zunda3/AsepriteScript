do

  local spr = app.activeSprite

  if not spr then return app.alert "There is no active sprite" end

  local dlg = Dialog()
  dlg:entry   {   id= "addcount",
  label= "増分数を入力してください"
  }

  dlg:button{ id="ok", text="OK" }
  dlg:button{ id="cancel", text="Cancel" }
  dlg:show()

  local addquantity = dlg.data


  local dlg = Dialog()
  dlg:entry   {   id= "frames",
  label= "移動フレームを入力してください。"
  }

  dlg:button{ id="ok", text="OK" }
  dlg:button{ id="cancel", text="Cancel" }
  dlg:show()

  local framequantity = dlg.data

  local dlg = Dialog()
  dlg:entry   {   id= "direction",
  label= "移動方向(left/right/up/down)を入力してください。"
  }

  dlg:button{ id="ok", text="OK" }
  dlg:button{ id="cancel", text="Cancel" }
  dlg:show()

  local directiondata = dlg.data

    
    local layerCount = app.activeCel.layer.stackIndex
    local firstFrameCount = app.activeCel.frame.frameNumber
    
  for i = 1, framequantity.frames, 1 do

      -- 正攻法
      app.command.Copy()
      spr:newCel(app.activeLayer, app.activeSprite.frames[firstFrameCount+i])
      app.activeCel = app.activeLayer.cels[firstFrameCount+i]
      app.command.Paste()

      -- 救済処置（ただしフレームが追加される）１
      -- app.command.Copy()
      -- app.command.NewFrame()
      -- app.command.Paste()

      -- 範囲コピー（共通）
      spr.selection:selectAll()
      -- 選択範囲移動（共通）
      app.command.MoveMask{
          target='content',
          direction=directiondata.direction,
          units='pixel',
          quantity=(addquantity.addcount*i),
          wrap=false
        }
                    
  end

end