// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/evidence/v1beta1/tx.proto
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

/// MsgSubmitEvidence represents a message that supports submitting arbitrary
/// Evidence of misbehavior such as equivocation or counterfactual signing.
struct Cosmos_Evidence_V1beta1_MsgSubmitEvidence {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var submitter: String {
    get {return _storage._submitter}
    set {_uniqueStorage()._submitter = newValue}
  }

  var evidence: SwiftProtobuf.Google_Protobuf_Any {
    get {return _storage._evidence ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_uniqueStorage()._evidence = newValue}
  }
  /// Returns true if `evidence` has been explicitly set.
  var hasEvidence: Bool {return _storage._evidence != nil}
  /// Clears the value of `evidence`. Subsequent reads from it will return its default value.
  mutating func clearEvidence() {_uniqueStorage()._evidence = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// MsgSubmitEvidenceResponse defines the Msg/SubmitEvidence response type.
struct Cosmos_Evidence_V1beta1_MsgSubmitEvidenceResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// hash defines the hash of the evidence.
  var hash: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.evidence.v1beta1"

extension Cosmos_Evidence_V1beta1_MsgSubmitEvidence: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSubmitEvidence"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "submitter"),
    2: .same(proto: "evidence"),
  ]

  fileprivate class _StorageClass {
    var _submitter: String = String()
    var _evidence: SwiftProtobuf.Google_Protobuf_Any? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _submitter = source._submitter
      _evidence = source._evidence
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._submitter)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._evidence)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._submitter.isEmpty {
        try visitor.visitSingularStringField(value: _storage._submitter, fieldNumber: 1)
      }
      if let v = _storage._evidence {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Evidence_V1beta1_MsgSubmitEvidence, rhs: Cosmos_Evidence_V1beta1_MsgSubmitEvidence) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._submitter != rhs_storage._submitter {return false}
        if _storage._evidence != rhs_storage._evidence {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Evidence_V1beta1_MsgSubmitEvidenceResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSubmitEvidenceResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    4: .same(proto: "hash"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 4: try decoder.decodeSingularBytesField(value: &self.hash)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.hash.isEmpty {
      try visitor.visitSingularBytesField(value: self.hash, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Evidence_V1beta1_MsgSubmitEvidenceResponse, rhs: Cosmos_Evidence_V1beta1_MsgSubmitEvidenceResponse) -> Bool {
    if lhs.hash != rhs.hash {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}