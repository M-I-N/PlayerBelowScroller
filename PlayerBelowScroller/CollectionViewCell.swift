//
//  CollectionViewCell.swift
//  PlayerBelowScroller
//
//  Created by Nayem BJIT on 12/19/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Factory Method

    internal static func dequeue(fromCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> CollectionViewCell {
        guard let cell: CollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath) else {
            fatalError("*** Failed to dequeue CollectionViewCell ***")
        }
        return cell
    }

}

