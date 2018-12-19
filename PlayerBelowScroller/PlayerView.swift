//
//  PlayerView.swift
//  PlayerBelowScroller
//
//  Created by Nayem on 12/19/18.
//  Copyright © 2018 BJIT Ltd. All rights reserved.
//

import UIKit

class PlayerView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = PlayerView.nib
        return nib?.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        print("Play button tapped")
    }
    
}

extension PlayerView: NibInitable {
    
}
