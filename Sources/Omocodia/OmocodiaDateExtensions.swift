//
//  OmocodiaDateExtensions.swift
//  Omocodia
//
//  Created by Monaco Mario on 17/05/2020.
//

import Foundation

extension Date{
    
    static func from(day: Int, month: Int, year: Int) -> Date?{
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        let userCalendar = Calendar.current
        return userCalendar.date(from: dateComponents)
    }
    
    func year() -> Int{
        return Calendar.current.component(.year, from: self)
    }
    
    func month() -> Int{
        return Calendar.current.component(.month, from: self)
    }
    
    func day() -> Int{
        return Calendar.current.component(.day, from: self)
    }
    
}
