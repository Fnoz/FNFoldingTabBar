//
//  FNFoldingTabBarController.swift
//  FNFoldingTabBar
//
//  Created by Fnoz on 16/6/16.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNFoldingTabBarController: UITabBarController, FNFoldingTabBarDelegate {
    var foldingTabBar:FNFoldingTabBar!
    var tabBarBgColor:UIColor! {
        didSet {
            foldingTabBar.fn_backgroundColor = tabBarBgColor
        }
    }
    var tabBarTintColor:UIColor! {
        didSet {
            foldingTabBar.fn_tintColor = tabBarTintColor
        }
    }

    var centerImage:UIImage! {
        get {
            return _centerImage
        }
        set {
            _centerImage = newValue
            foldingTabBar.addButton.setImage(newValue, forState: .Normal)
        }
    }
    var fn_viewControllers:[UIViewController]! {
        get {
            return viewControllers
        }
        set {
            viewControllers = newValue
            foldingTabBar.fn_viewControllers = newValue
        }
    }
    
    private var _centerImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.hidden = true
        
        foldingTabBar = FNFoldingTabBar.init(frame: CGRectMake(0, view.frame.size.height - 80, view.frame.size.width, 80))
        if tabBarBgColor != nil {
            foldingTabBar.fn_backgroundColor = tabBarBgColor
        }
        if tabBarTintColor != nil {
            foldingTabBar.fn_tintColor = tabBarTintColor
        }
        foldingTabBar.delegate = self
        view.addSubview(foldingTabBar)
    }
    
    func tabTappedAtIndex(index: NSInteger) {
        selectedIndex = index
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}