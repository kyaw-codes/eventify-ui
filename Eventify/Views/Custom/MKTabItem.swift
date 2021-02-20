//
//  MKTabItem.swift
//  Eventify
//
//  Created by Ko Kyaw on 18/02/2021.
//

import UIKit

public enum MKTabItem: CaseIterable {
    case home, eventDetail, location, chat, profile
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")!
        case .eventDetail:
            return UIImage(systemName: "creditcard.fill")!
        case .location:
            return UIImage(systemName: "location.north.fill")!
        case .chat:
            return UIImage(systemName: "message.fill")!
        default:
            return UIImage(named: "kumada_rinka")!
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return UINavigationController(rootViewController: HomeViewController())
        case .eventDetail:
            return EventDetailsViewController()
        case .location:
            return LocationViewController()
        case .chat:
            return ChatViewController()
        default:
            return ProfileViewController()
        }
    }
}
