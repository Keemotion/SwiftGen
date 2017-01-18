//
// SwiftGen
// Copyright (c) 2016 Keemotion (Ludovic Vannoorenberghe)
// MIT Licence
//

import Commander
import PathKit
import GenumKit

let nibsCommand = command(
  outputOption,
  templateOption(prefix: "nibs"), templatePathOption,
  Option<String>("enumName", "Nib", flag: "e", description: "The name of the enum to generate"),
  Argument<Path>(
    "PATH",
    description: "Directory to scan for .xib files. Can also be a path to a single .xib",
    validator: pathExists
  )) { output, templateName, templatePath, enumName, path in
    let parser = XibParser()
    parser.parseDirectory(at: String(describing: path))

    do {
      let templateRealPath = try findTemplate(
        prefix: "nibs", templateShortName: templateName, templateFullPath: templatePath
      )
      let template = try GenumTemplate(templateString: templateRealPath.read(), environment: genumEnvironment())
      let context = parser.stencilContext(enumName: enumName)
      let rendered = try template.render(context)
      output.write(content: rendered, onlyIfChanged: true)
    } catch {
      print("Failed to render template \(error)")
    }
}
