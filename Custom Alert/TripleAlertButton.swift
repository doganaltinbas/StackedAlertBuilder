//
//  TripleAlertButton.swift
//  Typest
//
//  Created by Dogan Altinbas on 16.08.2019.
//  Copyright © 2019 Dogan Altinbas. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TripleAlertButton: UIView {
    
    // Connect the custom button to the custom class
        
    @IBOutlet var view: UIView!
    @IBOutlet weak var halfView: UIView!
    @IBOutlet weak var firstAlertButton: UIButton!
    @IBOutlet weak var secondAlertButton: UIButton!
    @IBOutlet weak var thirdAlertButton: UIButton!
    var firstAction:(()->())?
    var secondAction:(()->())?
    var thirdAction:(()->())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                 UIView.AutoresizingMask.flexibleHeight]
        halfView.layer.cornerRadius = 15
        halfView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        addSubview(view)
        
        //button.titleLabel!.font = UIFont.systemFont(ofSize: 17)
    }
    
    @IBAction func firstBtnTapped(_ sender: Any) {
        if let firstAction = firstAction {
            if let vc = self.findViewController() as? CustomAlertView{
                vc.delegate?.buttonTapped(action: firstAction)
            }
        }
    }
    @IBAction func secondBtnTapped(_ sender: Any) {
        if let secondAction = secondAction {
            if let vc = self.findViewController() as? CustomAlertView{
                vc.delegate?.buttonTapped(action: secondAction)
            }
        }
    }
    
    @IBAction func thirdBtnTapped(_ sender: Any) {
        if let thirdAction = thirdAction {
            if let vc = self.findViewController() as? CustomAlertView{
                vc.delegate?.buttonTapped(action: thirdAction)
            }
        }
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
