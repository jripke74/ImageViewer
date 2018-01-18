//
//  PhotoViewerController.swift
//  ImageViewer
//
//  Created by Jeff Ripke on 1/17/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit

class PhotoViewerController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo: Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = photo.image
    }
    
    @IBAction func launchPhotoZoomController(_ sender: Any) {
        guard let storyboard = storyboard else { return }
        let zoomController = storyboard.instantiateViewController(withIdentifier: String(describing: PhotoZoomController.self)) as! PhotoZoomController
        zoomController.modalTransitionStyle = .crossDissolve
        zoomController.photo = photo
        navigationController?.present(zoomController, animated: true, completion: nil)
    }
}
