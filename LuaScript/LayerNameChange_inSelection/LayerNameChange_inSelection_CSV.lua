local dlg = Dialog("Rename Layer")

local LayerNamesSelection = {}
local LayerColorssSelection = {}

--Delimiter in the combobox to layer name and indexes of layer color.
local Delimiter = "_____________________________________________________________________________________________________"
-- Delimiter in the list file.
local Filedelimiter = ","
-- List file of containing the contents of the combobox.
local ListFilePath = app.fs.userConfigPath.."scripts/list.csv"

-- Contents in list file must be written according to the following format.
-- "layer name,RGB(R),RGB(G),RGB(B)""
-- e.g. hair,209,134,233

local f = io.open(ListFilePath, 'r')

--If cannot found the list file, then stop running the script .
if f == nil then
  --  app.alert{title="LayerNameChange in Selection Script", text="レイヤ名のリストファイルが見つかりません。「list.csv」というファイル名でスクリプト保管先に保管してください。 例: C:/Users/zunda3team/AppData/Roaming/Aseprite/scripts/list.csv"}
   app.alert('Layer name list file is not found. Please save "list.csv" in script directory.  e.g. C:/Users/zunda3team/AppData/Roaming/Aseprite/scripts/list.csv')
   return 1
end

local ComboboxIndex = 0
----------------------------------------------------------------------------------------
--List file read division
----------------------------------------------------------------------------------------

-- list file reading loop
for line in f:lines() do
   -- Exctacting the data to combobox using regular expressions.
   name,r,g,b = string.match(line, "(.+)"..Filedelimiter.."(%d+)"..Filedelimiter.."(%d+)"..Filedelimiter.."(%d+)")

   -- Checking the list file is correct.
   -- For example, If RGB(R) value is "AEW" (number requied), then name returns nil.
   if name == nil then
    app.alert{title="LayerNameChange in Selection Script", text="Error in Line:".. ComboboxIndex+1 .. "check the line about format."}
    return 1
   end

   -- Checking the RGB value is between 0 and 255
   if (tonumber(r) < 0 or tonumber(r) > 255 or tonumber(g) < 0 or tonumber(g) > 255 or tonumber(b) < 0 or tonumber(b) > 255) then
    app.alert{title="LayerNameChange in Selection Script", text="RGB is not between 0 to 255 in Line:"..ComboboxIndex+1}
    return 1
   end

   name = name..Delimiter..ComboboxIndex
   table.insert(LayerNamesSelection, name)
   table.insert(LayerColorssSelection, Color(r,g,b))

   ComboboxIndex = ComboboxIndex + 1
end

-- Closing the list file. 
f:close()

----------------------------------------------------------------------------------------
--Dialog showing division
----------------------------------------------------------------------------------------

-- dlg:label { text="レイヤ名を選択してください。:" }
dlg:label { text="Select the new name for the layer:" }
dlg:combobox {
    id="new_layer_name",
    options=LayerNamesSelection,
    onchange=function()
        if app.layer == nil then
        -- app.alert{title="LayerNameChange in Selection Script", text="asepriteファイルを開き、変更対象のレイヤーをタイムライン上で選択してください。"}
        app.alert{title="LayerNameChange in Selection Script", text="Open the .aseprite file and active the layer to change in the timeline."}
        else
          local newLayerLine = dlg.data.new_layer_name
          --The first half is the layer name, and the right side after the delimiter is the subscript for obtaining color information.
          name,index = string.match(newLayerLine, "(.+)"..Delimiter.."(%d+)")

          --Changing layer name.
          app.layer.name = name
          --Changing layer color.
          app.layer.color = LayerColorssSelection[tonumber(index+1)]
        end
    end }
dlg:button { text="Cancel", onclick=function()
  dlg:close()
end }
dlg:show { wait=false }

return 0