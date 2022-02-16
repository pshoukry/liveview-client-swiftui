//
//  Color.swift
//  PhoenixLiveViewNative
//
//  Created by Shadowfacts on 2/9/22.
//

import SwiftUI

private let colorRegex = try! NSRegularExpression(pattern: "^#[0-9a-f]{6}$", options: .caseInsensitive)

extension Color {
    init?(fromCSSHex string: String) {
        // todo: named colors as well?
        if colorRegex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.utf16.count)) != nil {
            let r = Int(string[string.index(string.startIndex, offsetBy: 1)..<string.index(string.startIndex, offsetBy: 3)], radix: 16)!
            let g = Int(string[string.index(string.startIndex, offsetBy: 3)..<string.index(string.startIndex, offsetBy: 5)], radix: 16)!
            let b = Int(string[string.index(string.startIndex, offsetBy: 5)..<string.index(string.startIndex, offsetBy: 7)], radix: 16)!
            self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
        } else {
            return nil
        }
    }
}