//
//  CustomTabBarController.swift
//  ACNoteSwift
//
//  Created by 陈军 on 2017/3/9.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class MainTabBarController: RAMAnimatedTabBarController {

         
    override func viewDidLoad() {
        super.viewDidLoad()
        addAllChildsControllors()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MainTabBarController {
    ///添加所有的子控制器
    fileprivate func addAllChildsControllors() {
        ///首页
        addOneChildVC(childVC: AccountingViewController(), title: "首页", image: UIImage(imageLiteralResourceName: "icon_tabbar_account"), selecteImage: nil)
         
        //直播
        addOneChildVC(childVC: NoteViewController(), title: "", image: UIImage(imageLiteralResourceName: "add"), selecteImage:nil)
       
        
        //关注
        addOneChildVC(childVC: MeViewController(), title: "关注", image: UIImage(imageLiteralResourceName: "icon_tabbar_account"), selecteImage:nil)
        
        //我的
//        addOneChildVC(childVC: ProfileViewController(), title: "我的", image: UIImage(imageLiteralResourceName: "btn_user_normal"), selecteImage: UIImage(named: "btn_user_selected"))
        
        
        
    }
    
    ///添加一个控制器
    private func addOneChildVC(childVC: UIViewController, title: String?, image: UIImage?, selecteImage: UIImage?) {
        
        //1.添加子控制器
        let navVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navVC)
        //2.添加标题
        let item = RAMAnimatedTabBarItem(title: title, image: image, selectedImage: selecteImage)
        
        let animation = RAMBounceAnimation()
        animation.iconSelectedColor = UIColor.orange
        animation.textSelectedColor=UIColor.orange
        item.animation = animation
        
        navVC.tabBarItem = item
        
        
    }
    ///添加一个控制器
    private func addOneChildVC(childVC: UIViewController, title: String?, imageView: UIImageView?, selecteImage: UIImage?) {
        
        //1.添加子控制器
        let navVC = UINavigationController(rootViewController: childVC)
        addChildViewController(navVC)
        //2.添加标题
        let item = RAMAnimatedTabBarItem()
        let label = UILabel()
        label.text=title
        let iv=(imageView!,label)
        item.iconView=iv
        let animation = RAMBounceAnimation()
        animation.iconSelectedColor = UIColor.orange
        animation.textSelectedColor=UIColor.orange
        item.animation = animation
        
        navVC.tabBarItem = item
        
        
    }

}
