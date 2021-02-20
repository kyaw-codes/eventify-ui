//
//  PostWithTextOnlyTableViewCell.swift
//  Eventify
//
//  Created by Ko Kyaw on 15/02/2021.
//

import UIKit

class PostWithTextOnlyTableViewCell: UITableViewCell {
    
    static let id = "PostWithTextOnlyTableViewCell"
    
    fileprivate lazy var postTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla fringilla condimentum est, a tincidunt purus sagittis vitae. Morbi fringilla dignissim aliquet."
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .colorSubtitleTwo
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let postInfo = MKPostView.VO(profile: UIImage(named: "mary")!, name: "Mary Soe", actionText: "Updated a Post", locationText: "Yangon, Myanmar", likeCount: 42, commentCount: 53)
        let postView = MKPostView(baseInfo: postInfo) { (body) in
            body.addSubview(postTextLabel)
            postTextLabel.snp.makeConstraints { (make) in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
        }
        
        contentView.addSubview(postView)
        postView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
