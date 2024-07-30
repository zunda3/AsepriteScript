--定数定義
local dlg = Dialog("Rename Layer")

--選択肢：レイヤー名の定義
local layerNamesSelection = {}

--選択肢：レイヤー名に対応した背景色の定義
local layerColorssSelection = {}

--コンボボックスでレイヤ名と色を分けるためのもの
local delimiter = "__________"
--リストファイル(list.csv)の区切り文字
local filedelimiter = ","

-- レイヤ名が記載されたファイルを読み込みモード('r')で開く
-- CSVファイルの中身は各行→の通りに記載すること。「レイヤ名,R,G,B」
-- 例：髪,209,134,223

--スクリプトフォルダ内にあるlist.csvを取得する。
--例：C:/Users/zunda3team/AppData/Roaming/Aseprite/scripts/list.csv
local f = io.open(app.fs.userConfigPath..'scripts/list.csv', 'r')

--ファイルが見つからない場合はエラーで閉じる。
if f == nil then
   app.alert('Layer name list file is not found. Please save "list.csv" in script directory.  Example: C:/Users/zunda3team/AppData/Roaming/Aseprite/scripts/list.csv')
   return nil
end

local ComboboxIndex = 0

-- 開いたファイルの先頭から一行ずつ読み込むループ
for line in f:lines() do
   name,r,g,b = string.match(line, "(.+)"..filedelimiter.."(%d+)"..filedelimiter.."(%d+)"..filedelimiter.."(%d+)")
   --コンボボックスの選択肢を生成する。
   --ComboboxIndexは色情報を取得するための添え字として使う。
   name = name..delimiter..ComboboxIndex
   table.insert(layerNamesSelection, name)
   table.insert(layerColorssSelection, Color(r,g,b))

   ComboboxIndex = ComboboxIndex + 1
end

-- ファイルを閉じる
f:close()

-- ダイアログ生成処理
dlg:label { text="Select layer name for the active layer." }
dlg:combobox {
    id="new_layer_name",
    options=layerNamesSelection,
    onchange=function()
        local newLayerLine = dlg.data.new_layer_name
        --前半がレイヤ名、デリミタ(例：":::::")を挟んで右側が色情報取得用の添え字。
        name,index = string.match(newLayerLine, "(.+)"..delimiter.."(%d+)")

        --アクティブレイヤーにレイヤ名を設定する。
        app.activeLayer.name = name
        --アクティブレイヤーにレイヤ色を設定する。
        app.activeLayer.color = layerColorssSelection[tonumber(index)]
    end }
dlg:button { text="Cancel", onclick=function()
  dlg:close()
end }
dlg:show { wait=false }