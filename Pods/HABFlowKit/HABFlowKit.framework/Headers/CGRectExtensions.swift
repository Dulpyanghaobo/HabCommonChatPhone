//
//  CGRectExtensions.swift
//  HABFlowKit
//
//  Created by yhb on 2020/11/11.
//

import CoreGraphics

public extension CGRect {
    //    设置X值上限
    mutating func setMaxX(_ value: CGFloat) {
        origin.x = value - width
    }
    //    设置Y值上限
    mutating func setMaxY(_ value: CGFloat) {
        origin.y = value - height
    }
    //    设置宽度
    mutating func setWidth(_ value: CGFloat) {
        self = CGRect.init(x: origin.x, y: origin.y, width: value, height: height)
    }
    //    设置高度
    mutating func setHeight(_ value:CGFloat) {
        self = CGRect.init(x: origin.x, y: origin.y, width: width, height: value)
    }
    //    设置宽度和高度
    mutating func setBound(_ wdith:CGFloat,_ height:CGFloat) {
        self = CGRect.init(x: origin.x, y: origin.y, width: wdith, height: height)
    }
    //    设置中心和大小
    init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(x: center.x - size.width / 2.0, y:center.y - size.height/2.0 )
        self.init(origin: origin, size: size)
    }
    //    设置固定Y轴视图
    init(x: CGFloat,maxY:CGFloat,width: CGFloat,height: CGFloat) {
        self.init(x: x, y: 0, width: width, height: height)
        setMaxX(maxY)
    }
    //    设置固定X轴视图
    init(MaxX: CGFloat,y:CGFloat,width: CGFloat,height: CGFloat) {
        self.init(x: 0, y: y, width: width, height: height)
        setMaxY(maxX)
    }
    //    设置固定X,Y轴视图
    init(MaxX: CGFloat,MaxY:CGFloat,width: CGFloat,height: CGFloat) {
        self.init(x: 0, y: 0, width: width, height: height)
        setMaxY(maxY)
        setMaxX(maxX)
    }
}
