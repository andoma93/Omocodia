//
//  File.swift
//  Omocodia
//
//  Created by Monaco Mario on 17/05/2020.
//

public class Omocodia{

    private var fiscalCode : String
    
    init?(fiscalCode inputFiscalCode: String) {
        let normalizedFiscalCode = OmocodiaUtils.normalizeFiscalCode(fiscalCode: inputFiscalCode)
        let checkFiscalCode = OmocodiaUtils.check(fiscalCode: normalizedFiscalCode)
        guard checkFiscalCode else{
            return nil
        }
        self.fiscalCode = normalizedFiscalCode
    }
    
    func getNameCharachters() -> String{
        return OmocodiaUtils.getNameCharachters(fiscalCode: self.fiscalCode)
    }
    
    func getSurnameCharachters() -> String{
        return OmocodiaUtils.getSurnameCharachters(fiscalCode: self.fiscalCode)
    }
    
    func getBirthDate() -> Date?{
        return nil
    }
    
}
