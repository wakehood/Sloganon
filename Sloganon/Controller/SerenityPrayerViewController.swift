//
//  SerenityPrayerViewController.swift
//  Sloganon
//
//  Created by Sylvia Wake-Hood on 12/22/22.
//

import UIKit

class SerenityPrayerViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var serenityPrayerScrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serenityPrayerScrollView.minimumZoomScale = 1.0
        serenityPrayerScrollView.maximumZoomScale = 6.0
        serenityPrayerScrollView.delegate = self
        
        self.view.backgroundColor = K.sloganVCbackground
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }


}
