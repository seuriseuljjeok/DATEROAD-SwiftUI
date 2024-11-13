//
//  BannerView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/13/24.
//

import SwiftUI

struct BannerView: View {
    
    @State var bannerData: [BannerModel] = BannerModel.emptyData
    
    @State private var currentIndex: Int = 0
    
    var width: CGFloat
    
    var height: CGFloat
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            TabView(selection: $currentIndex) {
                ForEach(Array(bannerData.enumerated()), id: \.1.advertisementId) { index, data in
                    BannerItemView(
                        data: $bannerData[index],
                        width: width,
                        height: height
                    )
                    .tag(index)
                }
            }
            .frame(width: width, height: height)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Text("\(currentIndex + 1)/\(bannerData.count)")
                .setText(
                    maxWidth: nil,
                    maxHeight: 19,
                    font: .cap_reg_11,
                    textColor: .white000,
                    padding: EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10)
                )
                .background(.gray400)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 22))
        }
        .background(.white000)
        .padding(.top, 8)
    }
}

struct BannerItemView: View {
    
    @Binding var data: BannerModel
    
    var width: CGFloat
    
    var height: CGFloat
    
    var body: some View {
        Image(data.imageUrl)
            .resizable()
            .frame(width: width - 32, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.horizontal, 16)
    }
}
