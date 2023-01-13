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
        serenityPrayerScrollView.minimumZoomScale = 0.5
        serenityPrayerScrollView.maximumZoomScale = 6.0
        serenityPrayerScrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return contentView
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
