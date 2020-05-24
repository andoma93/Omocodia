//
//  OmocodiaUtils.swift
//  Omocodia
//
//  Created by Monaco Mario on 17/05/2020.
//

import Foundation

public class OmocodiaUtils{
    
    static func check(fiscalCode: String) -> Bool{
        do{
             let normalizedFiscalCode = OmocodiaUtils.normalizeFiscalCode(fiscalCode: fiscalCode)
            try checkLength(fiscalCode: normalizedFiscalCode)
            try checkBirthDate(fiscalCode: normalizedFiscalCode)
            // TODO: Insert here other checks
        }catch (let _){
            return false
        }
        return true
    }
    
    static func checkLength(fiscalCode: String) throws{
        let normalizedFiscalCode = OmocodiaUtils.normalizeFiscalCode(fiscalCode: fiscalCode)
        guard normalizedFiscalCode.count == OmocodiaConstants.Length.fiscalCode else{
            throw OmocodiaError.wrongLenght
        }
    }
    
    static func checkBirthDate(fiscalCode: String) throws{
        let normalizedFiscalCode = OmocodiaUtils.normalizeFiscalCode(fiscalCode: fiscalCode)
        guard let _ = getBirthDate(fiscalCode: normalizedFiscalCode) else{
            throw OmocodiaError.wrongBirthDate
        }
    }
    
    static func getMonthLetter(fiscalCode: String) -> String{
        return fiscalCode.substring(from: 8, to: 8)
    }
    
    static func getYearLetters(fiscalCode: String) -> String{
        return fiscalCode.substring(from: 6, to: 7)
    }
    
    static func getDayLetters(fiscalCode: String) -> String{
        return fiscalCode.substring(from: 9, to: 10)
    }
    
    static func getNameCharachters(fiscalCode: String) -> String{
        // TODO
        return ""
    }
    
    static func getSurnameCharachters(fiscalCode: String) -> String{
        // TODO
        return ""
    }
    
    static func getBirthDate(fiscalCode: String) -> Date?{
        guard let month = getMonthFromLetter(letter: getMonthLetter(fiscalCode: fiscalCode)) else { return nil }
        let yearString = getYearLetters(fiscalCode: fiscalCode)
        
        let yearCurrentCenturyString = "\(OmocodiaConstants.Century.current)\(yearString)"
        let yearPastCenturyString = "\(OmocodiaConstants.Century.past)\(yearString)"
        
        guard let yearCurrentCentury = Int(yearCurrentCenturyString) else { return nil }
        guard let yearPastCentury = Int(yearPastCenturyString) else { return nil }
        
        let dayString = getDayLetters(fiscalCode: fiscalCode)
        guard var day = Int(dayString) else { return nil }
        
        if day > OmocodiaConstants.womenAddedValue { day = day - OmocodiaConstants.womenAddedValue }
        
        if day > 31 && day <= OmocodiaConstants.womenAddedValue { return nil }
        
        let currentDate = Date()
        
        let ipoteticDateCurrentCentury = Date.from(day: day, month: month, year: yearCurrentCentury)
        let ipoteticDatePastCentury = Date.from(day: day, month: month, year: yearPastCentury)
        
        if let ipoteticDateCurrentCentury = ipoteticDateCurrentCentury{
            if ipoteticDateCurrentCentury > currentDate{
                return ipoteticDatePastCentury
            }
            return ipoteticDateCurrentCentury
        }
        
        return ipoteticDatePastCentury
    }
    
    static func getMonthFromLetter(letter: String) -> Int?{
        let monthCode = ["A":1, "B":2, "C":3, "D":4, "E":5, "H":6, "L":7, "M":8, "P":9, "R":10, "S":11, "T":12]
        return monthCode[letter.uppercased()]
    }
    
    static func normalizeFiscalCode(fiscalCode: String) -> String{
        return fiscalCode.uppercased()
    }
    
}
