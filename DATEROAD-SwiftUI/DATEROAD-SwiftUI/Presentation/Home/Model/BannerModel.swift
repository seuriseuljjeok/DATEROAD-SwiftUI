//
//  BannerModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/13/24.
//

import Foundation

struct BannerModel: Equatable {
        
    let advertisementId: Int
    
    var imageUrl: String
    
    init(advertisementId: Int, imageUrl: String) {
        self.advertisementId = advertisementId
        self.imageUrl = imageUrl
    }
    
    static var emptyData: [BannerModel] {
        return [
            BannerModel(advertisementId: 0, imageUrl: "img_banner1"),
            BannerModel(advertisementId: 1, imageUrl: "img_banner2"),
            BannerModel(advertisementId: 2, imageUrl: "img_banner3"),
            BannerModel(advertisementId: 3, imageUrl: "img_banner4"),
            BannerModel(advertisementId: 4, imageUrl: "img_banner5")
        ]
    }
    
}
