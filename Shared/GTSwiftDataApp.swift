//
//  GTSwiftDataApp.swift
//  Shared
//
//  Created by Sylar on 2021/3/18.
//

import SwiftUI

@main
struct GTSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            FlashListView().frame(minWidth: 400, idealWidth: 500, maxWidth: 610, minHeight: 400, idealHeight: 900, maxHeight: 900, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            #else
            FlashListView()
            #endif
            
        }
    }
}
