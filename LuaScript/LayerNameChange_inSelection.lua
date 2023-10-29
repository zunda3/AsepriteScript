local dlg = Dialog("Rename Layer")
--色の定義(define color informations)
local HUMAN = Color{ r=209, g=134, b=223 }
local CLOTH = Color{ r=106, g=205, b=91 }
local BACKGROUND = Color{ r=20, g=20, b=200 }
local NONE = Color{ r=0, g=0, b=0 }

--リスト内容の定義(define layer name collections)
local layerNamesSelection = 
{
"髪",
"髪背面",
"顔",
"メガネ",
"顔効果",
"顔パーツ",
"服",
"→手",
"←手",
"胴体(胸部)",
"胴体(腰)",
"→足",
"←足",
"靴下",
"背景エフェクト",
"家具",
"背景"
}


dlg:label { text="Enter a new name for the layer:" }
dlg:combobox {
    id="new_layer_name",
    options=layerNamesSelection,
    onchange=function()
        local newLayerName = dlg.data.new_layer_name
        app.activeLayer.name = newLayerName

        --(レイヤ背景色も変えたいときだけコメント外してください)
        --(The following processes are change the layer color.
        -- If you want to change the color, disable these comment out.)
        -- if newLayerName == "髪" or 
        -- newLayerName == "髪背面" or 
        -- newLayerName == "顔" or 
        -- newLayerName == "顔効果" or 
        -- newLayerName == "顔パーツ" or 
        -- newLayerName == "→手" or 
        -- newLayerName == "←手" or 
        -- newLayerName == "胴体(胸部)" or 
        -- newLayerName == "胴体(腰)" or 
        -- newLayerName == "→足" or 
        -- newLayerName == "←足"  then
        --   app.activeLayer.color = HUMAN
        -- elseif newLayerName == "靴下" or 
        -- newLayerName == "メガネ" or
        -- newLayerName == "服" then
        --   app.activeLayer.color = CLOTH
        -- elseif newLayerName == "背景エフェクト" or 
        -- newLayerName == "家具" or 
        -- newLayerName == "背景" then
        --   app.activeLayer.color = BACKGROUND    
        -- else
        --   app.activeLayer.color = NONE
        -- end
    end }
dlg:button { text="Cancel", onclick=function()
  dlg:close()
end }
dlg:show { wait=false }