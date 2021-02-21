//
//  MKProfileImagesStackView.swift
//  Eventify
//
//  Created by Ko Kyaw on 21/02/2021.
//

import UIKit
import SnapKit

class MKProfileImagesStackView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(images: [UIImage], size: CGSize) {
        self.init(frame: .zero)
        
        var profiles = [UIImageView]()
        
        images.forEach { (image) in
            profiles.append(createProfileImageView(image, size.width))
        }
        
        // Layout images
        profiles.reversed().forEach { addSubview($0) }
        
        for (index, profile) in profiles.enumerated() {
            if index == 0 {
                profile.snp.makeConstraints { (make) in
                    make.leading.equalToSuperview()
                    make.centerY.equalToSuperview()
                }
            } else {
                let previousProfile = profiles[index - 1]
                profile.snp.makeConstraints { (make) in
                    make.leading.equalTo(previousProfile.snp.trailing).inset(size.width * 0.25)
                    make.centerY.equalToSuperview()
                }
            }
        }
    }
    
    fileprivate func createProfileImageView(_ image: UIImage, _ width: CGFloat) -> UIImageView {
        let iv = UIImageView(image: image)
        iv.snp.makeConstraints { (make) in
            make.width.height.equalTo(width)
        }
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = width / 2
        iv.layer.masksToBounds = true
        iv.layer.borderColor = UIColor.colorSecondary.cgColor
        iv.layer.borderWidth = 3
        return iv
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
