//
//  OnboardingModel.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/17/24.
//

import Foundation

struct OnboardingModel {
    
    let image: String
    
    let primaryTitle: String
    
    let secondaryTitle: String
    
    let thirdTitle: String?
    
    let buttonTitle: String
    
    let attributedText: [String]
    
    init(image: String, primaryTitle: String, secondaryTitle: String, thirdTitle: String?, buttonTitle: String, attributedText: [String]) {
        self.image = image
        self.primaryTitle = primaryTitle
        self.secondaryTitle = secondaryTitle
        self.thirdTitle = thirdTitle
        self.buttonTitle = buttonTitle
        self.attributedText = attributedText
    }
    
    static var onboardingData: [OnboardingModel] {
        return [
            OnboardingModel(
                image: "img_first_onboarding",
                primaryTitle: "데이트로드는 포인트로\n데이트 코스를 열람할 수 있어요",
                secondaryTitle: "최초 3회 무료 찬스로\n다른 사람의 데이트 코스를 구경하세요!",
                thirdTitle: "(이후에는 50포인트로 코스를 열람할 수 있어요)",
                buttonTitle: "다음",
                attributedText: ["포인트", "데이트 코스"]
            ),
            OnboardingModel(
                image: "img_second_onboarding",
                primaryTitle: "데이트 코스를 등록하면\n100 포인트를 얻을 수 있어요",
                secondaryTitle: "내 연인과 함께한 데이트 코스를 자랑하고 포인트를 받아보세요",
                thirdTitle: nil,
                buttonTitle: "다음",
                attributedText: ["100 포인트"]
            ),
            OnboardingModel(
                image: "img_third_onboarding",
                primaryTitle: "쌓인 포인트로\n다양한 데이트 코스를 둘러보세요",
                secondaryTitle: "모인 포인트는 데이트 장소를 예약할 때\n현금처럼 사용 가능해요",
                thirdTitle: "(추후 제공될 기능이에요)",
                buttonTitle: "프로필 생성하기",
                attributedText: ["다양한 데이트 코스"]
            )
        ]
    }
}
