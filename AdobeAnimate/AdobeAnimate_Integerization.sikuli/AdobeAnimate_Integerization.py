import math

count = input(u"フレーム数は?")

for i in range(1, int(count)+1):
    # インスタンス名クリック
    click("1614139124140.png")
    wait(0.5)
    type(Key.TAB)
    type(Key.TAB)
    type(Key.TAB)
    type(Key.TAB)
    type(Key.TAB)
    type(Key.TAB)
    # X
    # コピー
    wait(0.5)
    type('c',Key.CTRL)
    wait(0.3)
    Xlocate = App.getClipboard()
    if float(Xlocate).is_integer():
        #小数点がつかないときはそのまま
        output = Xlocate
    else:
        # 小数点削除
        output = math.floor(float(Xlocate))
    wait(0.5)
    type(Key.DELETE)
    # 貼り付け
    type(str(int(output)))
    type(Key.TAB)
            
    # Y
    wait(0.5)
    type('c',Key.CTRL)
    wait(0.3)
    Ylocate = App.getClipboard()
    if float(Ylocate).is_integer():
        #小数点がつかないときはそのまま
        output = Ylocate
        print("integer")
    else:
        # 小数点削除
        output = math.floor(float(Ylocate))
        print(str(output))
    wait(0.5)
    type(Key.DELETE)
    # 貼り付け
    type(str(int(output)))
    type(Key.TAB)
    
    
    #type('c',Key.CTRL)
    #Xlocate = App.getClipboard()
    # 小数点削除
    #output = math.floor(float(Xlocate))
    # 貼り付け
    #paste(output)
    # コピー
    #type('c',Key.CTRL)
    # 小数点削除
    # 貼り付け
    click("1614139158530.png")
    wait(0.5)
    type('.')
    click("1614139158530.png")


