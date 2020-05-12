//
//  UIView+Extension.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 12/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedView: UIView {}


extension UIView {
  
  @IBInspectable
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }
}
