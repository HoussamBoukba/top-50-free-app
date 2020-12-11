//
//  article.swift
//  news
//
//  Created by Houssam on 12/2/20.
//

import SwiftUI
import WebKit
struct article: View {
    let urlst : String
    
    var body: some View {
        webview(urlstring: urlst)
        
    }
}
struct article_Previews: PreviewProvider {
    static var previews: some View {
        article(urlst: "www.google.com")
    }
}
struct webview : UIViewRepresentable {
    var urlstring : String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let url = URL(string: urlstring){
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
