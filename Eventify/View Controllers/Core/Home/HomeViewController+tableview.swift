//
//  HomeViewController+layout.swift
//  Eventify
//
//  Created by Ko Kyaw on 23/02/2021.
//

import UIKit
import SnapKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Layouting views
    
    func setupTableView() {
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
    
    func layoutHomeTableView() {
        homeTableView.snp.makeConstraints { (make) in
            make.top.equalTo(customNavBarView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // MARK: - Delegate
    
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
