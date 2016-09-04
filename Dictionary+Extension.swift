//
//  Dictionary+Extension.swift
//  
//
//  Created by Nero Zuo on 16/4/29.
//
//

import Foundation

extension Dictionary {
  mutating func merge<S: SequenceType where S.Generator.Element == (Key, Value)>(other: S) {
    for (k, v) in other {
      self[k] = v
    }
  }
  
  init<S: SequenceType where S.Generator.Element == (Key, Value)>(_ sequce: S) {
    self = [:]
    self.merge(sequce)
  }
  
  func mapValues<NewValue>(transform: Value -> NewValue) -> [Key: NewValue] {
    return Dictionary<Key, NewValue>(self.map { (key, value) in
      return (key, transform(value))
      })
  }
}