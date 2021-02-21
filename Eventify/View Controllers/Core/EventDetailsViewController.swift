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

    fileprivate lazy var cancelButtonView: UIView = {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup navbar
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cancelButtonView)
        
        
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
            return view.frame.height * 0.4
        case 1:
            return view.frame.height * 0.4
        default:
            return 100
        }
    }
    
}
