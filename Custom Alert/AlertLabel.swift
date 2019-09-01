//
//  AlertLabel.swift
//  Typest
//
//  Created by Dogan Altinbas on 15.08.2019.
//  Copyright © 2019 Dogan Altinbas. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class AlertLabel: UIView {
    
    // Connect the custom button to the custom class
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet var view: UIView!
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
        
        //label.font = UIFont.systemFont(ofSize: 17)
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
