//
//  BannerView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/13/24.
//

import SwiftUI

struct BannerView: View {
        
    @State var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    @State var bannerData: [BannerModel] = BannerModel.emptyData
        
    @State private var bannerViewWidth: CGFloat = 0
    
    @State private var contentOffsetX: CGFloat = 0
    
    @State var currentImage: String?

    @State private var currentIndex: Int = 0 {
        didSet {
            handlePageChange()
        }
    }
    
    var width: CGFloat
    
    var height: CGFloat
    
    
    var body: some View {
            ZStack(alignment: .bottomTrailing) {
                scrollBannnerView
                indexView
            }
            .background(.white)
            .padding(.top, 8)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        handleDragGesture(value)
                    }
            )
            .onAppear {
                guard !bannerData.isEmpty else { return }
                currentImage = bannerData[0].imageUrl
                bannerViewWidth = width
                contentOffsetX = -bannerViewWidth
            }
            .onReceive(timer) { _ in
                currentIndex += 1
            }
    }
    
    
    private var scrollBannnerView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                let itemCount = bannerData.count + 1
                ForEach(-1..<itemCount, id: \.self) { index in
                    let adjustedIndex = setInfinityIndex(index)
                    BannerItemView(
                        currentImage: $bannerData[adjustedIndex].imageUrl,
                        width: width,
                        height: height
                    )
                }
                .frame(width: width, height: height)
            }
            .offset(x: contentOffsetX)
        }
        .disabled(true)
    }
    
    private var indexView: some View {
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
    
    
    // Handle page change
    private func handlePageChange() {
        guard !bannerData.isEmpty else { return }
        
        if currentIndex == bannerData.count {
            contentOffsetX = 0
            currentIndex = 0
        } else if currentIndex < 0 {
            contentOffsetX = -bannerViewWidth * CGFloat(bannerData.count+1) + 16 * CGFloat(bannerData
                .count - 1)
            currentIndex = bannerData.count - 1
        }
        
        withAnimation {
            contentOffsetX = -bannerViewWidth * CGFloat(currentIndex+1)
        }
    }
    
    // 무한 스크롤 인덱스 세팅 set
    private func setInfinityIndex(_ index: Int) -> Int {
        if index < 0 {
            return bannerData.count - 1
        } else if index >= bannerData.count {
            return 0
        }
        return index
    }
    
    private func handleDragGesture(_ value: DragGesture.Value) {
        if value.translation.width < 0 {
            currentIndex += 1
        } else if value.translation.width > 0 {
            currentIndex -= 1
        }
        resetTimer()
    }
    
    private func resetTimer() {
        timer.upstream.connect().cancel()
        timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    }
    
}


struct BannerItemView: View {
    
    @Binding var currentImage: String
    
    var width: CGFloat
    
    var height: CGFloat
    
    var body: some View {
        Image(currentImage)
            .resizable()
            .frame(width: width - 32, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.horizontal, 16)
    }
}
