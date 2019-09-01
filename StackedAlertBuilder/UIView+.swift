//
//  UIView+.swift
//  Typest
//
//  Created by Dogan Altinbas on 5.01.2019.
//  Copyright © 2019 Dogan Altinbas. All rights reserved.
//

import UIKit

extension UIView {
    
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
