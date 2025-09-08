//
//  Extensions.swift
//  DDMeditation
//
//  Created by joe on 9/8/25.
//

import SwiftUI

extension UIScreen {
    static var current: UIScreen? {
        UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.screen
    }

    static var size: CGSize {
        current?.bounds.size ?? .zero
    }

    static var width: CGFloat {
        size.width
    }

    static var height: CGFloat {
        size.height
    }
}
