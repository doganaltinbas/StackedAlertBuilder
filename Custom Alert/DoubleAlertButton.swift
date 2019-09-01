//
//  DoubleAlertButton.swift
//  Typest
//
//  Created by Dogan Altinbas on 2.07.2019.
//  Copyright © 2019 Dogan Altinbas. All rights reserved.
//

import UIKit

@IBDesignable
class DoubleAlertButton: UIView {
    
    // Connect the custom button to the custom class
    @IBOutlet var view: UIView!
    @IBOutlet weak var firstAlertButton: UIButton!
    @IBOutlet weak var secondAlertButton: UIButton!
    var firstAction:(()->())?
    var secondAction:(()->())?
    
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
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
