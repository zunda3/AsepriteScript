#テキストの出力先
listoutputDestination="C:\sikuliX\AsepriteScript\Layerlist\list.txt"
#EDGE2の
EDGE2Destination="C:\PG_Install\EDGE2\Edge2.exe"

count = input(u"レイヤ数は?")
layerlist = ""

#レイヤウィンドウが見えてるときはパターンマッチングでクリック、
#見えてなければフォーカスをEDGE2に当てたのちにクリック。
#画像はレイヤウィンドウの左上部分です（ご自身の環境に合わせて画像をセットしてください。）
if exists("1590228796466.png"):
    click("1590228796466.png")
else:
    App.open(EDGE2Destination) 
    type('v',Key.ALT)
    type('l')
    if exists("1590228796466.png"):
        click("1590228796466.png")
    else:
        type('v',Key.ALT)
        type('l')
        wait(1)
        click("1590228796466.png")
wait(1)
type(Key.ALT)
type('l')
type('e')
type('t')

for i in range(1, int(count)+1):
    type(Key.SPACE)
    type('c',Key.CTRL)
    type(Key.ENTER)
    result = App.getClipboard()
    layerlist = (layerlist + result + "\n")
    type(Key.DOWN)

popup(listoutputDestination)

outputfile = open(listoutputDestination, 'w')
outputfile.writelines(layerlist.encode('utf-8'))
outputfile.close()