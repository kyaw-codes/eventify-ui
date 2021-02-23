//
//  EventDetailsViewController+layouts.swift
//  Eventify
//
//  Created by Ko Kyaw on 23/02/2021.
//

import UIKit
import SnapKit

extension EventDetailsViewController {
    
    func addSubViewToScrollView(_ subViews: UIView...) {
        subViews.forEach { scrollView.addSubview($0) }
    }
    
    func layoutSubViews() {
        // Layout scrollview
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // Layout background image view
        backgroundImageView.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height / 2.2)
            make.width.equalToSuperview()
        }
        
        // Layout Event Details Label
        eventDetailsLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(20)
        }
        
        // Layout title label
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(backgroundImageView).inset(20)
        }
        
        // Layout country label
        countryLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(backgroundImageView).inset(20)
            make.top.equalTo(titleLabel.snp.bottom).inset(-6)
            make.bottom.equalTo(backgroundImageView)
        }
        
        // Layout hiking badge
        hikingBadge.snp.makeConstraints { (make) in
            make.centerY.equalTo(countryLabel)
            make.leading.equalTo(countryLabel.snp.trailing).inset(-20)            
        }
        
        // Layout description label
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundImageView.snp.bottom).inset(-30)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(sendButton.snp.leading).inset(-20)
        }
        
        // Layout send button
        sendButton.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundImageView.snp.bottom).inset(-40)
            make.trailing.equalToSuperview().inset(24)
        }
        
        // Layout profile images stack
        profilesStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-40)
        }
        
        // Layout attendance count label
        attendanceCountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(profilesStackView)
            make.leading.equalTo(profilesStackView.snp.trailing).inset(-10)
        }
        
        // Layout attend button
        attendButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(profilesStackView.snp.bottom).inset(-40)
            make.bottom.greaterThanOrEqualTo(scrollView.snp.bottom).inset(30)
        }
        
        // Layout not going button
        notGoingButton.snp.makeConstraints { (make) in
            make.leading.equalTo(attendButton.snp.trailing).inset(-10)
            make.centerY.equalTo(attendButton)
        }

        // Layout share button
        shareButton.snp.makeConstraints { (make) in
            make.leading.equalTo(notGoingButton.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(attendButton)
        }
    }
}

