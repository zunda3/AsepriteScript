# Aseprite: LayerName/ColorChange_inSelection

[日本語版のReadmeはこちら](https://github.com/zunda3/AsepriteScript/blob/master/LuaScript/LayerNameChange_inSelection/readme-ja.md)

## Overview/Feauture
  Pixel art tool: In Aseprite, change the layer name/background color
  This is a script that can be set in advance and then easily changed from the combo box.
    
  **This script can makes not need to open the properties when changing the layer name or background color, thus improving work efficiency.**  
  
  You can modify/add preset LayerNames/Colors by editing the list file.  
  The delimiter of list file is CSV or TSV.  
  **I recommend TSV. because of it can editing with Excel.**  

  This script can change the active layer's name/background color.   
  (e.g.Clicked in timeline.)   

DEMO:   


https://github.com/user-attachments/assets/0db14f56-d7ed-4aa1-a239-6883b23b332e
  
  
Each file can be downloaded by clicking the download button on Github.  


![image](https://github.com/user-attachments/assets/6394a472-3498-489e-a499-204aba47974e)

  
## Usage
### 1.Make the list file that contains selection of layer.
- In case of CSV
  - [list.csv](./list.csv)   
- In case of TSV
  - [list.tsv](./list.tsv)   

-  Write the layer names/background colors in the list file with following format.  the example files is in the repositories as noted above file name.  
    Example((1) is most left side.):   
    (1) Layer name    
    (2) Background color：R(0～255)    
    (3) Background color：G(0～255)    
    (4) Background color：B(0～255)    
    Example:   
　　![image](https://github.com/user-attachments/assets/dd53aabd-ed8d-4ec7-b78e-f55e85607955)  

### 2.Save the following files into Aseprite scripts folder.(*)    
- In case of CSV
  - [LayerNameChange_inSelection_CSV.lua](./LayerNameChange_inSelection_CSV.lua)  
  - [list.csv](./list.csv)  
- In case of TSV
  - [LayerNameChange_inSelection_TSV.lua](./LayerNameChange_inSelection_TSV.lua)  
  - [list.tsv](./list.tsv)  
  (*):Aseprite scripts folder can open with Explorer (File->Scripts->Open Script Folder).
  Example:C:/Users/zunda3team/AppData/Roaming/Aseprite/scripts  
　  
### 3.Run script
- Open the .aseprite file and run script with following procedure.
  >File->Scripts-> LayerNameChange_inSelection_CSV or LayerNameChange_inSelection_TSV
　　  
### 4.Change the layer name/background color  
- Popup is shown,then select the layer name/background color. When change the combobox of selected value,The active layer's name and background color will change.  
  
## Notice  
- This script check is only on windows.(Didn't check with OSX and Linux.)  
- List file's encode must be "UTF-8". For example.SJIS is garble the characters.
- A number will be displayed on the right side of the options, but this is by design. Don't worry, it will not be reflected in the layer name. [^1]    
- If you have any questions or requests, please send them to the Aseprite community or to funde_rectangle on X.  
  
## Contact  
　X：https://x.com/funde_rectangle  
　Github：https://github.com/zunda3/AsepriteScript/tree/master/LuaScript  
　tumblr:https://zunda3rectangle.tumblr.com/  
　Youtube：https://www.youtube.com/channel/UCCJtbs6DLvVZKiJ5dxWlAfA  
　　　　　  
　Aseprite:https://www.aseprite.org/


 [^1]: This method is only effective with changing background color. I can't best way anymore...please give me advice or method...
