//
//  MKTabBar.swift
//  Eventify
//
//  Created by Ko Kyaw on 18/02/2021.
//

import UIKit

class MKTabBar: UIView {
    
    var onTabItemTapped: ((Int) -> Void)!
    
    var tabViews: [UIView] = [UIView]()
    
    var currentActiveIndex = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    fileprivate var stackView: UIStackView!

    convenience init(menuItems: [MKTabItem]) {
        self.init(frame: .zero)
        
        // Set up layout
        backgroundColor = .colorPrimary
        
        for i in 0..<menuItems.count {
            let item = menuItems[i]
            let tabView = createTabItem(item, isActive: i == 0)
            tabView.tag = i
            
            tabView.isUserInteractionEnabled = true
            tabView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapEvent(_:))))

            tabViews.append(tabView)
        }
        
        let stackView = UIStackView(arrangedSubviews: tabViews)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.isUserInteractionEnabled = true
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    @objc fileprivate func handleTapEvent(_ sender: UIGestureRecognizer) {
        let index = sender.view?.tag ?? 0
        onTabItemTapped(index)
        
        (tabViews[currentActiveIndex] as! UIImageView).tintColor = .colorTabUnselected
        
        (tabViews[index] as! UIImageView).tintColor = .white
        
        currentActiveIndex = index
    }
        
    fileprivate func createTabItem(_ tabItem: MKTabItem, isActive: Bool = false) -> UIView {
        if tabItem == .profile {
            // Return profile image tab bar
            let profileImageView = UIImageView(image: tabItem.icon)
            profileImageView.contentMode = .scaleAspectFill
            profileImageView.snp.makeConstraints { (make) in
                make.width.height.equalTo(45)
            }
            profileImageView.layer.cornerRadius = 45 / 2
            profileImageView.layer.masksToBounds = true
            return profileImageView
        }
        
        // Return normal icon tab bar
        let iconImage = tabItem.icon.withRenderingMode(.alwaysTemplate)
        
        let imageView = UIImageView(image: iconImage)
        imageView.tintColor = isActive ? .white : .colorTabUnselected
        imageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(26)
        }
        
        return imageView
    }
    
}
