//
//  PointSystemModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/21/24.
//

import SwiftUI

struct PointSystemModel: Hashable {
    
    let illustration: String
    
    let mainTitle: String
    
    let subTitle: String
    
    init(illustration: String, mainTitle: String, subTitle: String) {
        self.illustration = illustration
        self.mainTitle = mainTitle
        self.subTitle = subTitle
    }
    
    static var pointSystemData: [PointSystemModel] =  {
        return [PointSystemModel(illustration: "img_point1",
                                 mainTitle: POINTSYSTEM.FIRSTMAINSYSTEM,
                                 subTitle: POINTSYSTEM.FIRSTSUBSYSTEM),
                PointSystemModel(illustration: "img_point2",
                                 mainTitle: POINTSYSTEM.SECONDMAINSYSTEM,
                                 subTitle: POINTSYSTEM.SECONDSUBSYSTEM),
                PointSystemModel(illustration: "img_point3",
                                 mainTitle: POINTSYSTEM.THIRDMAINSYSTEM,
                                 subTitle: POINTSYSTEM.THIRDSUBSYSTEM),
                PointSystemModel(illustration: "img_point4",
                                 mainTitle: POINTSYSTEM.FOURTHMAINSYSTEM,
                                 subTitle: POINTSYSTEM.FOURTHSUBSYSTEM)]
    }()
    
}
