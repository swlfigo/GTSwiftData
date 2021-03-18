//
//  FlashNewsContentUtils.swift
//  GTSwiftData
//
//  Created by Sylar on 2021/3/18.
//

import Foundation


class FlashNewsContentUtils{
    class func handleNewsHtmlContent(content : String?) -> String {
        
        guard let content = content else {
            return ""
        }
        
        var handleStr = NSString.init(string: content)
        handleStr = handleStr.replacingOccurrences(of: "<br/>", with: "\n") as NSString
        handleStr = handleStr.replacingOccurrences(of: "<br />", with: "\n") as NSString
        handleStr = handleStr.replacingOccurrences(of: "<br>", with: "\n") as NSString
        
        let regularE = try?NSRegularExpression(pattern: "<[^>]*>", options: NSRegularExpression.Options(rawValue: 0))
        handleStr = regularE?.stringByReplacingMatches(in: handleStr as String, options: .reportProgress, range: NSMakeRange(0, handleStr.length), withTemplate: "") as NSString? ?? handleStr
        handleStr = handleStr.trimmingCharacters(in: NSCharacterSet.whitespaces) as NSString
        handleStr = handleStr.replacingOccurrences(of: "\n", with: "") as NSString
        return handleStr as String
    }
    
    class func containBold(content : String?) -> Bool {
        guard let content = content else {
            return false
        }
        let handleStr = NSString.init(string: content)
        if handleStr.contains("<b>") {
            return true
        }
        return false
    }
    
    
    class func getCountryFlagDecode(content : String?) -> String {
        let charSet = CharacterSet.urlQueryAllowed as! NSMutableCharacterSet
        charSet.addCharacters(in: "#")
        if let content = content {
            if let  decodeFlagCode = (content as NSString).addingPercentEncoding(withAllowedCharacters: charSet as CharacterSet){
                return "https://cdn.jin10.com/assets/img/commons/flag/\(decodeFlagCode).png"
            }
        }
        return ""
    }
    
    class func compileFlashDataCalendarContent(item:FlashInfoModel?) -> String {
        if let item = item {
            if let country = item.country  , let name = item.name{
                var timeP = ""
                if let time = item.timePeriod{
                    timeP = time
                }
                if let unit = item.unit , unit != "" {
                    return country + timeP + name + "(" + unit + ")"
                }else{
                    return country + timeP + name
                }
            }
        }
        return ""
    }
}
