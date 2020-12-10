// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tendermint/types/params.proto
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

/// ConsensusParams contains consensus critical parameters that determine the
///
/// validity of blocks.
struct Tendermint_Types_ConsensusParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var block: Tendermint_Types_BlockParams {
    get {return _storage._block ?? Tendermint_Types_BlockParams()}
    set {_uniqueStorage()._block = newValue}
  }
  /// Returns true if `block` has been explicitly set.
  var hasBlock: Bool {return _storage._block != nil}
  /// Clears the value of `block`. Subsequent reads from it will return its default value.
  mutating func clearBlock() {_uniqueStorage()._block = nil}

  var evidence: Tendermint_Types_EvidenceParams {
    get {return _storage._evidence ?? Tendermint_Types_EvidenceParams()}
    set {_uniqueStorage()._evidence = newValue}
  }
  /// Returns true if `evidence` has been explicitly set.
  var hasEvidence: Bool {return _storage._evidence != nil}
  /// Clears the value of `evidence`. Subsequent reads from it will return its default value.
  mutating func clearEvidence() {_uniqueStorage()._evidence = nil}

  var validator: Tendermint_Types_ValidatorParams {
    get {return _storage._validator ?? Tendermint_Types_ValidatorParams()}
    set {_uniqueStorage()._validator = newValue}
  }
  /// Returns true if `validator` has been explicitly set.
  var hasValidator: Bool {return _storage._validator != nil}
  /// Clears the value of `validator`. Subsequent reads from it will return its default value.
  mutating func clearValidator() {_uniqueStorage()._validator = nil}

  var version: Tendermint_Types_VersionParams {
    get {return _storage._version ?? Tendermint_Types_VersionParams()}
    set {_uniqueStorage()._version = newValue}
  }
  /// Returns true if `version` has been explicitly set.
  var hasVersion: Bool {return _storage._version != nil}
  /// Clears the value of `version`. Subsequent reads from it will return its default value.
  mutating func clearVersion() {_uniqueStorage()._version = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// BlockParams contains limits on the block size.
struct Tendermint_Types_BlockParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Max block size, in bytes.
  ///
  /// Note: must be greater than 0
  var maxBytes: Int64 = 0

  /// Max gas per block.
  ///
  /// Note: must be greater or equal to -1
  var maxGas: Int64 = 0

  /// Minimum time increment between consecutive blocks (in milliseconds) If the
  ///
  /// block header timestamp is ahead of the system clock, decrease this value.
  ///
  ///
  ///
  /// Not exposed to the application.
  var timeIotaMs: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// EvidenceParams determine how we handle evidence of malfeasance.
struct Tendermint_Types_EvidenceParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Max age of evidence, in blocks.
  ///
  ///
  ///
  /// The basic formula for calculating this is: MaxAgeDuration / {average block
  ///
  /// time}.
  var maxAgeNumBlocks: Int64 {
    get {return _storage._maxAgeNumBlocks}
    set {_uniqueStorage()._maxAgeNumBlocks = newValue}
  }

  /// Max age of evidence, in time.
  ///
  ///
  ///
  /// It should correspond with an app's "unbonding period" or other similar
  ///
  /// mechanism for handling [Nothing-At-Stake
  ///
  /// attacks](https://github.com/ethereum/wiki/wiki/Proof-of-Stake-FAQ#what-is-the-nothing-at-stake-problem-and-how-can-it-be-fixed).
  var maxAgeDuration: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _storage._maxAgeDuration ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_uniqueStorage()._maxAgeDuration = newValue}
  }
  /// Returns true if `maxAgeDuration` has been explicitly set.
  var hasMaxAgeDuration: Bool {return _storage._maxAgeDuration != nil}
  /// Clears the value of `maxAgeDuration`. Subsequent reads from it will return its default value.
  mutating func clearMaxAgeDuration() {_uniqueStorage()._maxAgeDuration = nil}

  /// This sets the maximum number of evidence that can be committed in a single block.
  ///
  /// and should fall comfortably under the max block bytes when we consider the size of
  ///
  /// each evidence (See MaxEvidenceBytes). The maximum number is MaxEvidencePerBlock.
  ///
  /// Default is 50
  var maxNum: UInt32 {
    get {return _storage._maxNum}
    set {_uniqueStorage()._maxNum = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// ValidatorParams restrict the public key types validators can use.
///
/// NOTE: uses ABCI pubkey naming, not Amino names.
struct Tendermint_Types_ValidatorParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var pubKeyTypes: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// VersionParams contains the ABCI application version.
struct Tendermint_Types_VersionParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var appVersion: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// HashedParams is a subset of ConsensusParams.
///
///
///
/// It is hashed into the Header.ConsensusHash.
struct Tendermint_Types_HashedParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var blockMaxBytes: Int64 = 0

  var blockMaxGas: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tendermint.types"

extension Tendermint_Types_ConsensusParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ConsensusParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "block"),
    2: .same(proto: "evidence"),
    3: .same(proto: "validator"),
    4: .same(proto: "version"),
  ]

  fileprivate class _StorageClass {
    var _block: Tendermint_Types_BlockParams? = nil
    var _evidence: Tendermint_Types_EvidenceParams? = nil
    var _validator: Tendermint_Types_ValidatorParams? = nil
    var _version: Tendermint_Types_VersionParams? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _block = source._block
      _evidence = source._evidence
      _validator = source._validator
      _version = source._version
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._block)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._evidence)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._validator)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._version)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._block {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._evidence {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._validator {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._version {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Types_ConsensusParams, rhs: Tendermint_Types_ConsensusParams) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._block != rhs_storage._block {return false}
        if _storage._evidence != rhs_storage._evidence {return false}
        if _storage._validator != rhs_storage._validator {return false}
        if _storage._version != rhs_storage._version {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Types_BlockParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BlockParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "max_bytes"),
    2: .standard(proto: "max_gas"),
    3: .standard(proto: "time_iota_ms"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt64Field(value: &self.maxBytes)
      case 2: try decoder.decodeSingularInt64Field(value: &self.maxGas)
      case 3: try decoder.decodeSingularInt64Field(value: &self.timeIotaMs)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.maxBytes != 0 {
      try visitor.visitSingularInt64Field(value: self.maxBytes, fieldNumber: 1)
    }
    if self.maxGas != 0 {
      try visitor.visitSingularInt64Field(value: self.maxGas, fieldNumber: 2)
    }
    if self.timeIotaMs != 0 {
      try visitor.visitSingularInt64Field(value: self.timeIotaMs, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Types_BlockParams, rhs: Tendermint_Types_BlockParams) -> Bool {
    if lhs.maxBytes != rhs.maxBytes {return false}
    if lhs.maxGas != rhs.maxGas {return false}
    if lhs.timeIotaMs != rhs.timeIotaMs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Types_EvidenceParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EvidenceParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "max_age_num_blocks"),
    2: .standard(proto: "max_age_duration"),
    3: .standard(proto: "max_num"),
  ]

  fileprivate class _StorageClass {
    var _maxAgeNumBlocks: Int64 = 0
    var _maxAgeDuration: SwiftProtobuf.Google_Protobuf_Duration? = nil
    var _maxNum: UInt32 = 0

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _maxAgeNumBlocks = source._maxAgeNumBlocks
      _maxAgeDuration = source._maxAgeDuration
      _maxNum = source._maxNum
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
        case 1: try decoder.decodeSingularInt64Field(value: &_storage._maxAgeNumBlocks)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._maxAgeDuration)
        case 3: try decoder.decodeSingularUInt32Field(value: &_storage._maxNum)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._maxAgeNumBlocks != 0 {
        try visitor.visitSingularInt64Field(value: _storage._maxAgeNumBlocks, fieldNumber: 1)
      }
      if let v = _storage._maxAgeDuration {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if _storage._maxNum != 0 {
        try visitor.visitSingularUInt32Field(value: _storage._maxNum, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Types_EvidenceParams, rhs: Tendermint_Types_EvidenceParams) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._maxAgeNumBlocks != rhs_storage._maxAgeNumBlocks {return false}
        if _storage._maxAgeDuration != rhs_storage._maxAgeDuration {return false}
        if _storage._maxNum != rhs_storage._maxNum {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Types_ValidatorParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ValidatorParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "pub_key_types"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedStringField(value: &self.pubKeyTypes)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.pubKeyTypes.isEmpty {
      try visitor.visitRepeatedStringField(value: self.pubKeyTypes, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Types_ValidatorParams, rhs: Tendermint_Types_ValidatorParams) -> Bool {
    if lhs.pubKeyTypes != rhs.pubKeyTypes {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Types_VersionParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".VersionParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "app_version"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.appVersion)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.appVersion != 0 {
      try visitor.visitSingularUInt64Field(value: self.appVersion, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Types_VersionParams, rhs: Tendermint_Types_VersionParams) -> Bool {
    if lhs.appVersion != rhs.appVersion {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Types_HashedParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".HashedParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "block_max_bytes"),
    2: .standard(proto: "block_max_gas"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt64Field(value: &self.blockMaxBytes)
      case 2: try decoder.decodeSingularInt64Field(value: &self.blockMaxGas)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.blockMaxBytes != 0 {
      try visitor.visitSingularInt64Field(value: self.blockMaxBytes, fieldNumber: 1)
    }
    if self.blockMaxGas != 0 {
      try visitor.visitSingularInt64Field(value: self.blockMaxGas, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Types_HashedParams, rhs: Tendermint_Types_HashedParams) -> Bool {
    if lhs.blockMaxBytes != rhs.blockMaxBytes {return false}
    if lhs.blockMaxGas != rhs.blockMaxGas {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
