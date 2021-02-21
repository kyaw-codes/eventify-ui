//
//  EventHeaderTableViewCell.swift
//  Eventify
//
//  Created by Ko Kyaw on 20/02/2021.
//

import UIKit
import SnapKit

class EventHeaderTableViewCell: UITableViewCell {
    
    static let id = "EventHeaderTableViewCell"
    
    fileprivate lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "mountain"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate lazy var eventDetailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label.text = "Event Details"
        return label
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 34, weight: .semibold)
        label.numberOfLines = 2
        
        let attrString = NSMutableAttributedString(string: "Highest Mountain \ncliff Riding Events:")

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4

        attrString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle], range: NSRange.init(location: 0, length: attrString.length))
        
        label.attributedText = attrString
        return label
    }()
    
    fileprivate lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .semibold)
        label.textColor = .white
        label.text = "Nepal"
        return label
    }()
    
    fileprivate lazy var hikingBadge: UILabel = {
        let label = UILabel()
        label.text = "Hiking".uppercased()
        label.textColor = .white
        label.backgroundColor = #colorLiteral(red: 0.2346452475, green: 0.274137944, blue: 0.3091411591, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(32)
        }
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        backgroundView = backgroundImageView

        // Add gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.colorSecondary.cgColor, UIColor.clear.cgColor, UIColor.colorSecondary.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 0.3, 0.6, 0.8]
        gradientLayer.frame = backgroundView?.bounds ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        
        backgroundImageView.layer.addSublayer(gradientLayer)
        
        // Layout Event Details Label
        addSubview(eventDetailsLabel)
        eventDetailsLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        // Layout title label
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        // Layout country label
        addSubview(countryLabel)
        countryLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).inset(-6)
            make.bottom.equalToSuperview()
        }
        
        // Layout hiking badge
        addSubview(hikingBadge)
        hikingBadge.snp.makeConstraints { (make) in
            make.centerY.equalTo(countryLabel)
            make.leading.equalTo(countryLabel.snp.trailing).inset(-20)
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
