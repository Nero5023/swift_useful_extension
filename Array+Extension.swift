//
//  UsefulExtension.swift
//  
//
//  Created by Nero Zuo on 16/3/25.
//
//

import Foundation

extension SequenceType {
  
  func findElement(math: Generator.Element -> Bool) -> Generator.Element? {
    for element in self where math(element) {
      return element
    }
    return nil
  }
  
  public func allMatch(predicate: Generator.Element -> Bool) -> Bool {
    return !self.contains { !predicate($0) }
  }
  
}

extension Array {
  func accumulate<U>(initial: U, combine: (U, Element)->U) -> [U] {
    var running = initial
    return self.map { next in
      running = combine(running, next)
      return running
    }
  }
}

extension SequenceType where Generator.Element: Hashable {
  func unique() -> [Generator.Element] {
    var seen: Set<Generator.Element> = []
    return self.filter {
      if seen.contains($0) {
        return false
      }else {
        seen.insert($0)
        return true
      }
    }
  }
}