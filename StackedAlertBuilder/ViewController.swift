//
//  ViewController.swift
//  StackedAlertBuilder
//
//  Created by Dogan Altinbas on 1.09.2019.
//  Copyright © 2019 Dogan Altinbas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showLblAndButton(_ sender: Any) {
        
    }
    @IBAction func showLblAnd2Buttons(_ sender: Any) {
        let customAlert = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertID") as! CustomAlertView
        customAlert.delegate = self
        let components = AlertBuilder().addLabel(text:"Are you sure you want to quit? All unsaved progress will be lost.").addDoubleButton(firstButtonTitle: "CANCEL", secondButtonTitle: "OK", firstButtonAction: {
            customAlert.animateOut(afterBlock: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
        }, secondButtonAction: {
            customAlert.animateOut(afterBlock: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
        }).build()
        guard let componentArray = components else{
            return
        }
        customAlert.components = componentArray
        self.present(customAlert, animated: false, completion: nil)
    }
    @IBAction func showLblAnd3Buttons(_ sender: Any) {
        
    }
    
    
}


extension ViewController: CustomAlertViewDelegate {
    
    @objc func buttonTapped(action: (() -> ())?) {
        if let action = action {
            action()
        }
    }
    
}
