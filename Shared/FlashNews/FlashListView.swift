//
//  FlashListView.swift
//  GTSwiftData
//
//  Created by Sylar on 2021/3/18.
//

import SwiftUI
import Alamofire
struct FlashListView: View {
    
    @State private var models:[FlashModel] = []
    
    @State var show : Bool = false
    @State var fullScreenURL:URL?
    
    var body: some View {
        ZStack {
            List(models,id:\.id){ model in
                if model.type == 0{
                    FlashNewsView(flashModel: model,show: $show, fullScrenImageURL: $fullScreenURL)
                }else if model.type == 1 {
                    FlashDataView(flashModel: model)
                }
                
            }.onAppear(perform: {
                getData()
            })
            if show{
                ImageViewer(imageURL: fullScreenURL, showFullScreen: $show)
                    .edgesIgnoringSafeArea(.all)
            }
            
        }
        
        
    }
    
    
    func getData() -> Void{
        let flashListEndPoint = "https://flash-api.jin10.com/get_flash_list"
        AF.request(flashListEndPoint,parameters: ["channel":-8200], headers: ["x-version":"1.0.0","x-app-id":"g93rhHb9DcDptyPb"]).responseDecodable(of: FlashListModel.self) { (response) in
            guard let flashModels = response.value?.data else {
                return
            }
            models.append(contentsOf: flashModels)
        }
    }
    
}

struct FlashListView_Previews: PreviewProvider {
    static var previews: some View {
        FlashListView()
    }
}
