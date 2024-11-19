//
//  SplashView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/19/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            ZStack(alignment: .center) {
                Color(.purple600)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                        .frame(height: 210)
                    Image(.icSplashlogo)
                    Spacer()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
