//
//  HABCGSizeExtension.swift
//  HABFlowKit
//
//  Created by yhb on 2020/11/11.
//
import CoreGraphics
public extension CGSize {
    var aspectRatio: CGFloat {
        guard height != 0 else {
            return 0
        }
        return width / height
    }
    var maxDimension: CGFloat {
        return max(width,height)
    }
    var minDimension: CGFloat {
        return min(width,height)
    }
}
