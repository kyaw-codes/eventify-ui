//
//  MKPhotoGridViewController.swift
//  Eventify
//
//  Created by Ko Kyaw on 15/02/2021.
//

import UIKit

final class MKPhotoGridViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Computed Properties
    
    var photos: [UIImage]? {
        didSet {
            guard let photos = photos else { return }
            if photos.count == 0 {
                fatalError("No photo found.")
            }
        }
    }
    
    fileprivate lazy var overlayView: UIView = {
        let overlayView = UIView()
        overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        let label = UILabel()
        label.text = "+4"
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .white
        
        overlayView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        return overlayView
    }()
    
    // MARK: - Constructors
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.init(collectionViewLayout: layout)
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if os(iOS)
        if #available(iOS 13.0, *) {
            collectionView.backgroundColor = .systemBackground
        } else {
            collectionView.backgroundColor = .white
        }
        #endif

        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.id)
    }
    
    // MARK: - DataSource & Delegate Methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(photos!.count, 4)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.id, for: indexPath) as! Cell
        cell.photo = photos![indexPath.row]

        // If the grid has more than four photos, add overlay to the fourth photo
        if photos!.count > 4 {
            if indexPath.row == 3 {
                cell.addSubview(overlayView)
                overlayView.snp.makeConstraints { (make) in
                    make.top.leading.trailing.bottom.equalToSuperview()
                }
                return cell
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return calculateCellSize(collectionView, cellforItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    // MARK: - Helper Methods
    
    fileprivate func calculateCellSize(_ collectionView: UICollectionView, cellforItemAt indexPath: IndexPath) -> CGSize {
        switch photos!.count {
        case 1:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        case 2:
            return calculateSizeForTwoPhotosGrid(collectionView: collectionView, at: indexPath)
        case 3:
            return calculateSizeForThreePhotosGrid(collectionView: collectionView, at: indexPath)
        case 4:
            return calculateSizeForFourPhotosGrid(collectionView: collectionView, at: indexPath)
        default:
            // More than 4
            return calculateSizeForFourPhotosGrid(collectionView: collectionView, at: indexPath)
        }
    }
    
    fileprivate func calculateSizeForTwoPhotosGrid(collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0, 1:
            return CGSize(width: (collectionView.frame.width / 2) - 6, height: (collectionView.frame.height) - 6)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    fileprivate func calculateSizeForThreePhotosGrid(collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: (collectionView.frame.width - collectionView.frame.height / 1.6) - 6, height: collectionView.frame.height)
        case 1:
            return CGSize(width: (collectionView.frame.height / 1.6) - 6, height: (collectionView.frame.height / 2) - 6)
        case 2:
            return CGSize(width: (collectionView.frame.height / 1.6) - 6, height: (collectionView.frame.height / 2) - 6)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    fileprivate func calculateSizeForFourPhotosGrid(collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0, 1, 2, 3:
            return CGSize(width: (collectionView.frame.width / 2) - 6, height: (collectionView.frame.height / 2) - 6)
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }

    // MARK: - Cell Class
    
    fileprivate final class Cell: UICollectionViewCell {
        
        static let id = "MKPhotoGridCell"
        
        var photo: UIImage? {
            didSet {
                guard let image = photo else { return }
                postImageView.image = image
            }
        }
        
        fileprivate lazy var postImageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.image = UIImage(named: "story_1")
            return iv
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            layer.cornerRadius = 20
            layer.masksToBounds = true
            
            addSubview(postImageView)
            postImageView.snp.makeConstraints { (make) in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
    }
}
