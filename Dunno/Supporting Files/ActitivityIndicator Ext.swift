//
//  Actitivity Indicator.swift
//  Dunno
//
//  Created by Misha Kuznecov on 13/01/2021.
//

import UIKit

extension UIActivityIndicatorView {
    func show(_ shown: Bool) {
        isHidden = !shown
        if shown {
            startAnimating()
        } else {
            stopAnimating()
        }
    }
}
