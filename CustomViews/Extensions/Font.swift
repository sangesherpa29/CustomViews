//
//  Font.swift
//  CustomViews
//
//  Created by Web and App on 22/01/2024.
//

import Foundation
import SwiftUI

extension Font {
    static func raleway_bold(size: CGFloat) -> Font {
        .custom("Raleway-Bold", size: size)
    }
    static func raleway_semibold(size: CGFloat) -> Font {
        .custom("Raleway-SemiBold", size: size)
    }
    static func raleway_medium(size: CGFloat) -> Font {
        .custom("Raleway-Medium", size: size)
    }
    static func raleway_regular(size: CGFloat) -> Font {
        .custom("Raleway-Regular", size: size)
    }
    static func raleway_light(size: CGFloat) -> Font {
        .custom("Raleway-Light", size: size)
    }
}
