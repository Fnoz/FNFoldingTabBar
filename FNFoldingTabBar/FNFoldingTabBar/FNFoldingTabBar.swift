//
//  FNFoldingTabBar.swift
//  FNFoldingTabBar
//
//  Created by Fnoz on 16/6/16.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

public class FNFoldingTabBar: UIView{
    var bigBgView:UIView!
    var smallBgView:UIView!
    var addButton:UIButton!
    var isExpend:Bool!
    
    var fn_viewControllers:[UIViewController]! {
        get {
            return _fn_viewControllers
        }
        set {
            _fn_viewControllers = newValue
            for i in 0 ... _fn_viewControllers.count-1 {
                let button = UIButton.init()
                button.tag = 100 + i
                button.frame = CGRectMake(0, 0, 60, 60)
                button.center = addButton.center
                button.backgroundColor = UIColor.init(red: 63/255.0, green: 212/255.0, blue: 178/255.0, alpha: 1)
                button.layer.cornerRadius = 30
                addSubview(button)
                let vc = _fn_viewControllers[i] as UIViewController
                if vc.tabBarItem.image != nil {
                    button.setImage(vc.tabBarItem.image, forState: .Normal)
                }
                else {
                    button.setImage(UIImage.init(named: NSString.init(format: "icon%d", i) as String), forState: .Normal)
                }
                bringSubviewToFront(addButton)
            }
        }
    }
    
    func addButtonClicked() {
        isExpend = !isExpend
        changeState(isExpend)
    }
    
    func changeState(expending:Bool) {
        UIView.animateWithDuration(0.5) {
            if expending {
                self.addButton.transform = CGAffineTransformMakeRotation(0.75 * CGFloat(M_PI))
                self.smallBgView.frame = CGRectMake(40, 10, self.frame.size.width - 80, 60)
            }
            else {
                self.addButton.transform = CGAffineTransformMakeRotation(0)
                self.smallBgView.frame = CGRectMake(self.frame.size.width / 2, 10, 0, 60)
            }
        }
        for i in 0 ... 3 {
            let button = self.viewWithTag(i + 100)
            if expending {
                UIView.animateWithDuration(0.5, animations: {
                    if i < 2 {
                        button?.center = CGPointMake(40 + (self.frame.size.width / 2 - 40)/2 * CGFloat(i), 40)
                    }
                    else {
                        button?.center = CGPointMake(self.frame.size.width * 3 / 4 - 20 + (self.frame.size.width / 2 - 40)/2 * CGFloat(i-2), 40)
                    }
                })
                
                UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .CurveEaseOut, animations: {
                    button?.transform = CGAffineTransformMakeRotation(0.5 * CGFloat(M_PI))
                    }, completion: nil)
                
                UIView.animateWithDuration(0.5, delay: 0.25, usingSpringWithDamping: 0.1, initialSpringVelocity: 4.0, options: .CurveEaseOut, animations: {
                    button?.transform = CGAffineTransformMakeRotation(0 * CGFloat(M_PI))
                    }, completion: nil)
            }
            else {
                UIView.animateWithDuration(0.5, animations: {
                    button?.center = self.addButton.center
                })
            }
        }
    }
    
    private var _fn_viewControllers:[UIViewController]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isExpend = false
        initView(frame)
    }
    
    func initView(frame: CGRect) {
        bigBgView = UIView.init(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        bigBgView.backgroundColor = UIColor.init(red: 94/255.0, green: 89/255.0, blue: 151/255.0, alpha: 1)
        addSubview(bigBgView)
        
        smallBgView = UIView.init(frame:  CGRectMake(self.frame.size.width / 2, 10, 0, 60))
        smallBgView.backgroundColor = UIColor.init(red: 63/255.0, green: 212/255.0, blue: 178/255.0, alpha: 1)
        addSubview(smallBgView)
        
        addButton = UIButton.init(frame: CGRectMake(0, 0, 60, 60))
        addButton.center = CGPointMake(frame.size.width / 2, 40)
        addButton.backgroundColor = UIColor.init(red: 63/255.0, green: 212/255.0, blue: 178/255.0, alpha: 1)
        addButton.layer.cornerRadius = 30
        addButton.addTarget(self, action: #selector(addButtonClicked), forControlEvents: .TouchUpInside)
        addButton.setImage(UIImage.init(named: "icon_add"), forState: .Normal)
        addSubview(addButton)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
