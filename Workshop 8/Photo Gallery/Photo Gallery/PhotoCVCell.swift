//
//  PhotoCVCell.swift
//  Photo Gallery
//
//  Created by Martin Mikusovic on 12/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class PhotoCVCell: UICollectionViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    
    static func configure(_ collectionView: UICollectionView, indexPath: IndexPath, image: Image) -> PhotoCVCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotoCVCell.self), for: indexPath) as! PhotoCVCell
        cell.photoImageView.image = image.image
        return cell
    }
}
