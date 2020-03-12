//
//  GalleryViewController.swift
//  Photo Gallery
//
//  Created by Martin Mikusovic on 12/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class GalleryViewController: UICollectionViewController {
    
    private var images = [Image]()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
    }

    private func downloadData() {
        APIManager.shared.getBooks { books in
            if let books = books {
                for book in books {
                    if let url = URL(string: book.volumeInfo.imageLinks.thumbnail) {
                        self.downloadImage(from: url, with: book.volumeInfo.title)
                    }
                }
            }
        }
    }
    
    private func downloadImage(from url: URL, with title: String) {
        APIManager.shared.getImage(from: url) { (data, response, error) in
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.images.append(Image(title: title, image: image))
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: - collection view
extension GalleryViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return PhotoCVCell.configure(collectionView, indexPath: indexPath, image: images[indexPath.item])
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailPageViewController.self)) as! DetailPageViewController
        vc.currentIndex = indexPath.item
        vc.images = images
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - collection view layout
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width/4) - 1
        return CGSize(width: size, height: size)
    }
}
