//
//  HomeViewController.swift
//  Eventify
//
//  Created by Ko Kyaw on 10/02/2021.
//

import SwiftUI
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: - Views
    
    lazy var customNavBarView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Home"
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.textColor = .colorTitle
        return lbl
    }()
    
    lazy var bellIconButton: UIButton = {
        let btn = UIButton()
        let iconConfig = UIImage.SymbolConfiguration.init(font: UIFont.systemFont(ofSize: 24))
        let bellIcon = UIImage(systemName: "bell", withConfiguration: iconConfig)?
            .withRenderingMode(.alwaysOriginal)
        
        btn.setImage(bellIcon, for: .normal)
        btn.snp.makeConstraints { (make) in
            make.width.height.equalTo(28)
        }
        return btn
    }()
    
    lazy var plusButton: UIButton = {
        let btn = UIButton()
        let buttonWidth: CGFloat = 46
        let iconConfig = UIImage.SymbolConfiguration.init(font: UIFont.systemFont(ofSize: 20))
        
        let plusIcon = UIImage(systemName: "plus", withConfiguration: iconConfig)?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(.white)
        
        btn.setImage(plusIcon, for: .normal)
        btn.backgroundColor = .colorAccent
        
        btn.snp.makeConstraints { (make) in
            make.width.height.equalTo(buttonWidth)
        }
        
        btn.layer.cornerRadius = buttonWidth / 2
        btn.layer.masksToBounds = true
        return btn
    }()
    
    lazy var homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupTableView()
    }
    
    // MARK: - Helper Methods
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        
        // Layout custom nav bar
        view.addSubview(customNavBarView)
        customNavBarView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(120)
        }
        
        // Set up custom nav bar items
        [titleLabel, bellIconButton, plusButton].forEach { customNavBarView.addSubview($0) }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(24)
        }
        
        plusButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().inset(18)
            make.trailing.equalToSuperview().inset(24)
        }
        
        bellIconButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().inset(18)
            make.trailing.equalTo(plusButton.snp.leading).inset(-26)
        }
    }

}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        return Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container : UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return UINavigationController(rootViewController: HomeViewController())
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
