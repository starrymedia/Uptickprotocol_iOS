//
//  Condition.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation

public class Condition  {

    var key: String = ""
    var value: String = ""
    var op: String = ""
    
    public init(key: String) {
        self.key = key
    }
 
    public func toString() -> String {
        return self.key + self.op + "'" + self.value + "'";
    }
    
    public func lte(_ value: String) -> Condition {
        return self.fill(value, "<=")
    }
    
    public func gte(_ value: String) -> Condition {
        return self.fill(value, ">=")
    }
    
    public func le(_ value: String) -> Condition {
        return self.fill(value, "<")
    }
    
    public func ge(_ value: String) -> Condition {
        return self.fill(value, ">")
    }
    
    public func eq(_ value: String) -> Condition {
        return self.fill(value, "=")
    }
    
    public func contains(_ value: String) -> Condition {
        return self.fill(value, "CONTAINS")
    }
    
    public func fill(_ value: String, _ op: String) -> Condition {
        self.value = value
        self.op = op
        return self
    }
    
}
