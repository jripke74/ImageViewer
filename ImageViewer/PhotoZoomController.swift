//
//  PhotoZoomController.swift
//  ImageViewer
//
//  Created by Jeff Ripke on 1/18/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class PhotoZoomController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo: Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = photo.image
        photoImageView.sizeToFit()
        scrollView.contentSize = photoImageView.bounds.size
        updateZoomScale()
    }
    
    func updateZoomScale() {
        let viewSize = view.bounds.size
        let widthScale = viewSize.width / photoImageView.bounds.width
        let heightScale = viewSize.height / photoImageView.bounds.height
        let minScale = min(widthScale, heightScale)
        scrollView.maximumZoomScale = minScale
        scrollView.zoomScale = minScale
    }
}

extension PhotoZoomController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoImageView
    }
}
