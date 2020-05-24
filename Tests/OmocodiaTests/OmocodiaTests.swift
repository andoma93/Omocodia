import XCTest
@testable import Omocodia

class OmocodiaTests: XCTestCase {
    
    let mockFiscalCodeRight : String = "RSSMRA90B31B774P"
    let mockFiscalCodeWrongLessLength : String = "RSSMRA90B31B774"
    let mockFiscalCodeWrongMoreLength : String = "RSSMRA90B31B774PA"
    
    func testLength(){
        let sumOfLengths = OmocodiaConstants.Length.name + OmocodiaConstants.Length.surname +
                            OmocodiaConstants.Length.birthYear + OmocodiaConstants.Length.birthMonth +
                            OmocodiaConstants.Length.birthDay + OmocodiaConstants.Length.istatCode +
                            OmocodiaConstants.Length.controlChar
        XCTAssertEqual(sumOfLengths, OmocodiaConstants.Length.fiscalCode)
    }
    
    func testFiscalCodeCorrectLength() {
        XCTAssertNotNil(Omocodia(fiscalCode: mockFiscalCodeRight))
        XCTAssertTrue(OmocodiaUtils.check(fiscalCode: mockFiscalCodeRight))
        XCTAssertNoThrow(try OmocodiaUtils.checkLength(fiscalCode: mockFiscalCodeRight))
    }
    
    func testFiscalCodeLessLength() {
        XCTAssertNil(Omocodia(fiscalCode: mockFiscalCodeWrongLessLength))
        XCTAssertFalse(OmocodiaUtils.check(fiscalCode: mockFiscalCodeWrongLessLength))
        XCTAssertThrowsError(try OmocodiaUtils.checkLength(fiscalCode: mockFiscalCodeWrongLessLength)) { error in
            XCTAssertEqual(error as! OmocodiaError, OmocodiaError.wrongLenght)
        }
    }
    
    func testFiscalCodeMoreLength() {
        XCTAssertNil(Omocodia(fiscalCode: mockFiscalCodeWrongMoreLength))
        XCTAssertFalse(OmocodiaUtils.check(fiscalCode: mockFiscalCodeWrongMoreLength))
        XCTAssertThrowsError(try OmocodiaUtils.checkLength(fiscalCode: mockFiscalCodeWrongMoreLength)) { error in
            XCTAssertEqual(error as! OmocodiaError, OmocodiaError.wrongLenght)
        }
    }

    static var allTests = [
        ("testFiscalCodeCorrectLength", testFiscalCodeCorrectLength),
        ("testFiscalCodeLessLength", testFiscalCodeLessLength),
        ("testFiscalCodeMoreLength", testFiscalCodeMoreLength),
    ]
}
