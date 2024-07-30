LayerNameChange_inSelection スクリプト
(作者：zunda3)

■概要/特徴
  ドット絵ツール：Asepriteのレイヤーの名称/背景色を
  コンボボックスから選択することでワンタッチで変更できるスクリプトです。

  選択肢の内容は別添付のリストファイルを編集することで追加/変更できます。
  リストファイルはCSV(,区切り)とTSV(タブ区切り)に対応しています。
  （個人的にはExcelでリストが編集しやすいTSVがオススメです。）

  タイムライン上でクリックされているなど、アクティブ化されているレイヤーが
  変更の対象となります。


■使い方
　1.レイヤーの選択肢を定義するリストファイルを作成します。
　　[CSVの場合]
　　・list.csv
　　[TSVの場合]
　　・list.tsv
　　
　　Githubに例を保管しておりますが、右から順に以下の通りに記入してください。
　　(1)レイヤ名
　　(2)背景色：R
　　(3)背景色：G
　　(4)背景色：B
　　
　2.以下のファイルをAsepriteのスクリプト保管先(※)に保管します。
　　[CSVの場合]
　　・LayerNameChange_inSelection_CSV.lua
　　・list.csv
　　[TSVの場合]
　　・LayerNameChange_inSelection_TSV.lua
　　・list.tsv
　　※：スクリプト保管先はAsepriteのファイル→スクリプト→スクリプトフォルダを開く
　　　　を選択するとエクスプローラで開くことができます。
　　　　例：C:\Users\zunda3team\AppData\Roaming\Aseprite\scripts
　
　3.Asepriteにて、asepriteファイルを開いた状態で
　　ファイル→スクリプト→LayerNameChange_inSelection_CSVまたはLayerNameChange_inSelection_TSV
　　をクリックします。
　　
　4.ポップアップウィンドウが表示されるので、名前/背景色を変更したいレイヤーをタイムライン上で
　　クリックしてアクティブ化し、コンボボックスの選択肢を変更してください。
　　選択肢を変更すると、タイムライン上のレイヤーの表示に反映されます。

■注意事項
　・動作確認はWindowsで行っております。LinuxやOSXは未確認ですのでご了承ください。
　　(正常に動作することを確認できておりません。)
　・リストファイルの文字コードは必ず「UTF-8」を指定してください。
　　SJISなどを指定した場合はAseprite上で表示するときに文字化けする可能性があります。
　・選択肢の右端に数字が表示されますが仕様です。　レイヤー名には反映されませんので、
　　ご安心ください。（背景色を設定する際の処理でどうしても必要でした・・・）
　
何か質問ご要望などございましたら、AsepriteコミュニティまたはXのfunde_rectangleまでお寄せください。

■連絡先など
　X：https://x.com/funde_rectangle
　Github：https://github.com/zunda3/AsepriteScript/tree/master/LuaScript
　tumblr:https://zunda3rectangle.tumblr.com/
　Youtube：https://www.youtube.com/channel/UCCJtbs6DLvVZKiJ5dxWlAfA
　　　　　(Asepriteの解説動画をアップしております。)
　　　　　
　Aseprite:https://www.aseprite.org/