//
//  ViewController.swift
//  HarmonyUS
//
//  Created by Jacob Dobson on 3/23/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //globals\\
    let albumWidthAndHeight = CGSize(width: UIScreen.main.bounds.width - 16,
                                    height: UIScreen.main.bounds.width - 16)
    //outlets\\
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var songTitleTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        bgImageView.blurImageView(targetView: bgImageView)
        albumImageView.frame.size = albumWidthAndHeight
        let textViewPadding = songTitleTextView.textContainer.lineFragmentPadding
        songTitleTextView.textContainerInset = UIEdgeInsetsMake(4, -textViewPadding, 0, -textViewPadding)
    }
}

extension UIImageView {
    func blurImageView(targetView: UIImageView) {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.frame = self.bounds //self is of type: UIImageView
        self.insertSubview(blurView, aboveSubview: targetView)
    }
}
