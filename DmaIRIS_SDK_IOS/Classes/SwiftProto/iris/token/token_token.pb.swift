// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: token/token.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Token defines a standard for the fungible token
public struct Irismod_Token_Token {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var symbol: String = String()

  var name: String = String()

  var scale: UInt32 = 0

  var minUnit: String = String()

  var initialSupply: UInt64 = 0

  var maxSupply: UInt64 = 0

  var mintable: Bool = false

  var owner: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
}

/// token parameters
struct Irismod_Token_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var tokenTaxRate: String {
    get {return _storage._tokenTaxRate}
    set {_uniqueStorage()._tokenTaxRate = newValue}
  }

  var issueTokenBaseFee: Cosmos_Base_V1beta1_Coin {
    get {return _storage._issueTokenBaseFee ?? Cosmos_Base_V1beta1_Coin()}
    set {_uniqueStorage()._issueTokenBaseFee = newValue}
  }
  /// Returns true if `issueTokenBaseFee` has been explicitly set.
  var hasIssueTokenBaseFee: Bool {return _storage._issueTokenBaseFee != nil}
  /// Clears the value of `issueTokenBaseFee`. Subsequent reads from it will return its default value.
  mutating func clearIssueTokenBaseFee() {_uniqueStorage()._issueTokenBaseFee = nil}

  var mintTokenFeeRatio: String {
    get {return _storage._mintTokenFeeRatio}
    set {_uniqueStorage()._mintTokenFeeRatio = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "irismod.token"

extension Irismod_Token_Token: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    public static let protoMessageName: String = _protobuf_package + ".Token"
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "symbol"),
    2: .same(proto: "name"),
    3: .same(proto: "scale"),
    4: .standard(proto: "min_unit"),
    5: .standard(proto: "initial_supply"),
    6: .standard(proto: "max_supply"),
    7: .same(proto: "mintable"),
    8: .same(proto: "owner"),
  ]

    mutating public func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.symbol)
      case 2: try decoder.decodeSingularStringField(value: &self.name)
      case 3: try decoder.decodeSingularUInt32Field(value: &self.scale)
      case 4: try decoder.decodeSingularStringField(value: &self.minUnit)
      case 5: try decoder.decodeSingularUInt64Field(value: &self.initialSupply)
      case 6: try decoder.decodeSingularUInt64Field(value: &self.maxSupply)
      case 7: try decoder.decodeSingularBoolField(value: &self.mintable)
      case 8: try decoder.decodeSingularStringField(value: &self.owner)
      default: break
      }
    }
  }

    public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.symbol.isEmpty {
      try visitor.visitSingularStringField(value: self.symbol, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if self.scale != 0 {
      try visitor.visitSingularUInt32Field(value: self.scale, fieldNumber: 3)
    }
    if !self.minUnit.isEmpty {
      try visitor.visitSingularStringField(value: self.minUnit, fieldNumber: 4)
    }
    if self.initialSupply != 0 {
      try visitor.visitSingularUInt64Field(value: self.initialSupply, fieldNumber: 5)
    }
    if self.maxSupply != 0 {
      try visitor.visitSingularUInt64Field(value: self.maxSupply, fieldNumber: 6)
    }
    if self.mintable != false {
      try visitor.visitSingularBoolField(value: self.mintable, fieldNumber: 7)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

    public static func ==(lhs: Irismod_Token_Token, rhs: Irismod_Token_Token) -> Bool {
    if lhs.symbol != rhs.symbol {return false}
    if lhs.name != rhs.name {return false}
    if lhs.scale != rhs.scale {return false}
    if lhs.minUnit != rhs.minUnit {return false}
    if lhs.initialSupply != rhs.initialSupply {return false}
    if lhs.maxSupply != rhs.maxSupply {return false}
    if lhs.mintable != rhs.mintable {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Irismod_Token_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Params"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "token_tax_rate"),
    2: .standard(proto: "issue_token_base_fee"),
    3: .standard(proto: "mint_token_fee_ratio"),
  ]

  fileprivate class _StorageClass {
    var _tokenTaxRate: String = String()
    var _issueTokenBaseFee: Cosmos_Base_V1beta1_Coin? = nil
    var _mintTokenFeeRatio: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _tokenTaxRate = source._tokenTaxRate
      _issueTokenBaseFee = source._issueTokenBaseFee
      _mintTokenFeeRatio = source._mintTokenFeeRatio
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._tokenTaxRate)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._issueTokenBaseFee)
        case 3: try decoder.decodeSingularStringField(value: &_storage._mintTokenFeeRatio)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._tokenTaxRate.isEmpty {
        try visitor.visitSingularStringField(value: _storage._tokenTaxRate, fieldNumber: 1)
      }
      if let v = _storage._issueTokenBaseFee {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if !_storage._mintTokenFeeRatio.isEmpty {
        try visitor.visitSingularStringField(value: _storage._mintTokenFeeRatio, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Irismod_Token_Params, rhs: Irismod_Token_Params) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._tokenTaxRate != rhs_storage._tokenTaxRate {return false}
        if _storage._issueTokenBaseFee != rhs_storage._issueTokenBaseFee {return false}
        if _storage._mintTokenFeeRatio != rhs_storage._mintTokenFeeRatio {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
