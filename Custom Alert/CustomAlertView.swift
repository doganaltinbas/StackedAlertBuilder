//
//  CustomAlertView.swift
//  CustomAlertView
//
//  Created by Daniel Luque Quintana on 16kar /3/17.
//  Copyright © 2017 dluque. All rights reserved.
//

import UIKit

class CustomAlertView: UIViewController {

    
    @IBOutlet var alertView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    var components:[Any]!
    var str:String?
    
    var delegate: CustomAlertViewDelegate?
    let alertViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateIn()
    }
    
 
    func setupView() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        for component in components{
            if let component = component as? AlertLabelModel{
                let alertLabel = AlertLabel.init()
                alertLabel.lbl.text = component.title
                alertLabel.lbl.textColor = component.textColor
                alertLabel.view.backgroundColor = component.bgColor
                stackView.addArrangedSubview(alertLabel)
            }
            if let component = component as? AlertButtonModel{
                let button1 = AlertButton.init()
                button1.buttonAction = component.buttonAction
                button1.button.setTitle(component.buttonTitle, for: .normal)
                stackView.addArrangedSubview(button1)
            }
            if let component = component as? DoubleAlertButtonModel{
                let doubleAlertButton = DoubleAlertButton.init()
                doubleAlertButton.firstAction = component.buttonAction1
                doubleAlertButton.secondAction = component.buttonAction2
                doubleAlertButton.firstAlertButton.setTitle(component.title1, for: .normal)
                doubleAlertButton.secondAlertButton.setTitle(component.title2, for: .normal)
                stackView.addArrangedSubview(doubleAlertButton)
            }
            if let component = component as? TripleAlertButtonModel{
                let tripleAlertButton = TripleAlertButton.init()
                tripleAlertButton.firstAction = component.buttonAction1
                tripleAlertButton.secondAction = component.buttonAction2
                tripleAlertButton.thirdAction = component.buttonAction3
                tripleAlertButton.firstAlertButton.setImage(component.image1, for: .normal)
                tripleAlertButton.secondAlertButton.setImage(component.image2, for: .normal)
                tripleAlertButton.thirdAlertButton.setImage(component.image3, for: .normal)
                stackView.addArrangedSubview(tripleAlertButton)
            }
            if let component = component as? AlertImageModel{
                let alertImage = AlertImage.init()
                alertImage.imageView.image = component.image
                stackView.addArrangedSubview(alertImage)
            }
        }
    }
    
    func animateIn() {
        self.alertView.alpha = 0.0
        self.alertView.transform = CGAffineTransform.init(scaleX:1.3, y:1.3)
        
        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            self?.alertView.alpha = 1
            self?.alertView.transform = CGAffineTransform.identity
            })
    }
    
    func animateOut(afterBlock:(()->())? = nil) {
    
        UIView.animate(withDuration: 0.2, animations: {[weak self] in
            self?.alertView.transform = CGAffineTransform.init(scaleX:1.3, y:1.3)
            self?.alertView.alpha = 0
            }, completion: {[weak self] (success:Bool) in
                self?.alertView.isHidden = true
                if success{
                    if let afterBlock = afterBlock{
                        afterBlock()
                    }
                }
        })
    }
}
