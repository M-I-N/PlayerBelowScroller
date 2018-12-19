//
//  ViewController.swift
//  PlayerBelowScroller
//
//  Created by Nayem BJIT on 12/19/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var collectionView: UICollectionView!

    let images = Array(repeating: UIImage(imageLiteralResourceName: "taylor_swift_placeholder_image"), count: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.registerReusableCell(CollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        hideCollectionView()
        addSwipeLeftRightGestureToView()
    }

    func hideCollectionView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            if let cell = self.collectionView.visibleCells.first {
//                cell.alpha = 0
//            }
            self.collectionView.isHidden = true
        }
    }

    func addSwipeLeftRightGestureToView() {
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(sender:)))
        swipeLeftRecognizer.direction = .left
        playerView.addGestureRecognizer(swipeLeftRecognizer)

        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(sender:)))
        swipeRightRecognizer.direction = .right
        playerView.addGestureRecognizer(swipeRightRecognizer)
    }

    @objc func swipeLeft(sender: UISwipeGestureRecognizer) {
        print("Right-Left")
        self.collectionView.isHidden = false
        
        // forward
        let visibleItemIndexPath = collectionView.indexPathsForVisibleItems.first!
        let nextItemRowNumber = (visibleItemIndexPath.row + 1) % images.count
        let nextItemIndexPath = IndexPath(row: nextItemRowNumber, section: visibleItemIndexPath.section)
        collectionView.scrollToItem(at: nextItemIndexPath, at: .centeredHorizontally, animated: true)
        hideCollectionView()
    }

    @objc func swipeRight(sender: UISwipeGestureRecognizer) {
        print("Left-Right")
        self.collectionView.isHidden = false
        
        // backward
        
        hideCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionViewCell.dequeue(fromCollectionView: collectionView, atIndexPath: indexPath)
        let image = images[indexPath.row]
        cell.imageView.image = image
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
