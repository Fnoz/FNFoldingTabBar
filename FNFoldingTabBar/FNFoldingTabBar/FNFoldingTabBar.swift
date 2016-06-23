//
//  FNFoldingTabBar.swift
//  FNFoldingTabBar
//
//  Created by Fnoz on 16/6/16.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

protocol FNFoldingTabBarDelegate {
    func tabTappedAtIndex(index: NSInteger)
}

public class FNFoldingTabBar: UIView{
    private var bigBgView:UIView!
    private var smallBgView:UIView!
    private var tabIndicator:UIView!
    var addButton:UIButton!
    var isExpend:Bool!
    var delegate:FNFoldingTabBarDelegate?
    var currentIndex = 0
    
    var _fn_backgroundColor:UIColor?
    
    var fn_backgroundColor:UIColor! {
        get {
            return _fn_backgroundColor
        }
        set {
            _fn_backgroundColor = newValue
            bigBgView.backgroundColor = newValue
        }
    }
    
    var _fn_tintColor:UIColor?
    
    var fn_tintColor:UIColor! {
        get {
            return _fn_tintColor
        }
        set {
            _fn_tintColor = newValue
            smallBgView.backgroundColor = newValue
            addButton.backgroundColor = newValue
            for i in 0 ... 3 {
                let button = self.viewWithTag(i + 100)
                button?.backgroundColor = newValue
            }
        }
    }
    
    var fn_viewControllers:[UIViewController]! {
        get {
            return _fn_viewControllers
        }
        set {
            _fn_viewControllers = newValue
            for i in 0 ... 3 {
                if i >= _fn_viewControllers.count {
                    let button = UIButton.init()
                    button.tag = 100 + i
                    button.frame = CGRectMake(0, 0, 60, 60)
                    button.center = addButton.center
                    button.backgroundColor = UIColor.init(red: 63/255.0, green: 212/255.0, blue: 178/255.0, alpha: 1)
                    button.layer.cornerRadius = 30
                    addSubview(button)
                    continue
                }
                let button = UIButton.init()
                button.tag = 100 + i
                button.frame = CGRectMake(0, 0, 60, 60)
                button.center = addButton.center
                button.backgroundColor = UIColor.init(red: 63/255.0, green: 212/255.0, blue: 178/255.0, alpha: 1)
                button.layer.cornerRadius = 30
                button.adjustsImageWhenHighlighted = false
                addSubview(button)
                let vc = _fn_viewControllers[i] as UIViewController
                if vc.tabBarItem.image != nil {
                    button.setImage(vc.tabBarItem.image, forState: .Normal)
                }
                else {
                    button.setImage(UIImage.init(named: NSString.init(format: "icon%d", i) as String), forState: .Normal)
                }
                button.addTarget(self, action: #selector(tabClicked(_:)), forControlEvents: .TouchUpInside)
            }
            
            bringSubviewToFront(addButton)
        }
    }
    
    func addButtonClicked() {
        tabIndicator?.removeFromSuperview()
        isExpend = !isExpend
        changeState(isExpend)
    }
    
    func tabClicked(button:UIButton) {
        tabIndicator.removeFromSuperview()
        isExpend = false
        currentIndex = button.tag - 100
        delegate?.tabTappedAtIndex(button.tag - 100)
        changeState(false)
    }
    
    func changeState(expending:Bool) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1.0, options: .CurveEaseOut, animations: {
            if expending {
                self.addButton.transform = CGAffineTransformMakeRotation(0.75 * CGFloat(M_PI))
            }
            else {
                self.addButton.transform = CGAffineTransformMakeRotation(0)
            }
            }, completion: nil)
        UIView.animateWithDuration(0.5) {
            if expending {
                self.smallBgView.frame = CGRectMake(40, 10, self.frame.size.width - 80, 60)
            }
            else {
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
        if expending {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                let btn = self.viewWithTag(self.currentIndex + 100)
                self.tabIndicator = UIView.init(frame: CGRectMake((btn?.center.x)! - 2, 57, 4, 4))
                self.tabIndicator.layer.cornerRadius = 2
                self.tabIndicator.backgroundColor = UIColor.init(red: 42/255.0, green: 49/255.0, blue: 67/255.0, alpha: 1)
                self.addSubview(self.tabIndicator)
                self.tabIndicator.transform = CGAffineTransformMakeScale(0.1, 0.1)
                
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .CurveEaseOut, animations: {
                    self.tabIndicator.transform = CGAffineTransformMakeScale(1, 1)
                    }, completion: nil)
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
        addButton.adjustsImageWhenHighlighted = false
        addButton.setImage(UIImage.init(named: "icon_add"), forState: .Normal)
        addSubview(addButton)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
