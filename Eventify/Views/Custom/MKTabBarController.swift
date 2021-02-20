//
//  MKTabBarController.swift
//  Eventify
//
//  Created by Ko Kyaw on 17/02/2021.
//

import UIKit

class MKTabBarController: UITabBarController {
    
    fileprivate var tabBarHeight: CGFloat = 90
    
    fileprivate var mkTabBar: MKTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        object_setClass(self.tabBar, OverridedTabBar.self)

        // load custom tab bar
        let menuItems: [MKTabItem] = MKTabItem.allCases
        
        mkTabBar = MKTabBar(menuItems: menuItems)
        mkTabBar.onTabItemTapped = onTabItemTapped(index:)
        
        // Add view controllers
        var tabViewControllers = [UIViewController]()
        menuItems.forEach { tabViewControllers.append($0.viewController) }
        viewControllers = tabViewControllers
        
        // Layout custom tab bar
        tabBar.alpha = 0
        tabBar.isUserInteractionEnabled = false

        view.addSubview(mkTabBar)
        mkTabBar.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(tabBarHeight)
        }
    }

    func onTabItemTapped(index: Int) {
        selectedIndex = index
    }
    
}

private class OverridedTabBar: UITabBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: frame.width, height: 90)
    }
}

