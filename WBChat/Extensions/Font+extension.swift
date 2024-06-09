//
//  Font+extension.swift
//  WBChat
//
//  Created by Максим Шишлов on 09.06.2024.

import SwiftUI

struct CustomFont {
    static func heading1(size: CGFloat = 32) -> Font {
        Font.system(size: size, weight: .bold)
    }
    
    static func heading2(size: CGFloat = 24) -> Font {
        Font.system(size: size, weight: .bold)
    }
    
    static func subheading1(size: CGFloat = 18) -> Font {
        Font.system(size: size, weight: .semibold)
    }
    
    static func subheading2(size: CGFloat = 16) -> Font {
        Font.system(size: size, weight: .semibold)
    }
    
    static func bodyText1(size: CGFloat = 14) -> Font {
        Font.system(size: size, weight: .semibold)
    }
    
    static func bodyText2(size: CGFloat = 14) -> Font {
        Font.system(size: size, weight: .regular)
    }
    
    static func metadata1(size: CGFloat = 12) -> Font {
        Font.system(size: size, weight: .regular)
    }
    
    static func metadata2(size: CGFloat = 10) -> Font {
        Font.system(size: size, weight: .regular)
    }
    
    static func metadata3(size: CGFloat = 10) -> Font {
        Font.system(size: size, weight: .semibold)
    }
}
