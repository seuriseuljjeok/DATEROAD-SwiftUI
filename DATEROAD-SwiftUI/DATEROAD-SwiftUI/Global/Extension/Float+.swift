//
//  Float+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/24/24.
//

import Foundation

extension Float {
    
    func formatFloatTime() -> String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", self)
        } else {
            return String(self)
        }
    }
    
}
