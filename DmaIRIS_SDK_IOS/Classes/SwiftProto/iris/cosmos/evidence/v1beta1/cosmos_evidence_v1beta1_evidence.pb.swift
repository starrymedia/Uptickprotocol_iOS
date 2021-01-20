// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/evidence/v1beta1/evidence.proto
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

/// Equivocation implements the Evidence interface and defines evidence of double
/// signing misbehavior.
struct Cosmos_Evidence_V1beta1_Equivocation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var height: Int64 {
    get {return _storage._height}
    set {_uniqueStorage()._height = newValue}
  }

  var time: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._time ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._time = newValue}
  }
  /// Returns true if `time` has been explicitly set.
  var hasTime: Bool {return _storage._time != nil}
  /// Clears the value of `time`. Subsequent reads from it will return its default value.
  mutating func clearTime() {_uniqueStorage()._time = nil}

  var power: Int64 {
    get {return _storage._power}
    set {_uniqueStorage()._power = newValue}
  }

  var consensusAddress: String {
    get {return _storage._consensusAddress}
    set {_uniqueStorage()._consensusAddress = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.evidence.v1beta1"

extension Cosmos_Evidence_V1beta1_Equivocation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Equivocation"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "height"),
    2: .same(proto: "time"),
    3: .same(proto: "power"),
    4: .standard(proto: "consensus_address"),
  ]

  fileprivate class _StorageClass {
    var _height: Int64 = 0
    var _time: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _power: Int64 = 0
    var _consensusAddress: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _height = source._height
      _time = source._time
      _power = source._power
      _consensusAddress = source._consensusAddress
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
        case 1: try decoder.decodeSingularInt64Field(value: &_storage._height)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._time)
        case 3: try decoder.decodeSingularInt64Field(value: &_storage._power)
        case 4: try decoder.decodeSingularStringField(value: &_storage._consensusAddress)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._height != 0 {
        try visitor.visitSingularInt64Field(value: _storage._height, fieldNumber: 1)
      }
      if let v = _storage._time {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if _storage._power != 0 {
        try visitor.visitSingularInt64Field(value: _storage._power, fieldNumber: 3)
      }
      if !_storage._consensusAddress.isEmpty {
        try visitor.visitSingularStringField(value: _storage._consensusAddress, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Evidence_V1beta1_Equivocation, rhs: Cosmos_Evidence_V1beta1_Equivocation) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._height != rhs_storage._height {return false}
        if _storage._time != rhs_storage._time {return false}
        if _storage._power != rhs_storage._power {return false}
        if _storage._consensusAddress != rhs_storage._consensusAddress {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
