# FNFoldingTabBar
Swift实现的Yalantis的FoldingTabBar.iOS.

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
![Animating](readme_images/FNFoldingTabBar.gif)

###来源：
OC原版是 [Yalantis](https://github.com/Yalantis) 的 [FoldingTabBar.iOS](https://github.com/Yalantis/FoldingTabBar.iOS)