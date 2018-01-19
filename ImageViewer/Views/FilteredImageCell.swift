//
//  FilteredImageCell.swift
//  ImageViewer
//
//  Created by Jeff Ripke on 1/19/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

final class FilteredImageCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: FilteredImageCell.self)
    
    @IBOutlet weak var imageView: UIImageView!
}
