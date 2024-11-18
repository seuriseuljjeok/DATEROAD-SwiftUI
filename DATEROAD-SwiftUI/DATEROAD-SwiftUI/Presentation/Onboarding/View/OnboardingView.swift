//
//  OnboardingView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/17/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    OnboardingView()
struct OnboardingItem: View {
    
    var data: OnboardingModel
    
    var width: CGFloat = 0
    
    var height: CGFloat = 0
    
    var attributedText: AttributedString {
        
        var string = AttributedString(data.primaryTitle)
        
        let keywords = data.attributedText
        
        for keyword in keywords {
            if let range = string.range(of: keyword) {
                string[range].foregroundColor = Color(.purple600)
            }
        }
        
        return string
    }
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(data.image)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
            infoTitle
                .padding(.bottom, height * 0.161)
        }
    }
    
    private var infoTitle: some View {
        VStack(spacing: 0) {
            Text(attributedText)
                .setText(
                    alignment: .center,
                    font: .title_extra_20,
                    textColor: .gray600,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: height * 0.0123, trailing: 0),
                    lineLimit: 2
                )
            Text(data.secondaryTitle)
                .setText(
                    alignment: .center,
                    font: .body_semi_13,
                    textColor: .gray500,
                    padding: EdgeInsets(top: 0, leading: 0, bottom: height * 0.0074, trailing: 0),
                    lineLimit: 2
                )
            if let thirdTitle = data.thirdTitle {
                Text(thirdTitle)
                    .setText(
                        maxHeight: 15,
                        alignment: .center,
                        font: .cap_reg_11,
                        textColor: .gray400)
            } else {
                Spacer()
                    .frame(height: 15)
            }
        }
        .multilineTextAlignment(.center)
    }
}
