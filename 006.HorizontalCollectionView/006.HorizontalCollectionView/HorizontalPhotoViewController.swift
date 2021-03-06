//
//  HorizontalPhotoViewController.swift
//  006.HorizontalCollectionView
//
//  Created by Richard Ting on 4/10/16.
//  Copyright © 2016 Richard Ting. All rights reserved.
//

import UIKit

let reuseIndentifier = "PhotoCell"

class HorizontalPhotoViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var photoCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        photoCollectionView.dataSource = self
        photoCollectionView.backgroundColor = UIColor.whiteColor()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let isRightToLeft = UIView.userInterfaceLayoutDirectionForSemanticContentAttribute(photoCollectionView.semanticContentAttribute) == .RightToLeft
        if isRightToLeft {
            scrollToRightBeginning()
        }
    }

    func scrollToRightBeginning(){
        guard photoCollectionView.numberOfItemsInSection(0) > 0 else { return }
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        photoCollectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
    }

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 51
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIndentifier, forIndexPath: indexPath)

        if let photoCell = cell as? PhotoCell {
            photoCell.nameLabel.text = "Photo \(indexPath.row + 1)"
            photoCell.photoImageView.image = UIImage.init(named: "Image-\(indexPath.row + 1)")
        }

        return cell
    }
}
