//
//  ImageFiltrationOperation.swift
//  ImageViewer
//
//  Created by Jeff Ripke on 1/20/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

enum ImageFilterState {
    case noFilter, filtered
}

class FiltrationImage {
    var image: UIImage
    var filterState: ImageFilterState = .noFilter
    
    init(image: UIImage) {
        self.image = image
    }
}

class ImageFiltrationOperation: Operation {
    let filtrationImage: FiltrationImage
    let filter: CIFilter
    
    init(image: FiltrationImage, filter: CIFilter) {
        self.filtrationImage = image
        self.filter = filter
    }
    
    override func main() {
        if isCancelled { return }
        if self.filtrationImage.filterState == .filtered {
            return
        }
        if let filteredImage = applyFilter(filter, to: filtrationImage.image) {
            filtrationImage.image = filteredImage
            filtrationImage.filterState = .filtered
        }
    }
    
    func applyFilter(_ filter: CIFilter, to image: UIImage) -> UIImage? {
        let context = CIContext()
        let filteredImageBuilder = FilteredImageBuilder(image: image, context: context)
        if let filteredImage = filteredImageBuilder.applyFilter(filter) {
            return UIImage(cgImage: filteredImage)
        } else {
            return nil
        }
    }
}

