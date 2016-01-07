#android study note  

搭建环境
==
1.eclipse + adt + sdk   
		可以下载android-bundle包含整个开发 （包含所有开发工具)  
2. 配置android环境变量    
3. 打开sdk manager 下载不同的安卓版本     
3.1配置options中的代理服务地址：  
>  原因：google 官网被墙  
>  配置地址：androiddev中查询  
![options](http://i.imgur.com/Y6JkULY.png)    

新建项目  
==
1. 新建一个adv（安卓模拟器），开启模拟器  
2. 新建一个android application project 项目  
3. 项目目录含义  
>  src 项目源代码位置  
>  gen app-bundle自动生成的文件包  
>  R.java --资源管理者（监控资源）  
>  工具自动生成的代码  
			
---
######android_001项目  
1.类中引用资源文件中的内容  
`textView.setText(R.string.msg);`  
2.资源文件引用资源文件中的内容       
`android:text="@string/msg" />`	           		
> @就相当于类中的R，只有@+id特别，表示给资源文件加一个id值  

3.项目加载过程   
> Manifest.xml是核心配置文件    
  
![android调用过程](https://github.com/tonghuajianghan/android/blob/master/img/android_guocheng1.jpg)

