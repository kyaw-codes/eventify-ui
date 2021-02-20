//
//  EventDetailsViewController.swift
//  Eventify
//
//  Created by Ko Kyaw on 10/02/2021.
//

import UIKit
import SnapKit

class EventDetailsViewController: UIViewController {
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .colorSecondary
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup tableview
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(EventHeaderTableViewCell.self, forCellReuseIdentifier: EventHeaderTableViewCell.id)
        tableView.register(EventBodyTableViewCell.self, forCellReuseIdentifier: EventBodyTableViewCell.id)

        // Layout tableview
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
}

extension EventDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: EventHeaderTableViewCell.id, for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: EventBodyTableViewCell.id, for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return view.frame.height * 0.45
        case 1:
            return view.frame.height * 0.4
        default:
            return 100
        }
    }
    
}
