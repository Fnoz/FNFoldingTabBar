//
//  FNFoldingTabBarController.swift
//  FNFoldingTabBar
//
//  Created by Fnoz on 16/6/16.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNFoldingTabBarController: UITabBarController {
    var centerImage:UIImage! {
        get {
            return _centerImage
        }
        set {
            _centerImage = newValue
            foldingTabBar.addButton.setImage(newValue, forState: .Normal)
        }
    }
    
    private var _centerImage:UIImage!
    
    var fn_viewControllers:[UIViewController]! {
        get {
            return viewControllers
        }
        set {
            viewControllers = newValue
            foldingTabBar.fn_viewControllers = newValue
        }
    }
    
    private var foldingTabBar:FNFoldingTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.hidden = true
        
        foldingTabBar = FNFoldingTabBar.init(frame: CGRectMake(0, view.frame.size.width - 80, view.frame.size.width, 80))
        view.addSubview(foldingTabBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}