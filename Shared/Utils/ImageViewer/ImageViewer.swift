//
//  ImageViewer.swift
//  GTSwiftData
//
//  Created by Sylar on 2021/3/19.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageViewer: View {
    
    @State var imageURL : URL?
    @Binding var showFullScreen : Bool
    
    @State private var viewState = CGSize.zero
    
    @State private var blurRadius : CGFloat = 20.0
    var body: some View {
        ZStack{
            Color.white
                .blur(radius: blurRadius)
            if let url = imageURL {
                ScrollView{
                    WebImage.init(url: url)
                        .onSuccess { image, data, cacheType in
                            // Success
                            // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                        }
                        .resizable()
                        .scaledToFit()
                        .transition(.fade(duration: 0.5))
                        .onTapGesture {
                            blurRadius = 0
                            showFullScreen.toggle()
                        }
                        .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0))
                    
                }
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

