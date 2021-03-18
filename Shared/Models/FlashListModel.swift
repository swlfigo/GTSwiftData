//
//  FlashListModel.swift
//  GTSwiftData
//
//  Created by Sylar on 2021/3/18.
//

import Foundation


// MARK: - Welcome
struct FlashListModel: Codable {
    let status: Int?
    let message: String?
    let data: [FlashModel]?
}

// MARK: - Datum
struct FlashModel: Codable {
    let id, time: String?
    let type: Int?
    let data: FlashInfoModel?
    let important: Int?
    let channel: [Int]?
    let remark: [Remark]?
}



struct Remark: Codable {
    let id: Int?
    let link: String?
    let type, title: String?
}

struct FlashInfoModel: Codable {
    let pic: String?
    let content: String?
    let flag: Int?
    let name: String?
    let star, type: Int?
    let unit: String?
    let actual: Double?
    let affect: Int?
    let country: String?
    let dataID: Int?
    let measure: String?
    let previous, pubTime: String?
    let consensus: String?
    let videoURL: String?
    let timePeriod: String?
    let indicatorID: Int?

    enum CodingKeys: String, CodingKey {
        case pic, content, flag, name, star, type, unit, actual, affect, country
        case dataID = "data_id"
        case measure, previous
        case pubTime = "pub_time"
        case consensus
        case videoURL
        case timePeriod = "time_period"
        case indicatorID = "indicator_id"
    }
}
