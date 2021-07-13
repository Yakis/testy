//
//  Testy_Tests.swift
//  Testy Tests
//
//  Created by Mugurel Moscaliuc on 13/07/2021.
//

@testable import Testy
import XCTest

class Testy_Tests: XCTestCase {
    
    
    var validationService: ValidationService!
    
    
    override func setUpWithError() throws {
        super.setUp()
        validationService = ValidationService()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
        validationService = nil
    }
    
    // MARK: Testing user validation
    func test_is_valid_username() throws {
        XCTAssertNoThrow(try validationService.validate(username: "yakismugurakis"))
    }
    
    
    func test_username_is_empty() throws {
        let expectedError = ValidationError.usernameEmpty
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validate(username: "")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    
    func test_username_too_short() throws {
        let expectedError = ValidationError.usernameTooShort
        var error: ValidationError?
        XCTAssertThrowsError(try validationService.validate(username: "ym")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    
    func test_username_too_long() throws {
        let expectedError = ValidationError.usernameTooLong
        var error: ValidationError?
        XCTAssertThrowsError(try validationService.validate(username: "alabalaportocalaanaaremere")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    // MARK: Testing password validation
    func test_is_valid_password() throws {
        XCTAssertNoThrow(try validationService.validate(password: "anaaremere"))
    }
    
    
    func test_password_is_empty() throws {
        let expectedError = ValidationError.passwordEmpty
        var error: ValidationError?
        
        XCTAssertThrowsError(try validationService.validate(password: "")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    
    func test_password_too_short() throws {
        let expectedError = ValidationError.passwordTooShort
        var error: ValidationError?
        XCTAssertThrowsError(try validationService.validate(password: "ana")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    
    func test_password_too_long() throws {
        let expectedError = ValidationError.passwordTooLong
        var error: ValidationError?
        XCTAssertThrowsError(try validationService.validate(password: "alabalaportocalaanaaremere")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    
    
}
