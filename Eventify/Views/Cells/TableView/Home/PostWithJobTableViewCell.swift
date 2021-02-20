//
//  PostWithJobTableViewCell.swift
//  Eventify
//
//  Created by Ko Kyaw on 14/02/2021.
//

import UIKit
import SnapKit

class PostWithJobTableViewCell: UITableViewCell {
    
    static let id = "PostWithJobTableViewCell"
        
    fileprivate lazy var companyAndPositionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        let attrString = NSMutableAttributedString(string: "LesPros Entertainment.\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor : UIColor.darkText])
        attrString.append(NSAttributedString(string: "Former Actress", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.colorPrimary]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        attrString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: NSRange.init(location: 0, length: attrString.length))
        
        lbl.attributedText = attrString
        return lbl
    }()
    
    fileprivate lazy var businessCaseIconButton: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24))
        let briefcaseImage = UIImage(systemName: "briefcase", withConfiguration: config)?.withRenderingMode(.alwaysOriginal).withTintColor(.colorPrimary)
        btn.setImage(briefcaseImage, for: .normal)
        btn.backgroundColor = .colorGrayBackground
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let postInfo = MKPostView.VO(profile: UIImage(named: "kumada_rinka")!, name: "Kumada Rinka", actionText: "Started a Job", locationText: "Okoyama, Japan", likeCount: 24, commentCount: 12)
        
        let postView = MKPostView(baseInfo: postInfo) { (body) in
            
            [companyAndPositionLabel, businessCaseIconButton].forEach { body.addSubview($0) }
            
            companyAndPositionLabel.snp.makeConstraints { (make) in
                make.leading.equalToSuperview()
                make.top.bottom.equalToSuperview().inset(6)
                make.trailing.equalTo(businessCaseIconButton.snp.leading)
            }

            businessCaseIconButton.snp.makeConstraints { (make) in
                make.trailing.equalToSuperview()
                make.centerY.equalTo(companyAndPositionLabel)
                make.width.height.equalTo(companyAndPositionLabel.snp.height)
            }

        }
        
        contentView.addSubview(postView)
        postView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
