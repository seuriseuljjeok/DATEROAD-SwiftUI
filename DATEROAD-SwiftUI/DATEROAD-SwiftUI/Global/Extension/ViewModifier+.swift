//
//  ViewModifier+.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/20/24.
//

import SwiftUI

// 공통 네비게이션 바 스타일 Modifier
struct CustomNavigationBarModifier: ViewModifier {
    
    var hasIcon: Bool = false
    
    var hasTitle: Bool = true
    
    var title: String = "Default Title"
    
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline) // 네비게이션 바 제목을 인라인으로 설정
            .toolbar {
                // 좌측 아이콘이 있는 경우
                ToolbarItem(placement: .navigationBarLeading) {
                    if hasIcon {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                
                // 왼쪽 타이틀이 있는 경우
                ToolbarItem(placement: .navigationBarLeading) {
                    if hasTitle {
                        Text(title)
                            .font(.suit(.title_bold_20))
                            .foregroundColor(.black000)
                            .frame(height: 54, alignment: .center)
                    }
                }
            }
    }
}

extension View {
    
    func customNavigationBar(hasIcon: Bool = false, hasTitle: Bool = true, title: String = "Default Title") -> some View {
        self.modifier(CustomNavigationBarModifier(hasIcon: hasIcon, hasTitle: hasTitle, title: title))
    }
    
}
