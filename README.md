# FNAnimalLoginView
Swift登陆界面：猫头鹰蒙眼、企鹅闭眼、相片毛玻璃.

###基础使用Demo：

```
	let tabController:FNFoldingTabBarController = FNFoldingTabBarController.init()
	tabController.fn_viewControllers=[vc0, vc1, vc2, vc3]
	
	let naviController = UINavigationController.init(rootViewController: tabController)
	self.window!.rootViewController = naviController
	self.window!.makeKeyAndVisible()
```
具体见Demo工程。

###效果：
![Animating](readme_images/foldingTabBar.gif)