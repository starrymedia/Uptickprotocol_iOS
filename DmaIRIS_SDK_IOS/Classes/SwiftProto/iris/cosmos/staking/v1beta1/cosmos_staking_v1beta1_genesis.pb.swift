// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/staking/v1beta1/genesis.proto
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

/// GenesisState defines the staking module's genesis state.
struct Cosmos_Staking_V1beta1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// params defines all the paramaters of related to deposit.
  var params: Cosmos_Staking_V1beta1_Params {
    get {return _storage._params ?? Cosmos_Staking_V1beta1_Params()}
    set {_uniqueStorage()._params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return _storage._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {_uniqueStorage()._params = nil}

  /// last_total_power tracks the total amounts of bonded tokens recorded during
  /// the previous end block.
  var lastTotalPower: Data {
    get {return _storage._lastTotalPower}
    set {_uniqueStorage()._lastTotalPower = newValue}
  }

  /// last_validator_powers is a special index that provides a historical list
  /// of the last-block's bonded validators.
  var lastValidatorPowers: [Cosmos_Staking_V1beta1_LastValidatorPower] {
    get {return _storage._lastValidatorPowers}
    set {_uniqueStorage()._lastValidatorPowers = newValue}
  }

  /// delegations defines the validator set at genesis.
  var validators: [Cosmos_Staking_V1beta1_Validator] {
    get {return _storage._validators}
    set {_uniqueStorage()._validators = newValue}
  }

  /// delegations defines the delegations active at genesis.
  var delegations: [Cosmos_Staking_V1beta1_Delegation] {
    get {return _storage._delegations}
    set {_uniqueStorage()._delegations = newValue}
  }

  /// unbonding_delegations defines the unbonding delegations active at genesis.
  var unbondingDelegations: [Cosmos_Staking_V1beta1_UnbondingDelegation] {
    get {return _storage._unbondingDelegations}
    set {_uniqueStorage()._unbondingDelegations = newValue}
  }

  /// redelegations defines the redelegations active at genesis.
  var redelegations: [Cosmos_Staking_V1beta1_Redelegation] {
    get {return _storage._redelegations}
    set {_uniqueStorage()._redelegations = newValue}
  }

  var exported: Bool {
    get {return _storage._exported}
    set {_uniqueStorage()._exported = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// LastValidatorPower required for validator set update logic.
struct Cosmos_Staking_V1beta1_LastValidatorPower {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// address is the address of the validator.
  var address: String = String()

  /// power defines the power of the validator.
  var power: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.staking.v1beta1"

extension Cosmos_Staking_V1beta1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
    2: .standard(proto: "last_total_power"),
    3: .standard(proto: "last_validator_powers"),
    4: .same(proto: "validators"),
    5: .same(proto: "delegations"),
    6: .standard(proto: "unbonding_delegations"),
    7: .same(proto: "redelegations"),
    8: .same(proto: "exported"),
  ]

  fileprivate class _StorageClass {
    var _params: Cosmos_Staking_V1beta1_Params? = nil
    var _lastTotalPower: Data = SwiftProtobuf.Internal.emptyData
    var _lastValidatorPowers: [Cosmos_Staking_V1beta1_LastValidatorPower] = []
    var _validators: [Cosmos_Staking_V1beta1_Validator] = []
    var _delegations: [Cosmos_Staking_V1beta1_Delegation] = []
    var _unbondingDelegations: [Cosmos_Staking_V1beta1_UnbondingDelegation] = []
    var _redelegations: [Cosmos_Staking_V1beta1_Redelegation] = []
    var _exported: Bool = false

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _params = source._params
      _lastTotalPower = source._lastTotalPower
      _lastValidatorPowers = source._lastValidatorPowers
      _validators = source._validators
      _delegations = source._delegations
      _unbondingDelegations = source._unbondingDelegations
      _redelegations = source._redelegations
      _exported = source._exported
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._params)
        case 2: try decoder.decodeSingularBytesField(value: &_storage._lastTotalPower)
        case 3: try decoder.decodeRepeatedMessageField(value: &_storage._lastValidatorPowers)
        case 4: try decoder.decodeRepeatedMessageField(value: &_storage._validators)
        case 5: try decoder.decodeRepeatedMessageField(value: &_storage._delegations)
        case 6: try decoder.decodeRepeatedMessageField(value: &_storage._unbondingDelegations)
        case 7: try decoder.decodeRepeatedMessageField(value: &_storage._redelegations)
        case 8: try decoder.decodeSingularBoolField(value: &_storage._exported)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._params {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._lastTotalPower.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._lastTotalPower, fieldNumber: 2)
      }
      if !_storage._lastValidatorPowers.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._lastValidatorPowers, fieldNumber: 3)
      }
      if !_storage._validators.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._validators, fieldNumber: 4)
      }
      if !_storage._delegations.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._delegations, fieldNumber: 5)
      }
      if !_storage._unbondingDelegations.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._unbondingDelegations, fieldNumber: 6)
      }
      if !_storage._redelegations.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._redelegations, fieldNumber: 7)
      }
      if _storage._exported != false {
        try visitor.visitSingularBoolField(value: _storage._exported, fieldNumber: 8)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Staking_V1beta1_GenesisState, rhs: Cosmos_Staking_V1beta1_GenesisState) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._params != rhs_storage._params {return false}
        if _storage._lastTotalPower != rhs_storage._lastTotalPower {return false}
        if _storage._lastValidatorPowers != rhs_storage._lastValidatorPowers {return false}
        if _storage._validators != rhs_storage._validators {return false}
        if _storage._delegations != rhs_storage._delegations {return false}
        if _storage._unbondingDelegations != rhs_storage._unbondingDelegations {return false}
        if _storage._redelegations != rhs_storage._redelegations {return false}
        if _storage._exported != rhs_storage._exported {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Staking_V1beta1_LastValidatorPower: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".LastValidatorPower"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .same(proto: "power"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.address)
      case 2: try decoder.decodeSingularInt64Field(value: &self.power)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    if self.power != 0 {
      try visitor.visitSingularInt64Field(value: self.power, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Staking_V1beta1_LastValidatorPower, rhs: Cosmos_Staking_V1beta1_LastValidatorPower) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.power != rhs.power {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
