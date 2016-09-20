//
//  PagingCollectionViewController.swift
//  007.PagingCollectionView
//
//  Created by Richard Ting on 4/12/16.
//  Copyright © 2016 Richard Ting. All rights reserved.
//

import UIKit

class PagingCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Dynamic width cell - fit screen width
//        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize.width = view.frame.size.width

        // Fixed width cell
        var insets = collectionView.contentInset
        let value = (view.frame.size.width - (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize.width) * 0.5
        insets.left = value
        insets.right = value
        collectionView.contentInset = insets
        print("\(value)")

        collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PageCell", forIndexPath: indexPath)
        return cell
    }

}
