//
//  HomeViewController.swift
//  Eventify
//
//  Created by Ko Kyaw on 10/02/2021.
//

import SwiftUI
import SnapKit

class HomeViewController: UIViewController {
    
    fileprivate lazy var customNavBarView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Home"
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.textColor = .colorTitle
        return lbl
    }()
    
    fileprivate lazy var bellIconButton: UIButton = {
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
    
    fileprivate lazy var plusButton: UIButton = {
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
    
    fileprivate lazy var homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
        setupTableView()
    }
    
    fileprivate func setupNavigationBar() {
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
    
    fileprivate func setupTableView() {
        // Customize appearance
        homeTableView.separatorStyle = .none
        homeTableView.allowsSelection = false

        // Set delegate and datasource
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        // Register TableViewCell
        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        homeTableView.register(StoryTableViewCell.self, forCellReuseIdentifier: StoryTableViewCell.id)
        homeTableView.register(PostWithPhotoTableViewCell.self, forCellReuseIdentifier: PostWithPhotoTableViewCell.id)
        homeTableView.register(PostWithJobTableViewCell.self, forCellReuseIdentifier: PostWithJobTableViewCell.id)
        homeTableView.register(PostWithTextOnlyTableViewCell.self, forCellReuseIdentifier: PostWithTextOnlyTableViewCell.id)

        // Add tableview as subview
        view.addSubview(homeTableView)
        
        // Layout tableView
        layoutHomeTableView()
    }
    
    fileprivate func layoutHomeTableView() {
        homeTableView.snp.makeConstraints { (make) in
            make.top.equalTo(customNavBarView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.id, for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostWithPhotoTableViewCell.id, for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostWithJobTableViewCell.id, for: indexPath)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostWithTextOnlyTableViewCell.id, for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 300
        case 2:
            return 140
        case 3:
            return 180
        default:
            return 100
        }
    }
    
    // This will simply make a view between each tableview cell
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    // Height for spacer view
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 34
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
