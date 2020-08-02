//
//  Video.swift
//  OTVModel
//
//  Created by Patrick Yoon on 6/26/20.
//  Copyright © 2020 Patrick Yoon. All rights reserved.
//
import Foundation
class YoutubeVideo: Identifiable {
    var id: String
    var url: String
    var title: String
    var thumbnailURL: String
    var rawDuration: String
    var rawDate: String
    var howLongAgo: String?
    var formattedDuration: String?
    
    init(id: String, title: String, thumbnailURL: String, rawDuration: String, rawDate: String) {
        self.id = id
        self.title = title
        self.thumbnailURL = thumbnailURL
        self.rawDuration = rawDuration
        self.rawDate = rawDate
        
        self.url = "https://www.youtube.com/watch?v=" + self.id
        
        if(self.rawDate.contains("T")) {
            self.howLongAgo = try? self.getHowLongAgo()
        }
        try? self.formattedDuration = self.getFormattedDuration()
    }
    
    func getFormattedDuration() throws -> String {
        if rawDuration.contains("PT") {
            
            let durationDateComp = DateUtility.durationFrom8601String(durationString: self.rawDuration)
            
            print(durationDateComp)
            
            let tempDay = durationDateComp.day
            let tempHour = durationDateComp.hour
            let tempMinute = durationDateComp.minute
            let tempSecond = durationDateComp.second
            
            var returnedString = ""
            
            if tempDay != nil {
                returnedString += String(tempDay!) + ":"
            }
            
            if tempHour != nil {
                if tempHour! < 10 && tempDay != nil {
                    returnedString += "0" + String(tempHour!) + ":"
                } else {
                    returnedString += String(tempHour!) + ":"
                }
            } else if tempHour == nil && tempDay != nil {
                returnedString += "00:"
            }
            
            if tempMinute != nil {
                if tempMinute! < 10 && (tempHour != nil || tempDay != nil) {
                    returnedString += "0" + String(tempMinute!) + ":"
                } else {
                    returnedString += String(tempMinute!) + ":"
                }
            } else if tempMinute == nil && tempHour == nil && tempMinute == nil {
                returnedString += "0:"
            } else if tempMinute == nil && (tempHour != nil || tempMinute != nil) {
                returnedString += "00:"
            }
            
            if tempSecond != nil {
                if tempSecond! < 10 {
                    returnedString += "0" + String(tempSecond!)
                } else {
                    returnedString += String(tempSecond!)
                }
            } else {
                returnedString += "00"
            }
            
            return returnedString
        } else {
            throw YoutubeVideoError.notProperlyFormatted
        }
    }
    
    func getHowLongAgo() throws -> String {
        let videoDate: Date = self.getVideoDateTime()
        
        return try Utility.getHowLongAgoDates(date1: videoDate, date2: Utility.getUTCDateTime(currentDate: Date()))
    }
    
    
    func getVideoDateTime() -> Date {
        let firstHalf = self.rawDate.components(separatedBy: "T")[0]
        var secondHalf = self.rawDate.components(separatedBy: "T")[1]
        
        let dateFormat = firstHalf.components(separatedBy: "-")
        let year: Int = Int(dateFormat[0])!
        let month: Int = Int(dateFormat[1])!
        let day: Int = Int(dateFormat[2])!
        
        secondHalf.removeLast()
        let timeFormat = secondHalf.components(separatedBy: ":")
        let hour: Int = Int(timeFormat[0])!
        let minute: Int = Int(timeFormat[1])!
        let second: Int = Int(timeFormat[2])!
    
        var dateComponents = DateComponents()
       dateComponents.year = year
       dateComponents.month = month
       dateComponents.day = day
       dateComponents.timeZone = TimeZone(abbreviation: "UTC")
       dateComponents.hour = hour
       dateComponents.minute = minute
       dateComponents.second = second
       
       let userCalendar = Calendar.current
       let someDateTime = userCalendar.date(from: dateComponents)
       return someDateTime!
    }
    
    enum YoutubeVideoError: Error {
        case negativeVideoDateTimeDifference
        case shouldntGetHere
        case notProperlyFormatted
    }
}
