//
//  HomeView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/9/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(.purple600)
                .frame(width: .infinity, height: 400)
                .ignoresSafeArea()
            GeometryReader { geometry in
                let width = geometry.size.width // 좌우 여백 제외
                let height = width * 0.385
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        TopUserInfoView()
                        HotDateCourseView().offset(x: 0, y: -21)
                        BannerView(width: width, height: height)
                        NewDateCourseView()
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                    .background(.white000)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
