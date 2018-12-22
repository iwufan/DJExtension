# DJExtension
Extensions, global functions for swift. Create a component with one line of codes.

10 times to improve your code efficiency.
### Main Features!
- Create a component with one line of codes, like a label, button, textField...
- Use global functions instead of some Apple APIs.
- Make many extensions and convenience init methods for UILabel/UIButton/UIView/UIViewController/UIImage...
### How To Install?
##### Manual
Just drag the `DJExtension` folder to your project. 

This is what all you should do, then you can use the extension functions. All the functions or constants are start with `dj`.
##### Cocoapods
`pod 'DJExtension'`

You should also import this framework before you use it, like this `import DJExtension`.
### The reason to use DJExtension
With DJExtension, you won't need to write duplicate and redundant codes in your projects. Here are some examples.
#### Example 01 - create labels
- before
```
let label = UILabel()
label.text          = "Label"
label.font          = UIFont.systemFont(ofSize: 11)
label.textColor     = UIColor(red: 123.0/255, green: 123.0/255, blue: 123.0/255, alpha: 1)
label.textAlignment = .left
label.numberOfLines = 1
    
view.addSubview(label)
    
label.snp.makeConstraints { (make) in
    make.center.equalTo(view.snp.center)
    make.width.height.equalTo(100)
}
```
- now
```
UILabel(text: "Label", font: dj_systemfont(11), color: dj_rgbGrayColor(123), alignment: .left, lineCount: 1, superView: view) { (make) in
    make.center.equalTo(view.snp.center)
    make.width.height.equalTo(100)
}
```
The parameter `alignment` and `lineCount` have default values, so you can also write like this.
```
UILabel(text: "Label", font: dj_systemfont(11), color: dj_rgbGrayColor(123), superView: view) { (make) in
    make.center.equalTo(view.snp.center)
    make.width.height.equalTo(100)
}
```
#### Example 02 - create buttons
- before
```
let button = UIButton()
button.setTitle("On", for: .normal)
button.setTitle("Off", for: .selected)
button.titleLabel?.font = UIFont(name: "PingFangSC-Regular", size: 11)
button.setTitleColor(UIColor.green, for: .normal)
button.setTitleColor(UIColor.red, for: .selected)
button.backgroundColor = UIColor.white
    
button.addTarget(self, action: #selector(clickSwitch(button:)), for: .touchUpInside)
        
view.addSubview(button)
        
button.snp.makeConstraints { (make) in
    make.center.equalTo(view.snp.center)
    make.width.height.equalTo(100)
}
```
- now
```
UIButton(title: "On", selTitle: "Off", titleFont: dj_pingRegularFont(11), titleColor: djGreen, selTitleColor: djRed, bgColor: djWhite, target: self, action: #selector(clickSwitch(button:)), superView: view) { (make) in
    make.center.equalTo(view.snp.center)
    make.width.height.equalTo(100)
}
```
#### Example 03 - create text fileds
- before
```
let textField = UITextField()
textField.placeholder        = "Please input your name"
textField.textColor          = UIColor.blue
textField.font               = UIFont.systemFont(ofSize: 11)
textField.textAlignment      = .left
textField.keyboardType       = .default
textField.clearButtonMode    = .always
        
view.addSubview(textField)
        
textField.snp.makeConstraints { (make) in
    make.center.equalTo(view.snp.center)
    make.width.equalTo(200)
    make.height.equalTo(50)
}
```
- now
```
UITextField(placeholder: "Please input your name", placeholderColor: djLightGray, placeholderFont: dj_systemfont(11), textColor: djBlue, superView: view) { (make) in
    make.center.equalTo(view.snp.center)
    make.width.equalTo(200)
    make.height.equalTo(50)
}
```
###### Note
You can set the placeholder color and placeholder font for your text filed with DJExtension.
#### Example 04 - push a new view controller
- before
```
navigationController?.pushViewController(TestViewController(), animated: true)
```
- now
```
dj_push(TestViewController())
```
#### Example 05 - show an action sheet
- before
```
let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
let action1 = UIAlertAction(title: "Take a photo", style: .default) { (action) in
    print("Take a photo")
}
let action2 = UIAlertAction(title: "Open photo library", style: .default) { (action) in
    print("Open photo library")
}
let action3 = UIAlertAction(title: "Cancel", style: .cancel)
        
alertController.addAction(action1)
alertController.addAction(action2)
alertController.addAction(action3)
        
present(alertController, animated: true, completion: nil)
```
- now
```
dj_showActionSheet(firstTitle: "Take a photo", firstAction: { (_) in
    print("Take a photo")
}, secondTitle: "Open photo library") { (_) in
    print("Open photo library")
}
```
###### Note：
You can also set color for the action titles with DJExtension.
### More functions you may use
| Functions | Comment |
| ------ | ------ |
|`dj_hexColor("00ff00")`|get a color with a hex value.
|`dj_pingSemiboldFont(15)`|get a font from the font family "PingFangSC-Semibold".
|`dj_isCameraAllowed()`|the camera authorization is allowed or not.
|`dj_navigationBarHeight()`|get the navigation bar height(adapted iPhone X or later).
|`dj_isEmpty(obj)`|an object is empty or not.
|`dj_isIPhoneX()`|the phone is iPhone X,Xs,Xs Max or not.
|`dj_toJson(obj)`|convert an object to json string.
|`dj_callPhone("13288889990")`|call a number
|`dj_saveFile(url, fileName)`|save a file to sandbox.
|`dj_deleteFile(fileName)`|delete the file from sandox.
|`dj_postNotification("LoginSuccessNotification")`|post a notification.
|more...|
###### Note:
You can find more global functions in file `DJGlobalFunctions.swift`.
### License
MIT
### Contact Me
[悟饭哪](https://www.jianshu.com/u/819830158b47)

###### Thanks

