//
//  EventQueryBuilder.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation

public class EventQueryBuilder  {
    
    var conditions: [Condition] = []
    
    public func addCondition(condition: Condition) -> EventQueryBuilder {
        if condition != nil {
            self.conditions.append(condition)
        }
        return self
    }
    
    public func build() -> String {
        var query = ""
        for i in 0..<conditions.count {
            
            if i > 0 {
                query = query + " AND "
            }
            var condition = conditions[i]
            query = query + condition.toString()
        }
        return query
    }

    

}
