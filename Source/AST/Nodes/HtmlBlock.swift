//
//  HtmlBlock.swift
//  Down
//
//  Created by John Nguyen on 09.04.19.
//

import Foundation
import libcmark

public class HtmlBlock: Node {
    
    public var cmarkNode: CMarkNode
    
    public var debugDescription: String { return "Html Block - '\(literal)'" }
    
    var literal: String {
        // TODO: is it expected that there is a literal?
        guard let cString = cmark_node_get_literal(cmarkNode) else { fatalError() }
        return String(cString: cString)
    }
    
    init?(cmarkNode: CMarkNode) {
        guard cmarkNode.type == CMARK_NODE_HTML_BLOCK else { return nil }
        self.cmarkNode = cmarkNode
    }
}