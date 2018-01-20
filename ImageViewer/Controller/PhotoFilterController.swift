//
//  PhotoFilterController.swift
//  ImageViewer
//
//  Created by Jeff Ripke on 1/19/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class PhotoFilterController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var filtersCollectionView: UICollectionView!
    
    var context: CIContext!
    
    private lazy var filteredImages: [CGImage] = {
        guard let image = self.photo else { return [] }
        let filteredImageBuilder = FilteredImageBuilder(image: image, context: self.context)
        return filteredImageBuilder.imageWithDefaultFilters()
    }()
    
    var photo: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = photo
        filtersCollectionView.dataSource = self
    }
}

extension PhotoFilterController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilteredImageCell.reuseIdentifier, for: indexPath) as! FilteredImageCell
        let cgImage = filteredImages[indexPath.row]
        cell.imageView.image = UIImage(cgImage: cgImage)
        return cell
    }
}
