# DebugTools

### Debug 时候的一些工具

不同类型的打印


![Xcode打印](%E6%88%AA%E5%B1%8F2019-09-02%E4%B8%8B%E5%8D%882.40.26.png)


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
