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
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
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
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
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


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Failed to dequeue CustomCollectionViewCell in HomeControl")
        }
        
        let image = self.images[indexPath.row]
        cell.configure(with: image)
        
        return cell
    }
    
}


