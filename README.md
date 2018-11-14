# LYXAreaPicker
在项目开发中，选择地区的场景很常见，为了方便使用，从项目中摘出了最近写的地址选择控件LYXAreaPicker, 此控件采用本地json解析的方式，省市县三级联动，仿京东的地址选择样式和逻辑。

![LYXAreaPicker01.png](https://upload-images.jianshu.io/upload_images/2962939-373c06e4a60808ba.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/620)


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

## 注意事项：
#### 1、控件采用Masonry布局，引入的项目中需要集成Masonry框架。
#### 2、选中的对勾图片可自定义设定，在LYXAreaListTableViewCell.m中进行修改即可。

