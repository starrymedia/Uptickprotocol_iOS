// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: coinswap/query.proto
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

/// QueryLiquidityRequest is request type for the Query/Liquidity RPC method
struct Irismod_Coinswap_QueryLiquidityRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var denom: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryLiquidityResponse is response type for the Query/Liquidity RPC method
struct Irismod_Coinswap_QueryLiquidityResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var standard: Cosmos_Base_V1beta1_Coin {
    get {return _storage._standard ?? Cosmos_Base_V1beta1_Coin()}
    set {_uniqueStorage()._standard = newValue}
  }
  /// Returns true if `standard` has been explicitly set.
  var hasStandard: Bool {return _storage._standard != nil}
  /// Clears the value of `standard`. Subsequent reads from it will return its default value.
  mutating func clearStandard() {_uniqueStorage()._standard = nil}

  var token: Cosmos_Base_V1beta1_Coin {
    get {return _storage._token ?? Cosmos_Base_V1beta1_Coin()}
    set {_uniqueStorage()._token = newValue}
  }
  /// Returns true if `token` has been explicitly set.
  var hasToken: Bool {return _storage._token != nil}
  /// Clears the value of `token`. Subsequent reads from it will return its default value.
  mutating func clearToken() {_uniqueStorage()._token = nil}

  var liquidity: Cosmos_Base_V1beta1_Coin {
    get {return _storage._liquidity ?? Cosmos_Base_V1beta1_Coin()}
    set {_uniqueStorage()._liquidity = newValue}
  }
  /// Returns true if `liquidity` has been explicitly set.
  var hasLiquidity: Bool {return _storage._liquidity != nil}
  /// Clears the value of `liquidity`. Subsequent reads from it will return its default value.
  mutating func clearLiquidity() {_uniqueStorage()._liquidity = nil}

  var fee: String {
    get {return _storage._fee}
    set {_uniqueStorage()._fee = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "irismod.coinswap"

extension Irismod_Coinswap_QueryLiquidityRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryLiquidityRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "denom"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.denom)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Irismod_Coinswap_QueryLiquidityRequest, rhs: Irismod_Coinswap_QueryLiquidityRequest) -> Bool {
    if lhs.denom != rhs.denom {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Irismod_Coinswap_QueryLiquidityResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryLiquidityResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "standard"),
    2: .same(proto: "token"),
    3: .same(proto: "liquidity"),
    4: .same(proto: "fee"),
  ]

  fileprivate class _StorageClass {
    var _standard: Cosmos_Base_V1beta1_Coin? = nil
    var _token: Cosmos_Base_V1beta1_Coin? = nil
    var _liquidity: Cosmos_Base_V1beta1_Coin? = nil
    var _fee: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _standard = source._standard
      _token = source._token
      _liquidity = source._liquidity
      _fee = source._fee
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._standard)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._token)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._liquidity)
        case 4: try decoder.decodeSingularStringField(value: &_storage._fee)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._standard {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._token {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._liquidity {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if !_storage._fee.isEmpty {
        try visitor.visitSingularStringField(value: _storage._fee, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Irismod_Coinswap_QueryLiquidityResponse, rhs: Irismod_Coinswap_QueryLiquidityResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._standard != rhs_storage._standard {return false}
        if _storage._token != rhs_storage._token {return false}
        if _storage._liquidity != rhs_storage._liquidity {return false}
        if _storage._fee != rhs_storage._fee {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
