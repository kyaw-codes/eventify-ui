//
//  MKBasePostView.swift
//  Eventify
//
//  Created by Ko Kyaw on 16/02/2021.
//

import UIKit

class MKPostView: UIView {
    
    fileprivate lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "kasumi")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    fileprivate lazy var postActionLabel: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 2
        return lable
    }()
    
    fileprivate lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    fileprivate lazy var likeButton: UIButton = {
        let button = UIButton()
        let imgConfig = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20, weight: .semibold))
        let heartImage = UIImage(systemName: "suit.heart", withConfiguration: imgConfig)
        button.setImage(heartImage?.withRenderingMode(.alwaysOriginal).withTintColor(.colorSubtitleTwo), for: .normal)
        return button
    }()
    
    fileprivate lazy var likeCountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "31"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .colorSubtitleTwo
        return lbl
    }()
    
    fileprivate lazy var commentButton: UIButton = {
        let button = UIButton()
        let imgConfig = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 20, weight: .semibold))
        let bubbleImage = UIImage(systemName: "bubble.right", withConfiguration: imgConfig)
        button.setImage(bubbleImage?.withRenderingMode(.alwaysOriginal).withTintColor(.colorSubtitleTwo), for: .normal)
        return button
    }()
    
    fileprivate lazy var commentCountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "64"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .colorSubtitleTwo
        return lbl
    }()
    
    fileprivate lazy var bottomActionSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 16
        return sv
    }()
    
    fileprivate lazy var bodyView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(baseInfo: VO, postBody: (UIView) -> Void) {
        self.init()
        
        bindDataToViews(baseInfo: baseInfo)
        
        addSubViews()

        layingSubViewsOut()
            
        // Calling the closure and passing the body view
        postBody(bodyView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    fileprivate func bindDataToViews(baseInfo: VO) {
        profileImageView.image = baseInfo.profile
        likeCountLabel.text = String(baseInfo.likeCount)
        commentCountLabel.text = String(baseInfo.commentCount)

        // Set up action label
        let attrString = NSMutableAttributedString(string: "\(baseInfo.name) ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .heavy), NSAttributedString.Key.foregroundColor: UIColor.colorTitle])
        attrString.append(NSAttributedString(string: "\(baseInfo.actionText)\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.colorSubtitleOne]))
        attrString.append(NSAttributedString(string: "\(baseInfo.locationText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor.colorSubtitleTwo]))

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        
        attrString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: NSRange.init(location: 0, length: attrString.length))

        postActionLabel.attributedText = attrString
    }
    
    fileprivate func addSubViews() {
        addSubview(profileImageView)
        addSubview(moreButton)
        addSubview(postActionLabel)
        addSubview(bodyView)

        // Bottom action buttons
        let likeSV = UIStackView(arrangedSubviews: [likeButton, likeCountLabel])
        likeSV.spacing = 6
        
        let commentSV = UIStackView(arrangedSubviews: [commentButton, commentCountLabel])
        commentSV.spacing = 6

        [likeSV, commentSV, UIView()].forEach { bottomActionSV.addArrangedSubview($0) }
        addSubview(bottomActionSV)
    }
    
    fileprivate func layingSubViewsOut() {
        profileImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview()
            make.width.height.equalTo(40)
        }
        profileImageView.layer.cornerRadius = 40 / 2
        
        moreButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(profileImageView)
        }
        
        postActionLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageView.snp.trailing).inset(-12)
            make.trailing.equalTo(moreButton.snp.leading)
            make.top.equalTo(profileImageView)
        }
        
        bottomActionSV.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }

        bodyView.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageView)
            make.trailing.equalTo(moreButton)
            make.top.equalTo(profileImageView.snp.bottom).inset(-8)
            make.bottom.equalTo(bottomActionSV.snp.top).inset(-8)
        }
    }
}

extension MKPostView {
    
    struct VO {
        var profile: UIImage
        var name: String
        var actionText: String
        var locationText: String
        var likeCount: Int
        var commentCount: Int
    }
}
