//
//  ViewModifier+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/20/24.
//

import SwiftUI

// 공통 네비게이션 바 스타일 Modifier
struct CustomNavigationBarModifier: ViewModifier {
    
    var hasRightIcon: Bool = false
    
    var hasLeftIcon: Bool = false
    
    var hasLeftTitle: Bool = false
    
    var hasCenterTitle: Bool = false
    
    var title: String = "Default Title"
    
    var leftIconAction: (() -> Void)? = nil
    
    var rightIconAction: (() -> Void)? = nil
    
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline) // 네비게이션 바 제목을 인라인으로 설정
            .toolbar {
                // 좌측 아이콘이 있는 경우
                ToolbarItem(placement: .navigationBarLeading) {
                    if hasLeftIcon {
                        Button(action: {
                            leftIconAction?()
                        }) {
                            Image(.icBack)
                        }
                    }
                }
                
                // 왼쪽 타이틀이 있는 경우
                ToolbarItem(placement: .navigationBarLeading) {
                    if hasLeftTitle {
                        Text(title)
                            .font(.suit(.title_bold_20))
                            .foregroundColor(.black000)
                            .frame(height: 54, alignment: .center)
                    }
                }
                
                // 중앙 타이틀이 있는 경우
                ToolbarItem(placement: .principal) {
                    if hasCenterTitle {
                        Text(title)
                            .font(.suit(.title_bold_18))
                            .foregroundColor(.black000)
                            .frame(minHeight: 54, alignment: .center)
                    }
                }
                
                // 우측 아이콘이 있는 경우
                ToolbarItem(placement: .navigationBarTrailing) {
                    if hasRightIcon {
                        Image(.icPlus)
                            .onTapGesture {
                                rightIconAction?()
                            }
                            .frame(width: 44, height: 30)
                            .background(.purple600)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 20)
                            )
                    }
                }
            }
    }
}

extension View {
    
    func customNavigationBar(
        hasRightIcon: Bool = false,
        hasLeftIcon: Bool = false,
        hasLeftTitle: Bool = false,
        hasCenterTitle: Bool = false,
        title: String = "Default Title",
        leftIconAction: (() -> Void)? = nil,
        rightIconAction: (() -> Void)? = nil
    ) -> some View {
        self.modifier(
            CustomNavigationBarModifier(
                hasRightIcon: hasRightIcon,
                hasLeftIcon: hasLeftIcon,
                hasLeftTitle: hasLeftTitle,
                hasCenterTitle: hasCenterTitle,
                title: title,
                leftIconAction: leftIconAction,
                rightIconAction: rightIconAction
            )
        )
    }
    
}

// 공통 알럿 스타일 modifier
struct CustomAlertModifier: ViewModifier {
    
    @Binding var showAlert: Bool
    
    var alertType: AlertType
    
    var primaryTitle: String
    
    var secondaryTitle: String? = nil
    
    var rightButtonTitle: String? = nil
    
    var leftButtonTitle: String? = nil
    
    var singleButtonTitle: String? = nil
    
    var rightButtonAction: (() -> Void)? = nil
    
    var leftButtonAction: (() -> Void)? = nil
    
    var singleButtonAction: (() -> Void)? = nil
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if showAlert {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                VStack {
                    alertContent()
                }
                .frame(height: 162)
                .background(.white000)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 16)
            }
        }
    }
    
    @ViewBuilder
    private func alertContent() -> some View {
        switch alertType {
        case .SingleButtonWithSingleTitle, .DoubleButtonWithSingleTitle:
            title(title: primaryTitle)
        case .SingleButtonWithDoubleTitle, .DoubleButtonWithDoubleTitle:
            title(title: primaryTitle, padding: EdgeInsets(top: 23, leading: 0, bottom: 5, trailing: 0))
        }
        
        if let secondaryTitle = secondaryTitle {
            title(title: secondaryTitle, font: .body_med_13, padding: EdgeInsets(.zero))
        }
        
        Spacer()
        
        switch alertType {
        case .SingleButtonWithSingleTitle, .SingleButtonWithDoubleTitle:
            actionButton(title: singleButtonTitle ?? "", action: singleButtonAction)
                .padding(EdgeInsets(top: 0, leading: 14, bottom: 14, trailing: 14))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        case .DoubleButtonWithSingleTitle, .DoubleButtonWithDoubleTitle:
            doubleActionButtons()
        }
    }
    
    private func title(title: String, font: FontName = .body_bold_17, padding: EdgeInsets = EdgeInsets(top: 39, leading: 0, bottom: 0, trailing: 0)) -> some View {
        Text(title)
            .setText(
                alignment: .center,
                font: font,
                textColor: .black000,
                padding: padding
            )
    }
    
    private func actionButton(title: String, action: (() -> Void)?, textColor: Color = .black000) -> some View {
        Button(action: {
            action?()
        }) {
            Text(title)
                .setText(
                    alignment: .center,
                    font: .body_bold_15,
                    textColor: textColor
                )
        }
    }
    
    private func doubleActionButtons() -> some View {
        HStack {
            actionButton(
                title: leftButtonTitle ?? "",
                action: leftButtonAction,
                textColor: .gray400
            )
            .frame(width: 152, height: 48)
            .background(.gray100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            actionButton(
                title: rightButtonTitle ?? "",
                action: rightButtonAction,
                textColor: .white000
            )
            .frame(width: 152, height: 48)
            .background(.purple600)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(EdgeInsets(top: 0, leading: 14, bottom: 14, trailing: 14))
    }
    
}

extension View {
    
    func customAlert(
        showAlert: Binding<Bool>,
        alertType: AlertType,
        primaryTitle: String,
        secondaryTitle: String? = nil,
        rightButtonTitle: String? = ALERT.CANCEL,
        leftButtonTitle: String? = nil,
        singleButtonTitle: String? = nil,
        rightButtonAction: (() -> Void)? = nil,
        leftButtonAction: (() -> Void)? = nil,
        singleButtonAction: (() -> Void)? = nil
    ) -> some View {
        self.modifier(
            CustomAlertModifier(
                showAlert: showAlert,
                alertType: alertType,
                primaryTitle: primaryTitle,
                secondaryTitle: secondaryTitle,
                rightButtonTitle: rightButtonTitle,
                leftButtonTitle: leftButtonTitle,
                singleButtonTitle: singleButtonTitle,
                rightButtonAction: rightButtonAction,
                leftButtonAction: leftButtonAction,
                singleButtonAction: singleButtonAction
            )
        )
    }
    
}
