//
//  StoryTableViewCell.swift
//  Eventify
//
//  Created by Ko Kyaw on 13/02/2021.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    static let id = "StoryTableViewCell"
    
    fileprivate lazy var snapsFromFriendsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Snaps from Friends"
        lbl.textColor = .colorTitle
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return lbl
    }()
    
    fileprivate lazy var storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        return cv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSnapsFromFriendsLabel()
        configureStoryView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    fileprivate func configureSnapsFromFriendsLabel() {
        // Lable
        contentView.addSubview(snapsFromFriendsLabel)
        snapsFromFriendsLabel.snp.makeConstraints { (make) in
            make.trailing.top.equalTo(contentView)
            make.leading.equalTo(contentView).inset(20)
        }
    }
    
    fileprivate func configureStoryView() {
        // Collection View
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        storyCollectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.id)
        
        // Add collection view as subview
        contentView.addSubview(storyCollectionView)
        
        // Layout collection view
        storyCollectionView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(contentView)
            make.top.equalTo(snapsFromFriendsLabel.snp.bottom).inset(-10)
        }
    }

}

extension StoryTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.id, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 5.5, height: collectionView.frame.width / 5.5 + 30)
    }
}
