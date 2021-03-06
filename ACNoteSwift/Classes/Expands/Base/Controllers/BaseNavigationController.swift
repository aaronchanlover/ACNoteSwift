//
//  BaseNavigationController.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/5/26.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //手势Delegate
        self.interactivePopGestureRecognizer!.delegate = self
        
        //UINavigationControllerDelegate
        self.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK:- 修复导航控制器在根部时再往右滑程序假死的情况
extension BaseNavigationController : UIGestureRecognizerDelegate,UINavigationControllerDelegate{
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //push时关闭手势
        self.interactivePopGestureRecognizer?.isEnabled = false
        viewController.hidesBottomBarWhenPushed=true
        super.pushViewController(viewController, animated: animated)
        
    }
    
    //MARK:- UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        //        viewController.edgesForExtendedLayout=[]
        navigationController.navigationBar.isTranslucent = false
        
        if navigationController.viewControllers.count == 1 {
            //如果是 rootViewController 关闭手势响应
            self.interactivePopGestureRecognizer?.isEnabled = false
        }
        else{
            //如果不是 rootViewController 开启手势响应
            self.interactivePopGestureRecognizer?.isEnabled = true
        }
    }
    
}


//MARK:- 扩展UINavigationController的方法
extension UINavigationController{
    
    func pushViewController(_ identifier : String, storyBoardName :String? , animated : Bool ){
        var myStoryBoardName : String = ""
        if (storyBoardName == nil) {
            myStoryBoardName = "Main"
        }
        else{
            myStoryBoardName = storyBoardName!
        }
        
        let board = UIStoryboard(name: myStoryBoardName, bundle: nil)
        let viewController = board.instantiateViewController(withIdentifier: identifier) as UIViewController
        self.pushViewController(viewController, animated: animated)
    }
}


