//
//  EventViewController.swift
//  Eventify
//
//  Created by Ko Kyaw on 23/02/2021.
//

import SwiftUI
import SnapKit

class EventDetailsViewController: UIViewController {
    
    // MARK: - Views
    
    lazy var cancelButtonView: UIView = {
        let cancelLabel = UILabel()
        cancelLabel.text = "Cancel"
        cancelLabel.font = UIFont.systemFont(ofSize: 16)
        cancelLabel.textColor = .white
        
        let iconConfig = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 20))
        let cancelIcon = UIImage(systemName: "xmark.circle", withConfiguration: iconConfig)?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        let cancleIV = UIImageView(image: cancelIcon)
        
        let sv = UIStackView(arrangedSubviews: [cancelLabel, cancleIV])
        sv.axis = .horizontal
        sv.spacing = 6
        return sv
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .colorSecondary
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "mountain"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var eventDetailsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 26)
        label.text = "Event Details"
        return label
    }()
    
    lazy var titleLabel: UILabel = {
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
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34, weight: .semibold)
        label.textColor = .white
        label.text = "Nepal"
        return label
    }()
    
    lazy var hikingBadge: UILabel = {
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
    
    lazy var descriptionLabel: UILabel = {
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
    
    lazy var sendButton: UIButton = {
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
    
    lazy var profilesStackView: MKProfileImagesStackView = {
        let imageWidth: CGFloat = 40
        let view = MKProfileImagesStackView(images: [UIImage(named: "kasumi")!, UIImage(named: "kumada_rinka")!, UIImage(named: "mary")!], size: CGSize(width: imageWidth, height: imageWidth))
        view.snp.makeConstraints { (make) in
            make.width.equalTo((imageWidth * 3) - ((imageWidth * 0.25) * 2))
            make.height.equalTo(imageWidth)
        }
        return view
    }()
    
    lazy var attendanceCountLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .colorSubtitleOne
        
        let attrString = NSMutableAttributedString(string: "40+ ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attrString.append(NSAttributedString(string: "attending the program"))
        
        label.attributedText = attrString
        return label
    }()
    
    lazy var attendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Attend", for: .normal)
        button.backgroundColor = .colorAccent
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width / 2.8)
            make.height.equalTo(45)
        }
        button.layer.cornerRadius = 45 / 2
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var notGoingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Not going", for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width / 2.8)
            make.height.equalTo(45)
        }
        button.layer.cornerRadius = 45 / 2
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colorSubtitleTwo.cgColor
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        let iconConfig = UIImage.SymbolConfiguration(font: UIFont.boldSystemFont(ofSize: 18))
        let shareIcon = UIImage(systemName: "arrowshape.turn.up.forward", withConfiguration: iconConfig)?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        button.setImage(shareIcon, for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colorSubtitleTwo.cgColor
        button.snp.makeConstraints { (make) in
            make.height.equalTo(45)
        }
        button.layer.cornerRadius = 45 / 2
        button.layer.masksToBounds = true
        return button
    }()
    
    var backgroundGradientLayer: CAGradientLayer!
 
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()

        view.addSubview(scrollView)

        // Add gradient layer to the background image
        backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.colors = [
            UIColor.colorSecondary.cgColor,
            UIColor.clear.withAlphaComponent(0.2).cgColor,
            UIColor.colorSecondary.cgColor
        ]
        
        backgroundGradientLayer.locations = [0, 0.5, 0.95]

        addSubViewToScrollView(backgroundImageView, eventDetailsLabel, titleLabel, countryLabel, hikingBadge, descriptionLabel, sendButton, profilesStackView, attendanceCountLabel, attendButton, notGoingButton, shareButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layoutSubViews()

        backgroundGradientLayer.frame = backgroundImageView.bounds
        backgroundImageView.layer.addSublayer(backgroundGradientLayer)
    }
    
    // MARK: - Helper Methods
    
    fileprivate func configureNavBar() {
        // Make navigation bar background transparent
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // Set up bar button items
        let backIconConfig = UIImage.SymbolConfiguration(font: UIFont.boldSystemFont(ofSize: 16))
        
        let backIcon = UIImage(systemName: "chevron.backward", withConfiguration: backIconConfig)?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(.white)
                
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backIcon, style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cancelButtonView)
    }
    
}

struct EventViewController_Preview: PreviewProvider {
    
    static var previews: some View {
        return Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return UINavigationController(rootViewController: EventDetailsViewController())
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
