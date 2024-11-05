//
//  DRWebView.swift
//  DATEROAD-SwiftUI
//
//  Created by 윤희슬 on 10/27/24.
//

import SwiftUI

import WebKit

struct DRWebView: UIViewRepresentable {
    
    let urlString: String
    
    // UIView 생성 및 구성
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    // UIView 업데이트
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}
