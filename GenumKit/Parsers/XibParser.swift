//
// GenumKit
// Copyright (c) 2016 Keemotion (Ludovic Vannoorenberghe)
// MIT Licence
//

import Foundation

public final class XibParser {
  var nibNames = [String]()

  public init() {}

  @discardableResult
  public func addNibName(name: String) -> Bool {
    if nibNames.contains(name) {
      return false
    } else {
      nibNames.append(name)
      return true
    }
  }

  public func parseDirectory(at path: String) {
    if let dirEnum = FileManager.default.enumerator(atPath: path) {
      while let path = dirEnum.nextObject() as? NSString {
        if path.pathExtension == "xib" {
          let nibName = (path.lastPathComponent as NSString).deletingPathExtension
          self.addNibName(name: nibName)
        }
      }
    }
  }
}
