//
//  Array+ZSExtension.swift
//  zhuishushenqi
//
//  Created by caonongyun on 2018/7/4.
//  Copyright © 2018年 QS. All rights reserved.
//

import Foundation

extension Array {
    public func find <T: Equatable> (array: [T], item : T) ->Int? {
        var index = 0
        while(index < array.count) {
            if(item == array[index]) {
                return index
            }
            index = index + 1
        }
        return nil
    }
    
    // 去重
    public func filterDuplicates<E: Equatable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        for value in self {
            let key = filter(value)
            if !result.map({filter($0)}).contains(key) {
                result.append(value)
            }
        }
        return result
    }
    
    public subscript (safe index:Int) -> Element? {
        return (0..<count).contains(index) ? self[index]:nil
    }
}

extension Collection where Index:Comparable {
    public subscript (safe index:Index) ->Element? {
        guard startIndex <= index && index < endIndex else {
            return nil
        }
        return self[index]
    }
}


