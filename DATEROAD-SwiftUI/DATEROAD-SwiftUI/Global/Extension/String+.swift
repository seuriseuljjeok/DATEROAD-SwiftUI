//
//  String+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/10/24.
//

import Foundation

extension String {
    
    // 2023.07.18 -> JULY 18 함수
    
    func toReadableDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = dateFormatter.date(from: self) else { return nil }
        
        let readableDateFormatter = DateFormatter()
        readableDateFormatter.dateFormat = "MMMM\ndd"
        readableDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return readableDateFormatter.string(from: date).uppercased()
    }
    
}
