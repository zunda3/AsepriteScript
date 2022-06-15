#encoding: UTF-8

import datetime
import csv

# webdriver の情報
from selenium import webdriver
# html の タブの情報を取得
from selenium.webdriver.common.by import By
# # 次にクリックしたページがどんな状態になっているかチェックする
# from selenium.webdriver.support import expected_conditions as EC
# # 待機時間を設定
# from selenium.webdriver.support.ui import WebDriverWait

#例外
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import TimeoutException

# ■定数定義

#Chromeのユーザープロファイルのパス
PROFILE_PATH = "/home/pi/.config/chromium/"
#人数差分ファイル出力先
OUTPUT_DATA_FILE = "/home/pi/selenium/output/datafile.csv"
#前回分比較用ファイル出力先
OUTPUT_COMPARE_FILE= "/home/pi/selenium/output/datafile_before.csv"
#DJNAME情報ファイル出力先
OUTPUT_VISITORS_FILE = "/home/pi/selenium/output/visitorcount.csv"
#beatmania IIDX公式サイトの最後にプレーしたテンポが同じ人検索画面
IIDX_ADDRESS = "https://p.eagate.573.jp/game/2dx/29/rival/rival_search.html?mode=5#rivalsearch"
#Chromeの実行パス
CHROME_EXE_PATH = "/usr/lib/chromium-browser/chromedriver"
#実行毎の最大取得件数
MAX_GETROWS = 10

#――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# 注意！：このプログラムを実行する前に必ずe-amusementサイトにログインしておくこと。
#――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

def executeDivision():
    options = webdriver.ChromeOptions()
    options.add_argument('--user-data-dir=' + PROFILE_PATH)
    
    # ユーザープロファイルを使ってChrome or Chromiumブラウザを起動
    driver = webdriver.Chrome(executable_path=CHROME_EXE_PATH,options=options)
        
    try:
    
        driver.get(IIDX_ADDRESS)
    
        # # テーブル内容取得
        tableElem = driver.find_element_by_id("result")
        trs = tableElem.find_elements(By.TAG_NAME, "tr")
    
    except:
        print("Caused error in CheckHTML Division")
        driver.close()
    
    # 配列の用意
    record = []
    line = []
    comparerecord = []
    linecount = 0

    # ヘッダ行(1行目)は除いて1行ずつ取得するループ
    for i in range(1,MAX_GETROWS):

        #各行のセルの要素を取得
        tds = trs[i].find_elements(By.TAG_NAME, "td")
        line = []
        lineA = []

        # DJNAMEとIIDX-IDだけを取得
        # line = "%s," % (tds[0].text) + "%s," % (tds[1].text) + "%s," % (datetime.datetime.today().strftime('%Y-%m-%d %H:%M'))
        line.append(tds[0].text)
        line.append(tds[1].text)
        line.append(datetime.datetime.today().strftime('%Y-%m-%d %H:%M'))
        line.append(str(i))
        record.append(line)

        #比較用
        lineA.append(tds[0].text)
        lineA.append(tds[1].text)
        comparerecord.append(lineA)
        
        linecount = linecount + 1

    #まとめファイルに保管
    try:
        with open(OUTPUT_DATA_FILE, 'a', newline='\n') as f:
            writer = csv.writer(f)
            for i in record:
                writer.writerow(i)
    except OSError as e:
        print(f'ファイル処理でエラー発生:{e.args}')

    # 前回分と比較して何人来たかを確認して記録
    analyzeDivision(comparerecord)

    #比較用ファイルに保管
    try:
        with open(OUTPUT_COMPARE_FILE, 'w') as f:
            writer = csv.writer(f)
            for i in comparerecord:
                writer.writerow(i)
    except OSError as e:
        print("Caused error in Filedivision")
        driver.close()
    
    driver.close()
    
#前回取得したファイルとの差分を取得し、ユーザーが何行分動いたかを抽出する
#→これが現在プレーしている人数の目安
def analyzeDivision(comparerecord):
    #前回ファイルの読み込み
    csv_file = open(OUTPUT_COMPARE_FILE, "r", encoding="ms932", errors="", newline="" )
    #リスト形式
    before = csv.reader(csv_file, delimiter=",", doublequote=True, lineterminator="\r\n", quotechar='"', skipinitialspace=True)

    str1 = []
    str2 = []

    for b in before:
        str1.append(b[0]+b[1])

    for a in comparerecord:
        str2.append(a[0]+a[1])

    # テキストの最後から最初まで
    countDiff = 0
    countExists = 0
    counti = len(comparerecord)-1
    loopend = 0
    countdelay = 0

    # print(str(counti)+'------------------------------------')

    for i in reversed(str1):
        # 差異があったらリスト内にuserがいるか確認する。
        if i != str2[counti + countdelay]:
            print(list(range(counti + countdelay, -1, -1)))
            for search in list(range(counti + countdelay, -1, -1)):
                print('checking:' + i + 'VS' + str2[search] + ':' +str(search))
                if i == str2[search]:
                    #見つかったら順番が入れ替わっている証拠なのでカウント＋１してつぎへ
                    # print('HIT!!!!')
                    countExists = countExists + 1
                    countdelay = countdelay + 1
                    break

        counti = counti - 1
        print(str(counti)+':'+str(countdelay)+'------------------------------------')

    print('countExists:'+ str(countExists))

    # 客人の数ファイル
    try:
        with open(OUTPUT_VISITORS_FILE, 'a', newline='\n') as f:
            writer = csv.writer(f)
            writelineup = []
            writelineup.append(countExists)
            writelineup.append(datetime.datetime.today().strftime('%Y-%m-%d %H:%M'))
            writer.writerow(writelineup)
    except OSError as e:
        print(f'ファイル処理でエラー発生:{e.args}')

#1番初めに実行する処理
def main():
    executeDivision()
    print("OK")

#↓これは絶対要る
main()

