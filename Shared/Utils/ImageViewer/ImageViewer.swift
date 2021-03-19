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
    

    var body: some View {
        ZStack{
            Color.black
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
                            showFullScreen.toggle()
                        }
                }

            }
        }
        
    }
}

