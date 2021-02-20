//
//  EventBodyTableViewCell.swift
//  Eventify
//
//  Created by Ko Kyaw on 21/02/2021.
//

import UIKit
import SnapKit

class EventBodyTableViewCell: UITableViewCell {
    
    static let id = "EventBodyTableViewCell"
    
    fileprivate lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .colorSubtitleOne
        
        let attrString = NSMutableAttributedString(string: "\"The most beautiful experience we can have is the mysterious, It is the fundamental emotion that stands at the cradle of true art and true science.")

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6

        attrString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: NSRange.init(location: 0, length: attrString.length))
        
        label.attributedText = attrString

        return label
    }()
    
    fileprivate lazy var sendButton: UIButton = {
        let button = UIButton()
        let sendIcon = UIImage(systemName: "paperplane.fill", withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 18)))?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        button.setImage(sendIcon, for: .normal)
        button.backgroundColor = .colorPrimary
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
        }
        button.layer.cornerRadius = 50 / 2
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .colorSecondary
        
        addSubview(descriptionLabel)
        addSubview(sendButton)
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().inset(20)
            make.width.equalTo(frame.width * 0.9)
        }
        
        sendButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
