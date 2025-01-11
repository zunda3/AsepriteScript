# Aseprite：プリセットレイヤー名/背景色 変更スクリプト

[English README is here](https://github.com/zunda3/AsepriteScript/blob/master/LuaScript/LayerNameChange_inSelection/readme.md)


## 概要/特徴
  ドット絵ツール：Asepriteにおいて、レイヤーの名称/背景色を  
  あらかじめ設定した後、コンボボックスから簡単に変更できるスクリプトです。  
    
  **レイヤ名や背景色を変更するときにプロパティを開く必要がなくなり、作業効率が向上します。**  
日本語の場合はコピペ入力も必要なくなるので、その分効果が発揮できるはずです。  
  
  選択肢の内容は別添付のリストファイルを編集することで追加/変更できます。  
  リストファイルはCSV(,区切り)とTSV(タブ区切り)に対応しています。  
  **個人的にはExcelでリストが編集しやすいTSVがオススメです。）**  

  タイムライン上でクリックされているなど、アクティブ化されているレイヤーが  
  変更の対象となります。  
  
https://github.com/user-attachments/assets/26cbdcd4-10b9-4070-9ff2-9234b451da8b

▲スクリプト実行時の一連の動作はこちら  
  


  
  

![image](https://github.com/user-attachments/assets/552333df-5abb-408a-a9d6-173b538247a6)  
▲各ファイルはGithubのダウンロードボタンを押すことでダウンロードできます。
  


## 使い方  
### 1.レイヤーの選択肢を定義するリストファイルを作成します。  
- CSVの場合=
  - [list.csv](./list.csv)   
- TSVの場合
  - [list.tsv](./list.tsv)   

- 上記のファイル名でリポジトリ内に例を保管しておりますが、右から順に以下の通りに記入してください。    
    (1) レイヤ名    
    (2) 背景色：R(0～255)    
    (3) 背景色：G(0～255)    
    (4) 背景色：B(0～255)    
　　![image](https://github.com/user-attachments/assets/dd53aabd-ed8d-4ec7-b78e-f55e85607955)  
　　▲記入例

### 2.以下のファイルをAsepriteのスクリプト保管先(※)に保管します。    
- CSVの場合    
  - [LayerNameChange_inSelection_CSV.lua](./LayerNameChange_inSelection_CSV.lua)  
  - [list.csv](./list.csv)  
- TSVの場合    
  - [LayerNameChange_inSelection_TSV.lua](./LayerNameChange_inSelection_TSV.lua)  
  - [list.tsv](./list.tsv)  
  ※：スクリプト保管先はAsepriteのファイル→スクリプト→スクリプトフォルダを開くを選択するとエクスプローラで開くことができます。  
    例：C:\Users\zunda3team\AppData\Roaming\Aseprite\scripts  
　  
### 3.スクリプトを実行します。
- Asepriteにて、.asepriteファイルを開いた状態で以下の通りクリックします。
  >ファイル→スクリプト→ LayerNameChange_inSelection_CSV または LayerNameChange_inSelection_TSV
　　  
### 4.レイヤー名/背景色を変更します。  
- ポップアップウィンドウが表示されるので、名前/背景色を変更したいレイヤーをタイムライン上でクリックしてアクティブ化し、コンボボックスの選択肢を変更してください。選択肢を変更すると、タイムライン上のレイヤーの表示に反映されます。  
  
## 注意事項  
- 動作確認はWindowsで行っております。LinuxやOSXは未確認ですのでご了承ください。  (正常に動作することを確認できておりません。)  
- リストファイルの文字コードは必ず「UTF-8」を指定してください。SJISなどを指定した場合はAseprite上で表示するときに文字化けする可能性があります。  
- 選択肢の右端に数字が表示されますが仕様です。レイヤー名には反映されませんので、ご安心ください。 [^1]    
- 何か質問ご要望などございましたら、AsepriteコミュニティまたはXのfunde_rectangleまでお寄せください。  
  
## 連絡先など  
　X：https://x.com/funde_rectangle  
　Github：https://github.com/zunda3/AsepriteScript/tree/master/LuaScript  
　tumblr:https://zunda3rectangle.tumblr.com/  
　Youtube：https://www.youtube.com/channel/UCCJtbs6DLvVZKiJ5dxWlAfA  
　　　　　(Asepriteの解説動画をアップしております。)  
　　　　　  
　Aseprite:https://www.aseprite.org/


 [^1]: （背景色を設定する際の処理でどうしても必要でした・・・　もっといい方法があれば教えてください。）
