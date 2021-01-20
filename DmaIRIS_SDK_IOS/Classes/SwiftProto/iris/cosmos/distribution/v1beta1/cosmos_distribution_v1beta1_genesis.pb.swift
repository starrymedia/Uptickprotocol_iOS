// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/distribution/v1beta1/genesis.proto
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

/// DelegatorWithdrawInfo is the address for where distributions rewards are
/// withdrawn to by default this struct is only used at genesis to feed in
/// default withdraw addresses.
struct Cosmos_Distribution_V1beta1_DelegatorWithdrawInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// delegator_address is the address of the delegator.
  var delegatorAddress: String = String()

  /// withdraw_address is the address to withdraw the delegation rewards to.
  var withdrawAddress: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ValidatorOutstandingRewardsRecord is used for import/export via genesis json.
struct Cosmos_Distribution_V1beta1_ValidatorOutstandingRewardsRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// validator_address is the address of the validator.
  var validatorAddress: String = String()

  /// outstanding_rewards represents the oustanding rewards of a validator.
  var outstandingRewards: [Cosmos_Base_V1beta1_DecCoin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ValidatorAccumulatedCommissionRecord is used for import / export via genesis
/// json.
struct Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommissionRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// validator_address is the address of the validator.
  var validatorAddress: String {
    get {return _storage._validatorAddress}
    set {_uniqueStorage()._validatorAddress = newValue}
  }

  /// accumulated is the accumulated commission of a validator.
  var accumulated: Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommission {
    get {return _storage._accumulated ?? Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommission()}
    set {_uniqueStorage()._accumulated = newValue}
  }
  /// Returns true if `accumulated` has been explicitly set.
  var hasAccumulated: Bool {return _storage._accumulated != nil}
  /// Clears the value of `accumulated`. Subsequent reads from it will return its default value.
  mutating func clearAccumulated() {_uniqueStorage()._accumulated = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// ValidatorHistoricalRewardsRecord is used for import / export via genesis
/// json.
struct Cosmos_Distribution_V1beta1_ValidatorHistoricalRewardsRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// validator_address is the address of the validator.
  var validatorAddress: String {
    get {return _storage._validatorAddress}
    set {_uniqueStorage()._validatorAddress = newValue}
  }

  /// period defines the period the historical rewards apply to.
  var period: UInt64 {
    get {return _storage._period}
    set {_uniqueStorage()._period = newValue}
  }

  /// rewards defines the historical rewards of a validator.
  var rewards: Cosmos_Distribution_V1beta1_ValidatorHistoricalRewards {
    get {return _storage._rewards ?? Cosmos_Distribution_V1beta1_ValidatorHistoricalRewards()}
    set {_uniqueStorage()._rewards = newValue}
  }
  /// Returns true if `rewards` has been explicitly set.
  var hasRewards: Bool {return _storage._rewards != nil}
  /// Clears the value of `rewards`. Subsequent reads from it will return its default value.
  mutating func clearRewards() {_uniqueStorage()._rewards = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// ValidatorCurrentRewardsRecord is used for import / export via genesis json.
struct Cosmos_Distribution_V1beta1_ValidatorCurrentRewardsRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// validator_address is the address of the validator.
  var validatorAddress: String {
    get {return _storage._validatorAddress}
    set {_uniqueStorage()._validatorAddress = newValue}
  }

  /// rewards defines the current rewards of a validator.
  var rewards: Cosmos_Distribution_V1beta1_ValidatorCurrentRewards {
    get {return _storage._rewards ?? Cosmos_Distribution_V1beta1_ValidatorCurrentRewards()}
    set {_uniqueStorage()._rewards = newValue}
  }
  /// Returns true if `rewards` has been explicitly set.
  var hasRewards: Bool {return _storage._rewards != nil}
  /// Clears the value of `rewards`. Subsequent reads from it will return its default value.
  mutating func clearRewards() {_uniqueStorage()._rewards = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// DelegatorStartingInfoRecord used for import / export via genesis json.
struct Cosmos_Distribution_V1beta1_DelegatorStartingInfoRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// delegator_address is the address of the delegator.
  var delegatorAddress: String {
    get {return _storage._delegatorAddress}
    set {_uniqueStorage()._delegatorAddress = newValue}
  }

  /// validator_address is the address of the validator.
  var validatorAddress: String {
    get {return _storage._validatorAddress}
    set {_uniqueStorage()._validatorAddress = newValue}
  }

  /// starting_info defines the starting info of a delegator.
  var startingInfo: Cosmos_Distribution_V1beta1_DelegatorStartingInfo {
    get {return _storage._startingInfo ?? Cosmos_Distribution_V1beta1_DelegatorStartingInfo()}
    set {_uniqueStorage()._startingInfo = newValue}
  }
  /// Returns true if `startingInfo` has been explicitly set.
  var hasStartingInfo: Bool {return _storage._startingInfo != nil}
  /// Clears the value of `startingInfo`. Subsequent reads from it will return its default value.
  mutating func clearStartingInfo() {_uniqueStorage()._startingInfo = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// ValidatorSlashEventRecord is used for import / export via genesis json.
struct Cosmos_Distribution_V1beta1_ValidatorSlashEventRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// validator_address is the address of the validator.
  var validatorAddress: String {
    get {return _storage._validatorAddress}
    set {_uniqueStorage()._validatorAddress = newValue}
  }

  /// height defines the block height at which the slash event occured.
  var height: UInt64 {
    get {return _storage._height}
    set {_uniqueStorage()._height = newValue}
  }

  /// period is the period of the slash event.
  var period: UInt64 {
    get {return _storage._period}
    set {_uniqueStorage()._period = newValue}
  }

  /// validator_slash_event describes the slash event.
  var validatorSlashEvent: Cosmos_Distribution_V1beta1_ValidatorSlashEvent {
    get {return _storage._validatorSlashEvent ?? Cosmos_Distribution_V1beta1_ValidatorSlashEvent()}
    set {_uniqueStorage()._validatorSlashEvent = newValue}
  }
  /// Returns true if `validatorSlashEvent` has been explicitly set.
  var hasValidatorSlashEvent: Bool {return _storage._validatorSlashEvent != nil}
  /// Clears the value of `validatorSlashEvent`. Subsequent reads from it will return its default value.
  mutating func clearValidatorSlashEvent() {_uniqueStorage()._validatorSlashEvent = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// GenesisState defines the distribution module's genesis state.
struct Cosmos_Distribution_V1beta1_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// params defines all the paramaters of the module.
  var params: Cosmos_Distribution_V1beta1_Params {
    get {return _storage._params ?? Cosmos_Distribution_V1beta1_Params()}
    set {_uniqueStorage()._params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return _storage._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {_uniqueStorage()._params = nil}

  /// fee_pool defines the fee pool at genesis.
  var feePool: Cosmos_Distribution_V1beta1_FeePool {
    get {return _storage._feePool ?? Cosmos_Distribution_V1beta1_FeePool()}
    set {_uniqueStorage()._feePool = newValue}
  }
  /// Returns true if `feePool` has been explicitly set.
  var hasFeePool: Bool {return _storage._feePool != nil}
  /// Clears the value of `feePool`. Subsequent reads from it will return its default value.
  mutating func clearFeePool() {_uniqueStorage()._feePool = nil}

  /// fee_pool defines the delegator withdraw infos at genesis.
  var delegatorWithdrawInfos: [Cosmos_Distribution_V1beta1_DelegatorWithdrawInfo] {
    get {return _storage._delegatorWithdrawInfos}
    set {_uniqueStorage()._delegatorWithdrawInfos = newValue}
  }

  /// fee_pool defines the previous proposer at genesis.
  var previousProposer: String {
    get {return _storage._previousProposer}
    set {_uniqueStorage()._previousProposer = newValue}
  }

  /// fee_pool defines the outstanding rewards of all validators at genesis.
  var outstandingRewards: [Cosmos_Distribution_V1beta1_ValidatorOutstandingRewardsRecord] {
    get {return _storage._outstandingRewards}
    set {_uniqueStorage()._outstandingRewards = newValue}
  }

  /// fee_pool defines the accumulated commisions of all validators at genesis.
  var validatorAccumulatedCommissions: [Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommissionRecord] {
    get {return _storage._validatorAccumulatedCommissions}
    set {_uniqueStorage()._validatorAccumulatedCommissions = newValue}
  }

  /// fee_pool defines the historical rewards of all validators at genesis.
  var validatorHistoricalRewards: [Cosmos_Distribution_V1beta1_ValidatorHistoricalRewardsRecord] {
    get {return _storage._validatorHistoricalRewards}
    set {_uniqueStorage()._validatorHistoricalRewards = newValue}
  }

  /// fee_pool defines the current rewards of all validators at genesis.
  var validatorCurrentRewards: [Cosmos_Distribution_V1beta1_ValidatorCurrentRewardsRecord] {
    get {return _storage._validatorCurrentRewards}
    set {_uniqueStorage()._validatorCurrentRewards = newValue}
  }

  /// fee_pool defines the delegator starting infos at genesis.
  var delegatorStartingInfos: [Cosmos_Distribution_V1beta1_DelegatorStartingInfoRecord] {
    get {return _storage._delegatorStartingInfos}
    set {_uniqueStorage()._delegatorStartingInfos = newValue}
  }

  /// fee_pool defines the validator slash events at genesis.
  var validatorSlashEvents: [Cosmos_Distribution_V1beta1_ValidatorSlashEventRecord] {
    get {return _storage._validatorSlashEvents}
    set {_uniqueStorage()._validatorSlashEvents = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.distribution.v1beta1"

extension Cosmos_Distribution_V1beta1_DelegatorWithdrawInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DelegatorWithdrawInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "delegator_address"),
    2: .standard(proto: "withdraw_address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.delegatorAddress)
      case 2: try decoder.decodeSingularStringField(value: &self.withdrawAddress)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.delegatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.delegatorAddress, fieldNumber: 1)
    }
    if !self.withdrawAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.withdrawAddress, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_DelegatorWithdrawInfo, rhs: Cosmos_Distribution_V1beta1_DelegatorWithdrawInfo) -> Bool {
    if lhs.delegatorAddress != rhs.delegatorAddress {return false}
    if lhs.withdrawAddress != rhs.withdrawAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_ValidatorOutstandingRewardsRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ValidatorOutstandingRewardsRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_address"),
    2: .standard(proto: "outstanding_rewards"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.validatorAddress)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.outstandingRewards)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.validatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorAddress, fieldNumber: 1)
    }
    if !self.outstandingRewards.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.outstandingRewards, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_ValidatorOutstandingRewardsRecord, rhs: Cosmos_Distribution_V1beta1_ValidatorOutstandingRewardsRecord) -> Bool {
    if lhs.validatorAddress != rhs.validatorAddress {return false}
    if lhs.outstandingRewards != rhs.outstandingRewards {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommissionRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ValidatorAccumulatedCommissionRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_address"),
    2: .same(proto: "accumulated"),
  ]

  fileprivate class _StorageClass {
    var _validatorAddress: String = String()
    var _accumulated: Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommission? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _validatorAddress = source._validatorAddress
      _accumulated = source._accumulated
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._validatorAddress)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._accumulated)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._validatorAddress.isEmpty {
        try visitor.visitSingularStringField(value: _storage._validatorAddress, fieldNumber: 1)
      }
      if let v = _storage._accumulated {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommissionRecord, rhs: Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommissionRecord) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._validatorAddress != rhs_storage._validatorAddress {return false}
        if _storage._accumulated != rhs_storage._accumulated {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_ValidatorHistoricalRewardsRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ValidatorHistoricalRewardsRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_address"),
    2: .same(proto: "period"),
    3: .same(proto: "rewards"),
  ]

  fileprivate class _StorageClass {
    var _validatorAddress: String = String()
    var _period: UInt64 = 0
    var _rewards: Cosmos_Distribution_V1beta1_ValidatorHistoricalRewards? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _validatorAddress = source._validatorAddress
      _period = source._period
      _rewards = source._rewards
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._validatorAddress)
        case 2: try decoder.decodeSingularUInt64Field(value: &_storage._period)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._rewards)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._validatorAddress.isEmpty {
        try visitor.visitSingularStringField(value: _storage._validatorAddress, fieldNumber: 1)
      }
      if _storage._period != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._period, fieldNumber: 2)
      }
      if let v = _storage._rewards {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_ValidatorHistoricalRewardsRecord, rhs: Cosmos_Distribution_V1beta1_ValidatorHistoricalRewardsRecord) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._validatorAddress != rhs_storage._validatorAddress {return false}
        if _storage._period != rhs_storage._period {return false}
        if _storage._rewards != rhs_storage._rewards {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_ValidatorCurrentRewardsRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ValidatorCurrentRewardsRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_address"),
    2: .same(proto: "rewards"),
  ]

  fileprivate class _StorageClass {
    var _validatorAddress: String = String()
    var _rewards: Cosmos_Distribution_V1beta1_ValidatorCurrentRewards? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _validatorAddress = source._validatorAddress
      _rewards = source._rewards
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._validatorAddress)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._rewards)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._validatorAddress.isEmpty {
        try visitor.visitSingularStringField(value: _storage._validatorAddress, fieldNumber: 1)
      }
      if let v = _storage._rewards {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_ValidatorCurrentRewardsRecord, rhs: Cosmos_Distribution_V1beta1_ValidatorCurrentRewardsRecord) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._validatorAddress != rhs_storage._validatorAddress {return false}
        if _storage._rewards != rhs_storage._rewards {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_DelegatorStartingInfoRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DelegatorStartingInfoRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "delegator_address"),
    2: .standard(proto: "validator_address"),
    3: .standard(proto: "starting_info"),
  ]

  fileprivate class _StorageClass {
    var _delegatorAddress: String = String()
    var _validatorAddress: String = String()
    var _startingInfo: Cosmos_Distribution_V1beta1_DelegatorStartingInfo? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _delegatorAddress = source._delegatorAddress
      _validatorAddress = source._validatorAddress
      _startingInfo = source._startingInfo
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._delegatorAddress)
        case 2: try decoder.decodeSingularStringField(value: &_storage._validatorAddress)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._startingInfo)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._delegatorAddress.isEmpty {
        try visitor.visitSingularStringField(value: _storage._delegatorAddress, fieldNumber: 1)
      }
      if !_storage._validatorAddress.isEmpty {
        try visitor.visitSingularStringField(value: _storage._validatorAddress, fieldNumber: 2)
      }
      if let v = _storage._startingInfo {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_DelegatorStartingInfoRecord, rhs: Cosmos_Distribution_V1beta1_DelegatorStartingInfoRecord) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._delegatorAddress != rhs_storage._delegatorAddress {return false}
        if _storage._validatorAddress != rhs_storage._validatorAddress {return false}
        if _storage._startingInfo != rhs_storage._startingInfo {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_ValidatorSlashEventRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ValidatorSlashEventRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_address"),
    2: .same(proto: "height"),
    3: .same(proto: "period"),
    4: .standard(proto: "validator_slash_event"),
  ]

  fileprivate class _StorageClass {
    var _validatorAddress: String = String()
    var _height: UInt64 = 0
    var _period: UInt64 = 0
    var _validatorSlashEvent: Cosmos_Distribution_V1beta1_ValidatorSlashEvent? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _validatorAddress = source._validatorAddress
      _height = source._height
      _period = source._period
      _validatorSlashEvent = source._validatorSlashEvent
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._validatorAddress)
        case 2: try decoder.decodeSingularUInt64Field(value: &_storage._height)
        case 3: try decoder.decodeSingularUInt64Field(value: &_storage._period)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._validatorSlashEvent)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._validatorAddress.isEmpty {
        try visitor.visitSingularStringField(value: _storage._validatorAddress, fieldNumber: 1)
      }
      if _storage._height != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._height, fieldNumber: 2)
      }
      if _storage._period != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._period, fieldNumber: 3)
      }
      if let v = _storage._validatorSlashEvent {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_ValidatorSlashEventRecord, rhs: Cosmos_Distribution_V1beta1_ValidatorSlashEventRecord) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._validatorAddress != rhs_storage._validatorAddress {return false}
        if _storage._height != rhs_storage._height {return false}
        if _storage._period != rhs_storage._period {return false}
        if _storage._validatorSlashEvent != rhs_storage._validatorSlashEvent {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Distribution_V1beta1_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
    2: .standard(proto: "fee_pool"),
    3: .standard(proto: "delegator_withdraw_infos"),
    4: .standard(proto: "previous_proposer"),
    5: .standard(proto: "outstanding_rewards"),
    6: .standard(proto: "validator_accumulated_commissions"),
    7: .standard(proto: "validator_historical_rewards"),
    8: .standard(proto: "validator_current_rewards"),
    9: .standard(proto: "delegator_starting_infos"),
    10: .standard(proto: "validator_slash_events"),
  ]

  fileprivate class _StorageClass {
    var _params: Cosmos_Distribution_V1beta1_Params? = nil
    var _feePool: Cosmos_Distribution_V1beta1_FeePool? = nil
    var _delegatorWithdrawInfos: [Cosmos_Distribution_V1beta1_DelegatorWithdrawInfo] = []
    var _previousProposer: String = String()
    var _outstandingRewards: [Cosmos_Distribution_V1beta1_ValidatorOutstandingRewardsRecord] = []
    var _validatorAccumulatedCommissions: [Cosmos_Distribution_V1beta1_ValidatorAccumulatedCommissionRecord] = []
    var _validatorHistoricalRewards: [Cosmos_Distribution_V1beta1_ValidatorHistoricalRewardsRecord] = []
    var _validatorCurrentRewards: [Cosmos_Distribution_V1beta1_ValidatorCurrentRewardsRecord] = []
    var _delegatorStartingInfos: [Cosmos_Distribution_V1beta1_DelegatorStartingInfoRecord] = []
    var _validatorSlashEvents: [Cosmos_Distribution_V1beta1_ValidatorSlashEventRecord] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _params = source._params
      _feePool = source._feePool
      _delegatorWithdrawInfos = source._delegatorWithdrawInfos
      _previousProposer = source._previousProposer
      _outstandingRewards = source._outstandingRewards
      _validatorAccumulatedCommissions = source._validatorAccumulatedCommissions
      _validatorHistoricalRewards = source._validatorHistoricalRewards
      _validatorCurrentRewards = source._validatorCurrentRewards
      _delegatorStartingInfos = source._delegatorStartingInfos
      _validatorSlashEvents = source._validatorSlashEvents
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
        case 2: try decoder.decodeSingularMessageField(value: &_storage._feePool)
        case 3: try decoder.decodeRepeatedMessageField(value: &_storage._delegatorWithdrawInfos)
        case 4: try decoder.decodeSingularStringField(value: &_storage._previousProposer)
        case 5: try decoder.decodeRepeatedMessageField(value: &_storage._outstandingRewards)
        case 6: try decoder.decodeRepeatedMessageField(value: &_storage._validatorAccumulatedCommissions)
        case 7: try decoder.decodeRepeatedMessageField(value: &_storage._validatorHistoricalRewards)
        case 8: try decoder.decodeRepeatedMessageField(value: &_storage._validatorCurrentRewards)
        case 9: try decoder.decodeRepeatedMessageField(value: &_storage._delegatorStartingInfos)
        case 10: try decoder.decodeRepeatedMessageField(value: &_storage._validatorSlashEvents)
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
      if let v = _storage._feePool {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if !_storage._delegatorWithdrawInfos.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._delegatorWithdrawInfos, fieldNumber: 3)
      }
      if !_storage._previousProposer.isEmpty {
        try visitor.visitSingularStringField(value: _storage._previousProposer, fieldNumber: 4)
      }
      if !_storage._outstandingRewards.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._outstandingRewards, fieldNumber: 5)
      }
      if !_storage._validatorAccumulatedCommissions.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._validatorAccumulatedCommissions, fieldNumber: 6)
      }
      if !_storage._validatorHistoricalRewards.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._validatorHistoricalRewards, fieldNumber: 7)
      }
      if !_storage._validatorCurrentRewards.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._validatorCurrentRewards, fieldNumber: 8)
      }
      if !_storage._delegatorStartingInfos.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._delegatorStartingInfos, fieldNumber: 9)
      }
      if !_storage._validatorSlashEvents.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._validatorSlashEvents, fieldNumber: 10)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Distribution_V1beta1_GenesisState, rhs: Cosmos_Distribution_V1beta1_GenesisState) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._params != rhs_storage._params {return false}
        if _storage._feePool != rhs_storage._feePool {return false}
        if _storage._delegatorWithdrawInfos != rhs_storage._delegatorWithdrawInfos {return false}
        if _storage._previousProposer != rhs_storage._previousProposer {return false}
        if _storage._outstandingRewards != rhs_storage._outstandingRewards {return false}
        if _storage._validatorAccumulatedCommissions != rhs_storage._validatorAccumulatedCommissions {return false}
        if _storage._validatorHistoricalRewards != rhs_storage._validatorHistoricalRewards {return false}
        if _storage._validatorCurrentRewards != rhs_storage._validatorCurrentRewards {return false}
        if _storage._delegatorStartingInfos != rhs_storage._delegatorStartingInfos {return false}
        if _storage._validatorSlashEvents != rhs_storage._validatorSlashEvents {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
