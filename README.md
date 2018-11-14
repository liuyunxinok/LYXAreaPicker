# LYXAreaPicker
在项目开发中，选择地区的场景很常见，为了方便使用，从项目中摘出了最近写的地址选择控件LYXAreaPicker, 此控件采用本地json解析的方式，省市县三级联动，仿京东的地址选择样式和逻辑。

![YXAlertController-alert.png](http://upload-images.jianshu.io/upload_images/2962939-82c32c80cdc50102.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![YXAlertController-actionSheet.png](http://upload-images.jianshu.io/upload_images/2962939-bd9f4f7cd5d2ff51.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
## 一、集成方式：
#### 1.可以下载下来把LYXAreaPicker文件夹拖进项目中
## 二、使用
### 1.导入头文件 #import "LYXAreaPickerView.h"
### 2.使用的代码参考如下：
    
    //创建
    LYXAreaPickerView *areaPickerView = [[LYXAreaPickerView alloc] initWithFrame:CGRectZero];
    //显示
    [areaPickerView showInView:self.view];
    //设置选择地址的回调
    areaPickerView.selectComplete = ^(NSString * _Nonnull area) {
        //显示选择的地址
        self.areaTextFiled.text = area;
    };


