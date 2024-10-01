//
//  ViewController.swift
//  PhotoAlbum_CollectionView_UIkit
//
//  Created by wonyoul heo on 10/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    private var images: [UIImage] = []
    
    
    //MARK: - UI Components
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        for _ in 0...25 {
            images.append(UIImage(named: "PhotoAlbum01")!)
            images.append(UIImage(named: "PhotoAlbum02")!)
            images.append(UIImage(named: "PhotoAlbum03")!)
            images.append(UIImage(named: "PhotoAlbum04")!)
            images.append(UIImage(named: "PhotoAlbum05")!)
        }
    }

    private func setupUI() {
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
        
    }

}

