//
//  StoryCollectionViewCell.swift
//  Eventify
//
//  Created by Ko Kyaw on 13/02/2021.
//

import UIKit
import SnapKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let id = "StoryCollectionViewCell"
    
    fileprivate lazy var storyImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "story_5")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 14
        iv.layer.masksToBounds = true
        return iv
    }()
    
    fileprivate lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Jeffery"
        lbl.textAlignment = .center
        return lbl
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add views
        addSubview(storyImageView)
        addSubview(nameLabel)
        
        // Layout subviews
        storyImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(frame.width)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(storyImageView.snp.bottom).inset(-4)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
