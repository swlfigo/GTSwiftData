//
//  FlashDataView.swift
//  GTSwiftData
//
//  Created by Sylar on 2021/3/18.
//

import SwiftUI
import SDWebImageSwiftUI
struct FlashDataView: View {
    
    var flashModel:FlashModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack {
                Image("FlashTimeBackgroundImage")
                    .resizable(capInsets: EdgeInsets.init(top: 0, leading: 2, bottom: 0, trailing: 2), resizingMode: /*@START_MENU_TOKEN@*/.stretch/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Text(flashModel.time ?? "Unknown Time")
                            .font(.system(size: 13))
                            .foregroundColor(Color.init("SkinBlack"))
                    ).frame(width: 135, height: 20, alignment: .center)
                Spacer()
            }
            .padding(EdgeInsets.init(top: 5, leading: 0, bottom: 10, trailing: 0))
            
            HStack{
                Text(FlashNewsContentUtils.compileFlashDataCalendarContent(item: flashModel.data))
                    .font(.system(size: 14))
                    .foregroundColor(Color.init("SkinBlack"))
                Spacer()
                if let pic = flashModel.data?.country{
                    WebImage.init(url: URL.init(string: FlashNewsContentUtils.getCountryFlagDecode(content: pic)))
                    .resizable()
                    .frame(width: 30, height: 20, alignment: .center)
                }
            }
            HStack {
                if let previous = flashModel.data?.previous {
                    Text("前值: " +  previous )
                        .foregroundColor(Color.init("SkinBlack"))
                        .font(.system(size: 10))
                }else{
                    Text("前值: --"  )
                        .foregroundColor(Color.init("SkinBlack"))
                        .font(.system(size: 10))
                }
                Spacer()
                if let consensus = flashModel.data?.consensus {
                    Text("预期: " +  consensus )
                        .foregroundColor(Color.init("SkinBlack"))
                        .font(.system(size: 10))
                }else{
                    Text("预期: --"  )
                        .foregroundColor(Color.init("SkinBlack"))
                        .font(.system(size: 10))
                }
                Spacer()
                if let actual = flashModel.data?.actual {
                    Text("公布: " +  String(actual) )
                        .foregroundColor(Color.init("SkinBlack"))
                        .font(.system(size: 10))
                }else{
                    Text("公布: --"  )
                        .foregroundColor(Color.init("SkinBlack"))
                        .font(.system(size: 10))
                }
            }
            .padding(.top)
            HStack(spacing:1){
                ForEach(0..<5){ index in
                    if index < flashModel.data?.star ?? 5{
                        if flashModel.data?.star ?? 0 > 2 {
                            Image("FlashCalendarRedStar")
                                .frame(width: 12, height: 12, alignment: .center)
                        }else{
                            Image("FlashCalendarYellowStar")
                                .frame(width: 12, height: 12, alignment: .center)
                        }
                    }else{
                        Image("FlashCalendarEmptyStar")
                            .frame(width: 12, height: 12, alignment: .center)
                    }
                    
                }
            }
            .padding(.top)
            
            
        }.padding(EdgeInsets.init(top: 0, leading: 10, bottom: 10, trailing: 10))
        
    }
}


