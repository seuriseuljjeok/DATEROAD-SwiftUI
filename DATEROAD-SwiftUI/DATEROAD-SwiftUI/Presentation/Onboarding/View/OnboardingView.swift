//
//  OnboardingView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/17/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var onboardingData: [OnboardingModel] = OnboardingModel.onboardingData

    @State private var currentIndex: Int = 0
        
    @State private var navigateToNextView: Bool = false
    
    @State private var width: CGFloat = 0
    
    @State private var height: CGFloat = 0
    
    @State private var dragOffset: CGFloat = 0
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    Color(.purple600)
                    TabView(selection: $currentIndex) {
                        ForEach(Array(onboardingData.enumerated()), id: \.element.image) { index, data in
                            OnboardingItem(
                                data: data,
                                width: width,
                                height: height
                            )
                            .ignoresSafeArea(edges: [.top, .horizontal])
                            .tag(index)
                            .gesture(
                                DragGesture(minimumDistance: 10)
                                    .onChanged { value in
                                        dragOffset = value.translation.width
                                    }
                                    .onEnded { value in
                                        if dragOffset < -width / 4 && currentIndex < 2 {
                                            withAnimation {
                                                currentIndex += 1
                                            }
                                        } else if dragOffset > width / 4 && currentIndex > 0 {
                                            withAnimation {
                                                currentIndex -= 1
                                            }
                                        } else if dragOffset < 0 && currentIndex == 2 {
                                            navigateToNextView = true
                                        }
                                        dragOffset = 0
                                    }
                                )
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    customIndicator
                        .padding(.bottom, height * 0.03)
                    bottomButton
                        .padding(.bottom, height * 0.069)
                    NavigationLink(
                        destination: ProfileView().navigationBarBackButtonHidden(),
                        isActive: $navigateToNextView,
                        label: { EmptyView() }
                    )
                    .hidden()
                }
                .onAppear {
                    width = geometry.size.width
                    height = geometry.size.height
                }
            }
            .ignoresSafeArea(edges: [.top, .horizontal])
        }
    }
    
    private var customIndicator: some View {
        HStack(spacing: 10) {
            ForEach(0..<3, id: \.self) { indicator in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(currentIndex == indicator ? .purple600 : .gray200)
            }
        }
    }
    
    private var bottomButton: some View {
        Button(action: {
            if currentIndex < 2 {
                withAnimation(.easeInOut) {
                    currentIndex += 1
                }
            } else {
                navigateToNextView = true
            }
        }) {
            Text(onboardingData[currentIndex].buttonTitle)
                .setText(
                    alignment: .center,
                    font: .body_bold_15,
                    textColor: .white000
                )
        }
        .frame(height: 54)
        .background(.purple600)
        .clipShape(RoundedRectangle(cornerRadius: 29))
        .padding(.horizontal, 66)
    }
    
    private func goToNextView() {
        if currentIndex == 2 {
            navigateToNextView = true
        }
    }
}

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
