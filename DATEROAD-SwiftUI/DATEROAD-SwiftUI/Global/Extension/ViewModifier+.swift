//
//  ViewModifier+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/20/24.
//

import SwiftUI

// 공통 네비게이션 바 스타일 Modifier
struct CustomNavigationBarModifier: ViewModifier {
    
    var hasLeftIcon: Bool = false
    
    var hasLeftTitle: Bool = false
    
    var hasCenterTitle: Bool = false
    
    var title: String = "Default Title"
    
    var leftIconAction: (() -> Void)? = nil
    
    
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
                            .frame(maxWidth: .infinity, minHeight: 54, alignment: .center)
                    }
                }
            }
    }
}

extension View {
    
    func customNavigationBar(hasLeftIcon: Bool = false, 
                             hasLeftTitle: Bool = false,
                             hasCenterTitle: Bool = false,
                             title: String = "Default Title",
                             leftIconAction: (() -> Void)? = nil
    ) -> some View {
        self.modifier(CustomNavigationBarModifier(hasLeftIcon: hasLeftIcon,
                                                  hasLeftTitle: hasLeftTitle,
                                                  hasCenterTitle: hasCenterTitle, 
                                                  title: title,
                                                  leftIconAction: leftIconAction))
    }
    
}
