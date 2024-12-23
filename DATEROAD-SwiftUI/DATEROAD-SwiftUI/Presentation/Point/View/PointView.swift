//
//  PointView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 12/23/24.
//

import SwiftUI

struct PointView: View {
    
    // MARK: - Property
    
    var info: PointInfoModel
    
    var segment: [String] = [POINT.GAINED_HISTORY, POINT.USED_HISTORY]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var gainedData: [PointHistoryModel] = PointHistoryModel.dummyGainedData
    
    @State private var usedData: [PointHistoryModel] = PointHistoryModel.dummyUsedData

    @State var selectedSegment: Int = 0
    
    @State var segmentOffset: CGFloat = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color(.white000)
                .ignoresSafeArea()
            VStack {
                PointInfoView
                    .padding(EdgeInsets(top: 21, leading: 16, bottom: 20, trailing: 16))
                PointHistorySegmentView
                Color(.gray300)
                    .frame(height: 1)
                    .overlay(alignment:.bottomLeading) {
                        Color(.black000)
                            .frame(width: UIScreen.main.bounds.width / 2, height: 2)
                            .offset(x: segmentOffset, y: 0)
                    }
                PointHistoryView
            }
            
        }
        .customNavigationBar(
            hasLeftIcon: true,
            hasCenterTitle: true ,
            title: POINT.POINT_HISTORY,
            leftIconAction: {
                presentationMode.wrappedValue.dismiss()
            }
        )
    }
    
    
    // MARK: - SubView
    
    private var PointInfoView: some View {
        VStack(alignment: .leading, spacing: 11) {
            Text(info.nickname + " 님의 포인트")
                .setText(
                    font: .body_med_13,
                    textColor: .white000,
                    padding: EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0)
                )
            Text("\(info.point) P")
                .setText(
                    font: .title_extra_24,
                    textColor: .white000,
                    padding: EdgeInsets(top: 0, leading: 16, bottom: 14, trailing: 0)
                )
        }
        .frame(height: 90)
        .background(.purple600)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
    private var PointHistorySegmentView: some View {
        HStack(spacing: 0) {
            ForEach(segment.indices, id: \.self) { index in
                Button(action: {
                    print(index)
                    selectedSegment = index
                    segmentOffset = UIScreen.main.bounds.width / 2 * CGFloat(selectedSegment)
                }) {
                    Text(segment[index])
                        .setText(
                            alignment: .center,
                            font: .body_bold_17,
                            textColor: selectedSegment == index ? .black000 : .gray300
                        )
                }
            }
            .tag(selectedSegment)
        }
        .frame(height: 54)
    }
    
    private var PointHistoryView: some View {
        List(selectedSegment == 0 ? gainedData : usedData, id: \.self) { data in
            HStack(alignment: .top, spacing: 42) {
                Text((selectedSegment == 0 ? "+" : "-") + " \(data.point)P")
                    .setText(
                        maxWidth: 50,
                        maxHeight: .infinity,
                        alignment: .top,
                        font: .body_bold_15,
                        padding: EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 0)
                    )
                VStack {
                    Text(data.description)
                        .setText(font: .body_bold_15, padding: EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 25))
                    Spacer()
                    Text(data.createdAt)
                        .setText(font: .body_med_15, textColor: .gray500, padding: EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 25))
                }
            }
            .frame(height: 86)
            .listRowInsets(.none)
            .listRowSeparator(.hidden)
            .overlay(alignment: .bottom) {
                Color(.gray100)
                    .frame(height: 1)
            }
        }
        .listStyle(.inset)
        
    }
    
}

struct PointView_Preview: PreviewProvider {
    static var previews: some View {
        return PointView(info: PointInfoModel(nickname: "희슬", point: 100000))
    }
}
