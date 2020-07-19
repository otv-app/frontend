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
    var title: String
    var thumbnailURL: String
    var rawDuration: String
    var rawDate: String
    
    init(id: String, title: String, thumbnailURL: String, rawDuration: String, rawDate: String) {
        self.id = id
        self.title = title
        self.thumbnailURL = thumbnailURL
        self.rawDuration = rawDuration
        self.rawDate = rawDate
    }
    
    func getFormattedDuration() throws -> String {
        if rawDuration.contains("PT") {
            var newDuration = rawDuration
            newDuration.removeLast()
            newDuration.removeFirst(2)
            
            let returnedString = newDuration.replacingOccurrences(of: "M", with: ":")
            return returnedString
        } else {
            throw YoutubeVideoError.notProperlyFormatted
        }
    }
    
    func getHowLongAgo() throws -> String {
        let localDate: Date = self.getLocalDateTime()
        let videoDate: Date = self.getVideoDateTime()
        
        let cal = Calendar.current
        
        let components = cal.dateComponents([.second], from: videoDate, to: localDate)
        let diff = components.second!
        
        if diff < 0 {
            throw YoutubeVideoError.negativeVideoDateTimeDifference
        }
        
        // seconds
        if diff < 60 {
            if diff == 1 {
                return "1 second ago"
            }
            else {
                return "\(diff) seconds ago"
            }
        }
        
        let minutes = diff / 60
        // minutes
        if minutes < 60 {
            if minutes == 1 {
                return "1 minute ago"
            } else {
                return "\(minutes) minutes ago"
            }
        }
        
        let hours = minutes / 60
        // hours
        if hours < 24 {
            if hours == 1 {
                return "1 hour ago"
            } else {
                return "\(hours) hours ago"
            }
        }
        
        let days = hours / 24
        if days < 7 {
            if days == 1 {
                return "1 day ago"
            } else {
                return "\(days) days ago"
            }
        }
        
        let weeks = days / 7
        if weeks < 4 {
            if weeks == 1 {
                return "1 week ago"
            } else {
                return "\(weeks) weeks ago"
            }
        }
        
        let months = weeks/4
        if months < 12 {
            if months == 1 {
                return "1 month ago"
            } else {
                return "\(months) months ago"
            }
        }
        
        let years = months / 12
        if years >= 1 {
            if years == 1 {
                return "1 year ago"
            } else {
                return "\(years) years ago"
            }
        }
        
        throw YoutubeVideoError.shouldntGetHere
    }
    
   
    
    func getLocalDateTime() -> Date {
        let currentDate = Date()
       var calendar = Calendar.current
       
       calendar.timeZone = TimeZone(abbreviation: "UTC")!
       
       let currentYear = calendar.component(.year, from: currentDate)
       let currentMonth = calendar.component(.month, from: currentDate)
       let currentDay = calendar.component(.day, from: currentDate)
       let currentHour = calendar.component(.hour, from: currentDate)
       let currentMinutes = calendar.component(.minute, from:currentDate)
       let currentSeconds = calendar.component(.second, from:currentDate)
        
        var dateComponents = DateComponents()
        dateComponents.year = currentYear
        dateComponents.month = currentMonth
        dateComponents.day = currentDay
        dateComponents.timeZone = TimeZone(abbreviation: "UTC")
        dateComponents.hour = currentHour
        dateComponents.minute = currentMinutes
        dateComponents.second = currentSeconds
        
        let userCalendar = Calendar.current
        let someDateTime = userCalendar.date(from: dateComponents)
        return someDateTime!
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
