// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: oracle/oracle.proto
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

/// Feed defines the feed standard
struct Irismod_Oracle_Feed {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var feedName: String = String()

  var description_p: String = String()

  var aggregateFunc: String = String()

  var valueJsonPath: String = String()

  var latestHistory: UInt64 = 0

  var requestContextID: String = String()

  var creator: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// FeedValue defines the feed result standard
struct Irismod_Oracle_FeedValue {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var data: String {
    get {return _storage._data}
    set {_uniqueStorage()._data = newValue}
  }

  var timestamp: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._timestamp ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._timestamp = newValue}
  }
  /// Returns true if `timestamp` has been explicitly set.
  var hasTimestamp: Bool {return _storage._timestamp != nil}
  /// Clears the value of `timestamp`. Subsequent reads from it will return its default value.
  mutating func clearTimestamp() {_uniqueStorage()._timestamp = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "irismod.oracle"

extension Irismod_Oracle_Feed: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Feed"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "feed_name"),
    2: .same(proto: "description"),
    3: .standard(proto: "aggregate_func"),
    4: .standard(proto: "value_json_path"),
    5: .standard(proto: "latest_history"),
    6: .standard(proto: "request_context_id"),
    7: .same(proto: "creator"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.feedName)
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      case 3: try decoder.decodeSingularStringField(value: &self.aggregateFunc)
      case 4: try decoder.decodeSingularStringField(value: &self.valueJsonPath)
      case 5: try decoder.decodeSingularUInt64Field(value: &self.latestHistory)
      case 6: try decoder.decodeSingularStringField(value: &self.requestContextID)
      case 7: try decoder.decodeSingularStringField(value: &self.creator)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.feedName.isEmpty {
      try visitor.visitSingularStringField(value: self.feedName, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.aggregateFunc.isEmpty {
      try visitor.visitSingularStringField(value: self.aggregateFunc, fieldNumber: 3)
    }
    if !self.valueJsonPath.isEmpty {
      try visitor.visitSingularStringField(value: self.valueJsonPath, fieldNumber: 4)
    }
    if self.latestHistory != 0 {
      try visitor.visitSingularUInt64Field(value: self.latestHistory, fieldNumber: 5)
    }
    if !self.requestContextID.isEmpty {
      try visitor.visitSingularStringField(value: self.requestContextID, fieldNumber: 6)
    }
    if !self.creator.isEmpty {
      try visitor.visitSingularStringField(value: self.creator, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Irismod_Oracle_Feed, rhs: Irismod_Oracle_Feed) -> Bool {
    if lhs.feedName != rhs.feedName {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.aggregateFunc != rhs.aggregateFunc {return false}
    if lhs.valueJsonPath != rhs.valueJsonPath {return false}
    if lhs.latestHistory != rhs.latestHistory {return false}
    if lhs.requestContextID != rhs.requestContextID {return false}
    if lhs.creator != rhs.creator {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Irismod_Oracle_FeedValue: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FeedValue"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "data"),
    2: .same(proto: "timestamp"),
  ]

  fileprivate class _StorageClass {
    var _data: String = String()
    var _timestamp: SwiftProtobuf.Google_Protobuf_Timestamp? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _data = source._data
      _timestamp = source._timestamp
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._data)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._timestamp)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._data.isEmpty {
        try visitor.visitSingularStringField(value: _storage._data, fieldNumber: 1)
      }
      if let v = _storage._timestamp {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Irismod_Oracle_FeedValue, rhs: Irismod_Oracle_FeedValue) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._data != rhs_storage._data {return false}
        if _storage._timestamp != rhs_storage._timestamp {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}