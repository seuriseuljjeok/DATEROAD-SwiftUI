//
//  DRChipView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 11/5/24.
//

import SwiftUI

struct ChipLayoutView<ChipView: View, T: Identifiable>: View {
    
    @Binding var tagData: [T]
    
    let verticalSpacing: CGFloat
    
    let horizontalSpacing: CGFloat
    
    @ViewBuilder let chipView: (Int) -> ChipView
    
    var body: some View {
        
        var width: CGFloat = .zero
        
        var height: CGFloat = .zero
        
        return GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                ForEach(tagData.indices, id: \.self) { index in
                    let chipsData = tagData[index]
                    chipView(index)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(width - dimension.width) > geo.size.width) {
                                width = 0
                                height -= dimension.height
                                height -= verticalSpacing
                            }
                            
                            let result = width
                            if chipsData.id == tagData.last!.id {
                                width = 0
                            } else {
                                width -= horizontalSpacing
                                width -= dimension.width
                            }
                            return result
                        }
                        .alignmentGuide(.top) { dimension in
                            let result = height
                            if index == tagData.count - 1 {
                                height = 0
                            }
                            return result
                        }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
