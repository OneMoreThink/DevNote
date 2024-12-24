//
//  RxSwiftTests.swift
//  DevNote
//
//  Created by 이종선 on 12/24/24.
//

import XCTest
import RxSwift
import RxBlocking
import RxTest

class RxSwiftTests: XCTestCase {
    func testRxSwiftInstallation() throws {
        // 단일 값 방출
        let observable = Observable.just("Test")
        // 해당 observable 객체가 첫번째 값을 방출할 때까지 현재 쓰레드 block
        let result = try observable.toBlocking().first()
        XCTAssertEqual(result, "Test")
        
    }
}
