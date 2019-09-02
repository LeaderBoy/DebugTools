import XCTest
@testable import DebugTools

final class DebugToolsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        DLog("success", type: .success)
        
        DLog("error", type: .error)
        
        measure {
            DLog("测量代码的运行时间")
        }
        
        DebugTools.measure("标记") {
            DLog("测量代码的运行时间,并添加一个标记来区分")
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
