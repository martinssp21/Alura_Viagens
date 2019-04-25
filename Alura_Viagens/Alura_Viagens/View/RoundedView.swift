//
//  RoundedView.swift
//  Alura_Viagens
//
//  Created by Rodrigo Martins on 24/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
}
