//
//  AlertBuilder.swift
//  Typest
//
//  Created by Dogan Altinbas on 2.07.2019.
//  Copyright © 2019 Dogan Altinbas. All rights reserved.
//

import UIKit

class AlertLabelModel{
    
    public var title:String
    public var textColor:UIColor?
    public var bgColor:UIColor?

    init(_ title:String, textColor:UIColor? = nil, bgColor:UIColor? = nil) {
        self.title = title
        if let textColor = textColor {
            self.textColor = textColor
        }
        if let bgColor = bgColor {
            self.bgColor = bgColor
        }
    }
}

class AlertButtonModel{
    
    public var buttonTitle:String
    public var buttonAction:(()->())?
    
    init(_ title:String, action:(()->())? = nil) {
        self.buttonTitle = title
        if let buttonAction = action{
            self.buttonAction = buttonAction
        }
    }
}


class DoubleAlertButtonModel{
    
    public var title1:String
    public var title2:String
    public var buttonAction1:(()->())?
    public var buttonAction2:(()->())?

    init(title1:String = "Cancel", title2:String = "OK", buttonAction1:(()->())? = nil, buttonAction2:(()->())? = nil) {
        self.title1 = title1
        self.title2 = title2
        if let buttonAction1 = buttonAction1 {
            self.buttonAction1 = buttonAction1
        }
        if let buttonAction2 = buttonAction2 {
            self.buttonAction2 = buttonAction2
        }
    }
    
}

class TripleAlertButtonModel{
    
    public var image1:UIImage?
    public var image2:UIImage?
    public var image3:UIImage?
    public var buttonAction1:(()->())?
    public var buttonAction2:(()->())?
    public var buttonAction3:(()->())?
    init(image1:UIImage?, image2:UIImage?, image3:UIImage?, buttonAction1:(()->())? = nil, buttonAction2:(()->())? = nil, buttonAction3:(()->())? = nil) {
        if let image1 = image1{
            self.image1 = image1
            
        }
        if let image2 = image2{
            self.image2 = image2
            
        }
        if let image3 = image3{
            self.image3 = image3
        }
        if let buttonAction1 = buttonAction1 {
            self.buttonAction1 = buttonAction1
        }
        if let buttonAction2 = buttonAction2 {
            self.buttonAction2 = buttonAction2
        }
        if let buttonAction3 = buttonAction3 {
            self.buttonAction3 = buttonAction3
        }
    }
    
}

class AlertImageModel{
    
    public var image:UIImage?

    init(image:UIImage?) {
        if let image = image{
            self.image = image
        }
    }
}

class AlertBuilder {
    
    private var components: [Any]
    
    init() {
        self.components = []
    }
    
    func addLabel(text: String, textColor:UIColor? = UIColor.bgColor, bgColor:UIColor? = .white) -> AlertBuilder {
        let alertLabel = AlertLabelModel(text, textColor: textColor, bgColor: bgColor)
        self.components.append(alertLabel)
        return self
    }
    
    func addSingleButton(buttonTitle: String, action:(()->())? = nil) -> AlertBuilder {
        let alertBtn = AlertButtonModel.init(buttonTitle, action: action)
        self.components.append(alertBtn)
        return self
    }
    
    func addDoubleButton(firstButtonTitle: String? = "Cancel", secondButtonTitle:String? = "OK", firstButtonAction:(()->())? = nil, secondButtonAction:(()->())? = nil) -> AlertBuilder {
        let alertBtn = DoubleAlertButtonModel.init(title1: firstButtonTitle!, title2: secondButtonTitle!, buttonAction1: firstButtonAction, buttonAction2: secondButtonAction)
        self.components.append(alertBtn)
        return self
    }
    
    func addTripleButton(firstButtonImage:UIImage? = #imageLiteral(resourceName: "menu"), secondButtonImage:UIImage? = #imageLiteral(resourceName: "restart"), thirdButtonImage:UIImage? = #imageLiteral(resourceName: "next"), firstButtonAction:(()->())? = nil, secondButtonAction:(()->())? = nil, thirdButtonAction:(()->())? = nil) -> AlertBuilder {
        let alertBtn = TripleAlertButtonModel.init(image1:firstButtonImage, image2:secondButtonImage, image3:thirdButtonImage, buttonAction1: firstButtonAction, buttonAction2: secondButtonAction, buttonAction3: thirdButtonAction)
        self.components.append(alertBtn)
        return self
    }
    
    func addImage(image: UIImage? = #imageLiteral(resourceName: "star1")) -> AlertBuilder {
        let alertImage = AlertImageModel.init(image: image)
        self.components.append(alertImage)
        return self
    }
    
    func build() -> [Any]? {
        return self.components
    }
}

