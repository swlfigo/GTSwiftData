//
//  FlashNewsView.swift
//  GTSwiftData
//
//  Created by Sylar on 2021/3/18.
//

import SwiftUI
import SDWebImageSwiftUI

struct FlashNewsView: View {
    
    var flashModel:FlashModel

    
    @Binding var show : Bool
    @Binding var fullScrenImageURL : URL?
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0){
                HStack {
                    Image("FlashTimeBackgroundImage")
                        .resizable(capInsets: EdgeInsets.init(top: 0, leading: 2, bottom: 0, trailing: 2), resizingMode: .tile)
                        .overlay(
                            Text(flashModel.time ?? "Unknown Time")
                                .font(.system(size: 12))
                                .foregroundColor(Color.init("SkinBlack"))
                        ).frame(width: 135, height: 20, alignment: .center)
                    Spacer()
                }
                .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 10, trailing: 0))
                Text(FlashNewsContentUtils.handleNewsHtmlContent(content: flashModel.data?.content))
                    .if(FlashNewsContentUtils.containBold(content: flashModel.data?.content)){
                        $0.fontWeight(.bold)
                    }
                    .if(flashModel.important == 1, if: {
                        $0.foregroundColor(Color.init("FlashNewsImportColor"))
                    }, else: {
                        $0.foregroundColor(Color.init("SkinBlack"))
                    })
                    .font(.system(size: 14))
                    .lineSpacing(7)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                if let pic = flashModel.data?.pic , let count = pic.count , count > 0{
                    WebImage.init(url: URL.init(string: pic+"/lite"))
                        .resizable()
                        .frame(width: 122, height: 82, alignment: .center)
                        .padding(.top)
                        .onTapGesture {
                            fullScrenImageURL = URL.init(string: pic)!
                            show.toggle()
                        }
                }
                
            }.padding(EdgeInsets.init(top: 0, leading: 10, bottom: 10, trailing: 10))
            
        }
    }
}

