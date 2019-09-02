import Foundation
import UIKit

/// 奔溃的方法
///
/// - Parameter l: 标记
public func crash(_ l:String){
    assert(false, l)
}

// l : lable 自定义标识
// f : func 函数
public func measure(_ l:String, f: ()->()) {
    let start = CACurrentMediaTime()
    f()
    let end = CACurrentMediaTime()
    print("\(l)：\(end - start)秒")
}

/// 测量时间
///
/// - Parameter f: label 标记的作用
public func measure(f: ()->()) {
    let start = CACurrentMediaTime()
    f()
    let end = CACurrentMediaTime()
    print("花费时间：\(end - start)秒")
}


public enum LogType : String {
    case `default`  = ""
    case error      = "❌❌❌"
    case success    = "🎉🎉🎉"
    case warn       = "⚠️⚠️⚠️"
}

public func DLog<T>(_ message : T,type : LogType = .default,fileName : String = #file,methodName : String = #function,lineNumber : Int = #line) {
    #if DEBUG
    let logString : String = (fileName as NSString).pathComponents.last!.replacingOccurrences(of: "swift", with: "")
    print("---------------------------------------")
    print("\(type.rawValue)文件:\(logString) \n方法:\(methodName) \n行数:\(lineNumber) \n数据:\(message) \n")
    #endif
}


/*
 文件作用: 结构化打印model数据
 使用方式: 直接遵循协议即可,比如
 struct Item : Decodable,ModleDescription{
 var archive_url : String
 var archived : Bool
 var assignees_url : String
 }
 
 打印如下
 Item :
 - archive_url = https://api.github.com/repos/zestyping/q/{archive_format}{/ref}
 - archived = false
 - assignees_url = https://api.github.com/repos/zestyping/q/assignees{/user}
 */
public protocol ModleDescription : CustomStringConvertible,CustomDebugStringConvertible {}

extension ModleDescription {
    var debugDescription: String {
        // 获取 类/结构体 名称
        let name = String(describing: type(of: self))
        let mirror = Mirror(reflecting: self)
        // 描述
        var des = "\(name) : \n"
        for children in mirror.children {
            guard let label = children.label else {
                continue
            }
            let value = children.value
            des += " - \(label) = \(value) \n"
        }
        des += "\n"
        
        return des
    }
    
    var description: String {
        return debugDescription
    }
}

