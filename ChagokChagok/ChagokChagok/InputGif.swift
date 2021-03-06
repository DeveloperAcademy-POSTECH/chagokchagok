//
//  InputGif.swift
//  ChagokChagok
//
//  Created by 윤가희 on 2022/06/19.
//
import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: "wheelBtn", withExtension: "gif")!
        let data = try? Data(contentsOf: url)
        webView.load(
            data!,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
}

struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage()
    }
}
