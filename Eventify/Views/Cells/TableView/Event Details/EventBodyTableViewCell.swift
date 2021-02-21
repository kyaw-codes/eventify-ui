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
    
    fileprivate lazy var profilesStackView: MKProfileImagesStackView = {
        let imageWidth: CGFloat = 40
        let view = MKProfileImagesStackView(images: [UIImage(named: "kasumi")!, UIImage(named: "kumada_rinka")!, UIImage(named: "mary")!], size: CGSize(width: imageWidth, height: imageWidth))
        view.snp.makeConstraints { (make) in
            make.width.equalTo((imageWidth * 3) - ((imageWidth * 0.25) * 2))
            make.height.equalTo(imageWidth)
        }
        return view
    }()
    
    fileprivate lazy var attendanceCountLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .colorSubtitleOne
        
        let attrString = NSMutableAttributedString(string: "40+ ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attrString.append(NSAttributedString(string: "attending the program"))
        
        label.attributedText = attrString
        return label
    }()
    
    fileprivate lazy var attendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Attend", for: .normal)
        button.backgroundColor = .colorAccent
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(frame.width / 2.2)
            make.height.equalTo(45)
        }
        button.layer.cornerRadius = 45 / 2
        button.layer.masksToBounds = true
        return button
    }()
    
    fileprivate lazy var notGoingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Not going", for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(frame.width / 2.2)
            make.height.equalTo(45)
        }
        button.layer.cornerRadius = 45 / 2
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colorSubtitleTwo.cgColor
        return button
    }()
    
    fileprivate lazy var shareButton: UIButton = {
        let button = UIButton()
        let iconConfig = UIImage.SymbolConfiguration(font: UIFont.boldSystemFont(ofSize: 18))
        let shareIcon = UIImage(systemName: "arrowshape.turn.up.forward", withConfiguration: iconConfig)?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        button.setImage(shareIcon, for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colorSubtitleTwo.cgColor
        button.layer.cornerRadius = 45 / 2
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .colorSecondary
        
        addSubview(descriptionLabel)
        addSubview(sendButton)
        addSubview(profilesStackView)
        addSubview(attendanceCountLabel)
        addSubview(attendButton)
        addSubview(notGoingButton)
        addSubview(shareButton)
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(sendButton.snp.leading).inset(-20)
        }
        
        sendButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(24)
        }
        
        profilesStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-40)
        }
        
        attendanceCountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(profilesStackView)
            make.leading.equalTo(profilesStackView.snp.trailing).inset(-10)
        }
        
        attendButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(30)
        }
        
        notGoingButton.snp.makeConstraints { (make) in
            make.leading.equalTo(attendButton.snp.trailing).inset(-10)
            make.top.bottom.equalTo(attendButton)
        }
        
        shareButton.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(attendButton)
            make.leading.equalTo(notGoingButton.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
