//
//  Parsing.swift
//
//  Created 2021 by Stefan Springer, https://stefanspringer.com
//  License: Apache License 2.0

import Foundation

public struct XEventHandlerError: LocalizedError {

    private let message: String

    public init(_ message: String) {
        self.message = message
    }

    public var errorDescription: String? {
        return message
    }
}

public protocol InternalEntityResolver {
    func resolve(entityWithName entityName: String, forAttributeName attributeName: String?, atElement elementName: String?) -> String?
}

public enum WhitespaceIndicator {
    case WHITESPACE
    case NOT_WHITESPACE
    case UNKNOWN
}

public struct SourcePosition: CustomStringConvertible {
    
    public let binaryPosition: Int
    public let line: Int
    public let column: Int
    
    public init(binaryPosition: Int, line: Int, column: Int) {
        self.binaryPosition = binaryPosition
        self.line = line
        self.column = column
    }
    
    public var description: String { get { "\(line):\(column) (bin. \(binaryPosition))" } }
}

public struct SourceRange: CustomStringConvertible {
    
    public let start: SourcePosition
    public let end: SourcePosition
    
    public init(start: SourcePosition, end: SourcePosition) {
        self.start = start
        self.end = end
    }
    
    public var description: String { get { "\(start) - \(end)" } }
}

public protocol XEventHandler {

    func documentStart()

    func xmlDeclaration(version: String, encoding: String?, standalone: String?, sourceRange: SourceRange)

    func documentTypeDeclarationStart(type: String, publicID: String?, systemID: String?, sourceRange: SourceRange)
    
    func documentTypeDeclarationEnd(sourceRange: SourceRange)

    func elementStart(name: String, attributes: [String:String]?, sourceRange: SourceRange)

    func elementEnd(name: String, sourceRange: SourceRange)

    func text(text: String, whitespace: WhitespaceIndicator, sourceRange: SourceRange)

    func cdataSection(text: String, sourceRange: SourceRange)

    func processingInstruction(target: String, data: String?, sourceRange: SourceRange)

    func comment(text: String, sourceRange: SourceRange)

    func internalEntityDeclaration(name: String, value: String, sourceRange: SourceRange)

    func externalEntityDeclaration(name: String, publicID:  String?, systemID: String, sourceRange: SourceRange)

    func unparsedEntityDeclaration(name: String, publicID:  String?, systemID: String, notation: String, sourceRange: SourceRange)

    func notationDeclaration(name: String, publicID:  String?, systemID: String?, sourceRange: SourceRange)

    func internalEntity(name: String, sourceRange: SourceRange)

    func externalEntity(name: String, sourceRange: SourceRange)

    func elementDeclaration(name: String, literal: String, sourceRange: SourceRange)

    func attributeListDeclaration(name: String, literal: String, sourceRange: SourceRange)

    func parameterEntityDeclaration(name: String, value: String, sourceRange: SourceRange)

    func documentEnd()
}

open class DefaultXEventHandler: XEventHandler {

    public init() {}

    open func documentStart() {}

    open func xmlDeclaration(version: String, encoding: String?, standalone: String?, sourceRange: SourceRange) {}
    
    open func documentTypeDeclarationStart(type: String, publicID: String?, systemID: String?, sourceRange: SourceRange) {}
    
    open func documentTypeDeclarationEnd(sourceRange: SourceRange) {}

    open func elementStart(name: String, attributes: [String:String]?, sourceRange: SourceRange) {}

    open func elementEnd(name: String, sourceRange: SourceRange) {}

    open func text(text: String, whitespace: WhitespaceIndicator, sourceRange: SourceRange) {}

    open func cdataSection(text: String, sourceRange: SourceRange) {}

    open func processingInstruction(target: String, data: String?, sourceRange: SourceRange) {}

    open func comment(text: String, sourceRange: SourceRange) {}

    open func internalEntityDeclaration(name: String, value: String, sourceRange: SourceRange) {}

    open func externalEntityDeclaration(name: String, publicID:  String?, systemID: String, sourceRange: SourceRange) {}

    open func unparsedEntityDeclaration(name: String, publicID:  String?, systemID: String, notation: String, sourceRange: SourceRange) {}

    open func notationDeclaration(name: String, publicID:  String?, systemID: String?, sourceRange: SourceRange) {}

    open func internalEntity(name: String, sourceRange: SourceRange) {}

    open func externalEntity(name: String, sourceRange: SourceRange) {}

    open func elementDeclaration(name: String, literal: String, sourceRange: SourceRange) {}

    open func attributeListDeclaration(name: String, literal: String, sourceRange: SourceRange) {}

    open func parameterEntityDeclaration(name: String, value: String, sourceRange: SourceRange) {}

    open func documentEnd() {}
}
