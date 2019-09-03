# DebugTools

### Debug 时候的一些工具

不同类型的打印


![Xcode打印](http://lessimore.cn/SwiftPM/SwiftPM--DebugTools.png)


成功
```swift
DLog("success", type: .success)
```
错误
```swift
DLog("error", type: .error)
```
信息
```swift
DLog("info", type: .info)
```
警告
```swift
DLog("warn", type: .warn)
```

```swift
measure {
    DLog("测量代码的运行时间")
}
```

```swift
measure("标记") {
    DLog("测量代码的运行时间,并添加一个标记来区分")
}
```

结构化打印数据

