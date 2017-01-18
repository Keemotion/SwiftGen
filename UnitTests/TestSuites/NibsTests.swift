//
// SwiftGen
// Copyright (c) 2016 Keemotion - Ludovic Vannoorenberghe
// MIT Licence
//

import XCTest
import GenumKit


class NibsTests: XCTestCase {
  
  func testFileWithDefaults() {
    let parser = XibParser()
    let template = GenumTemplate(templateString: Fixtures.string(for: "nibs-default.stencil"), environment: genumEnvironment())
    let result = try! template.render(parser.stencilContext())
    
    let expected = Fixtures.string(for: "Nibs-Default.swift.out")
    XCTDiffStrings(result, expected)
  }
  
  func testFileWithSwift3() {
    let parser = XibParser()
    let template = GenumTemplate(templateString: Fixtures.string(for: "nibs-swift3.stencil"), environment: genumEnvironment())
    let result = try! template.render(parser.stencilContext())
    
    let expected = Fixtures.string(for: "Nibs-Swift3.swift.out")
    XCTDiffStrings(result, expected)
  }
  
}
