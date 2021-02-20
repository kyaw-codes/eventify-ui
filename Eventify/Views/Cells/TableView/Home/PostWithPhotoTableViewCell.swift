//
//  PostWithPhotoTableViewCell.swift
//  Eventify
//
//  Created by Ko Kyaw on 13/02/2021.
//

import UIKit
import SnapKit

class PostWithPhotoTableViewCell: UITableViewCell {
    
    static let id = "PostWithPhotoTableViewCell"
    
    var photoGridVC: UICollectionViewController = {
        let vc = MKPhotoGridViewController()
        vc.photos = [UIImage(named: "story_1")!, UIImage(named: "story_2")!, UIImage(named: "story_3")!, UIImage(named: "story_4")!, UIImage(named: "kasumi")!]
        return vc
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let postInfo = MKPostView.VO(profile: UIImage(named: "kasumi")!, name: "Kasumi Arimura", actionText: "Uploaded 5 photos", locationText: "Okoyama, Japan", likeCount: 31, commentCount: 64)
        
        let postView = MKPostView(baseInfo: postInfo) { body in
            // Set up the post body
            let photoGridView = photoGridVC.view!
            body.addSubview(photoGridView)
            
            photoGridView.snp.makeConstraints { (make) in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
        }
        
        // Add post to superview
        contentView.addSubview(postView)        
        postView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
