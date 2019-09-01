//
//  AlertButton.swift
//  Typest
//
//  Created by Dogan Altinbas on 14.08.2019.
//  Copyright © 2019 Dogan Altinbas. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class AlertButton: UIView {
    
    // Connect the custom button to the custom class
    @IBOutlet weak var button: UIButton!
    @IBOutlet var view: UIView!
    var buttonAction:(()->())?
    
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
        
        button.titleLabel!.font = UIFont.systemFont(ofSize: 17)
    }
    
    @IBAction func firstBtnTapped(_ sender: Any) {
        if let buttonAction = buttonAction {
            if let vc = self.findViewController() as? CustomAlertView{
                vc.delegate?.buttonTapped(action: buttonAction)
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
