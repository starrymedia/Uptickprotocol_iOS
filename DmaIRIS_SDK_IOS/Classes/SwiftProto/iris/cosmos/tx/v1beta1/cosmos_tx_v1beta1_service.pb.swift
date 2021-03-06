// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/tx/v1beta1/service.proto
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

/// BroadcastMode specifies the broadcast mode for the TxService.Broadcast RPC method.
enum Cosmos_Tx_V1beta1_BroadcastMode: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// zero-value for mode ordering
  case unspecified // = 0

  /// BROADCAST_MODE_BLOCK defines a tx broadcasting mode where the client waits for
  /// the tx to be committed in a block.
  case block // = 1

  /// BROADCAST_MODE_SYNC defines a tx broadcasting mode where the client waits for
  /// a CheckTx execution response only.
  case sync // = 2

  /// BROADCAST_MODE_ASYNC defines a tx broadcasting mode where the client returns
  /// immediately.
  case async // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .block
    case 2: self = .sync
    case 3: self = .async
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .block: return 1
    case .sync: return 2
    case .async: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmos_Tx_V1beta1_BroadcastMode: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmos_Tx_V1beta1_BroadcastMode] = [
    .unspecified,
    .block,
    .sync,
    .async,
  ]
}

#endif  // swift(>=4.2)

/// GetTxsEventRequest is the request type for the Service.TxsByEvents
/// RPC method.
struct Cosmos_Tx_V1beta1_GetTxsEventRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// events is the list of transaction event type.
  var events: [String] {
    get {return _storage._events}
    set {_uniqueStorage()._events = newValue}
  }

  /// pagination defines an pagination for the request.
  var pagination: Cosmos_Base_Query_V1beta1_PageRequest {
    get {return _storage._pagination ?? Cosmos_Base_Query_V1beta1_PageRequest()}
    set {_uniqueStorage()._pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  var hasPagination: Bool {return _storage._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  mutating func clearPagination() {_uniqueStorage()._pagination = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// GetTxsEventResponse is the response type for the Service.TxsByEvents
/// RPC method.
struct Cosmos_Tx_V1beta1_GetTxsEventResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// txs is the list of queried transactions.
  var txs: [Cosmos_Tx_V1beta1_Tx] {
    get {return _storage._txs}
    set {_uniqueStorage()._txs = newValue}
  }

  /// tx_responses is the list of queried TxResponses.
  var txResponses: [Cosmos_Base_Abci_V1beta1_TxResponse] {
    get {return _storage._txResponses}
    set {_uniqueStorage()._txResponses = newValue}
  }

  /// pagination defines an pagination for the response.
  var pagination: Cosmos_Base_Query_V1beta1_PageResponse {
    get {return _storage._pagination ?? Cosmos_Base_Query_V1beta1_PageResponse()}
    set {_uniqueStorage()._pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  var hasPagination: Bool {return _storage._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  mutating func clearPagination() {_uniqueStorage()._pagination = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// BroadcastTxRequest is the request type for the Service.BroadcastTxRequest
/// RPC method.
struct Cosmos_Tx_V1beta1_BroadcastTxRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// tx_bytes is the raw transaction.
  var txBytes: Data = SwiftProtobuf.Internal.emptyData

  var mode: Cosmos_Tx_V1beta1_BroadcastMode = .unspecified

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// BroadcastTxResponse is the response type for the
/// Service.BroadcastTx method.
struct Cosmos_Tx_V1beta1_BroadcastTxResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// tx_response is the queried TxResponses.
  var txResponse: Cosmos_Base_Abci_V1beta1_TxResponse {
    get {return _storage._txResponse ?? Cosmos_Base_Abci_V1beta1_TxResponse()}
    set {_uniqueStorage()._txResponse = newValue}
  }
  /// Returns true if `txResponse` has been explicitly set.
  var hasTxResponse: Bool {return _storage._txResponse != nil}
  /// Clears the value of `txResponse`. Subsequent reads from it will return its default value.
  mutating func clearTxResponse() {_uniqueStorage()._txResponse = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// SimulateRequest is the request type for the Service.Simulate
/// RPC method.
struct Cosmos_Tx_V1beta1_SimulateRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// tx is the transaction to simulate.
  var tx: Cosmos_Tx_V1beta1_Tx {
    get {return _storage._tx ?? Cosmos_Tx_V1beta1_Tx()}
    set {_uniqueStorage()._tx = newValue}
  }
  /// Returns true if `tx` has been explicitly set.
  var hasTx: Bool {return _storage._tx != nil}
  /// Clears the value of `tx`. Subsequent reads from it will return its default value.
  mutating func clearTx() {_uniqueStorage()._tx = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// SimulateResponse is the response type for the
/// Service.SimulateRPC method.
struct Cosmos_Tx_V1beta1_SimulateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// gas_info is the information about gas used in the simulation.
  var gasInfo: Cosmos_Base_Abci_V1beta1_GasInfo {
    get {return _storage._gasInfo ?? Cosmos_Base_Abci_V1beta1_GasInfo()}
    set {_uniqueStorage()._gasInfo = newValue}
  }
  /// Returns true if `gasInfo` has been explicitly set.
  var hasGasInfo: Bool {return _storage._gasInfo != nil}
  /// Clears the value of `gasInfo`. Subsequent reads from it will return its default value.
  mutating func clearGasInfo() {_uniqueStorage()._gasInfo = nil}

  /// result is the result of the simulation.
  var result: Cosmos_Base_Abci_V1beta1_Result {
    get {return _storage._result ?? Cosmos_Base_Abci_V1beta1_Result()}
    set {_uniqueStorage()._result = newValue}
  }
  /// Returns true if `result` has been explicitly set.
  var hasResult: Bool {return _storage._result != nil}
  /// Clears the value of `result`. Subsequent reads from it will return its default value.
  mutating func clearResult() {_uniqueStorage()._result = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// GetTxRequest is the request type for the Service.GetTx
/// RPC method.
struct Cosmos_Tx_V1beta1_GetTxRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// hash is the tx hash to query, encoded as a hex string.
  var hash: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// GetTxResponse is the response type for the Service.GetTx method.
struct Cosmos_Tx_V1beta1_GetTxResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// tx is the queried transaction.
  var tx: Cosmos_Tx_V1beta1_Tx {
    get {return _storage._tx ?? Cosmos_Tx_V1beta1_Tx()}
    set {_uniqueStorage()._tx = newValue}
  }
  /// Returns true if `tx` has been explicitly set.
  var hasTx: Bool {return _storage._tx != nil}
  /// Clears the value of `tx`. Subsequent reads from it will return its default value.
  mutating func clearTx() {_uniqueStorage()._tx = nil}

  /// tx_response is the queried TxResponses.
  var txResponse: Cosmos_Base_Abci_V1beta1_TxResponse {
    get {return _storage._txResponse ?? Cosmos_Base_Abci_V1beta1_TxResponse()}
    set {_uniqueStorage()._txResponse = newValue}
  }
  /// Returns true if `txResponse` has been explicitly set.
  var hasTxResponse: Bool {return _storage._txResponse != nil}
  /// Clears the value of `txResponse`. Subsequent reads from it will return its default value.
  mutating func clearTxResponse() {_uniqueStorage()._txResponse = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.tx.v1beta1"

extension Cosmos_Tx_V1beta1_BroadcastMode: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "BROADCAST_MODE_UNSPECIFIED"),
    1: .same(proto: "BROADCAST_MODE_BLOCK"),
    2: .same(proto: "BROADCAST_MODE_SYNC"),
    3: .same(proto: "BROADCAST_MODE_ASYNC"),
  ]
}

extension Cosmos_Tx_V1beta1_GetTxsEventRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetTxsEventRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "events"),
    2: .same(proto: "pagination"),
  ]

  fileprivate class _StorageClass {
    var _events: [String] = []
    var _pagination: Cosmos_Base_Query_V1beta1_PageRequest? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _events = source._events
      _pagination = source._pagination
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
        case 1: try decoder.decodeRepeatedStringField(value: &_storage._events)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._pagination)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._events.isEmpty {
        try visitor.visitRepeatedStringField(value: _storage._events, fieldNumber: 1)
      }
      if let v = _storage._pagination {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Tx_V1beta1_GetTxsEventRequest, rhs: Cosmos_Tx_V1beta1_GetTxsEventRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._events != rhs_storage._events {return false}
        if _storage._pagination != rhs_storage._pagination {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Tx_V1beta1_GetTxsEventResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetTxsEventResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "txs"),
    2: .standard(proto: "tx_responses"),
    3: .same(proto: "pagination"),
  ]

  fileprivate class _StorageClass {
    var _txs: [Cosmos_Tx_V1beta1_Tx] = []
    var _txResponses: [Cosmos_Base_Abci_V1beta1_TxResponse] = []
    var _pagination: Cosmos_Base_Query_V1beta1_PageResponse? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _txs = source._txs
      _txResponses = source._txResponses
      _pagination = source._pagination
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
        case 1: try decoder.decodeRepeatedMessageField(value: &_storage._txs)
        case 2: try decoder.decodeRepeatedMessageField(value: &_storage._txResponses)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._pagination)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._txs.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._txs, fieldNumber: 1)
      }
      if !_storage._txResponses.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._txResponses, fieldNumber: 2)
      }
      if let v = _storage._pagination {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Tx_V1beta1_GetTxsEventResponse, rhs: Cosmos_Tx_V1beta1_GetTxsEventResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._txs != rhs_storage._txs {return false}
        if _storage._txResponses != rhs_storage._txResponses {return false}
        if _storage._pagination != rhs_storage._pagination {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Tx_V1beta1_BroadcastTxRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BroadcastTxRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "tx_bytes"),
    2: .same(proto: "mode"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.txBytes)
      case 2: try decoder.decodeSingularEnumField(value: &self.mode)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.txBytes.isEmpty {
      try visitor.visitSingularBytesField(value: self.txBytes, fieldNumber: 1)
    }
    if self.mode != .unspecified {
      try visitor.visitSingularEnumField(value: self.mode, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Tx_V1beta1_BroadcastTxRequest, rhs: Cosmos_Tx_V1beta1_BroadcastTxRequest) -> Bool {
    if lhs.txBytes != rhs.txBytes {return false}
    if lhs.mode != rhs.mode {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Tx_V1beta1_BroadcastTxResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BroadcastTxResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "tx_response"),
  ]

  fileprivate class _StorageClass {
    var _txResponse: Cosmos_Base_Abci_V1beta1_TxResponse? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _txResponse = source._txResponse
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._txResponse)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._txResponse {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Tx_V1beta1_BroadcastTxResponse, rhs: Cosmos_Tx_V1beta1_BroadcastTxResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._txResponse != rhs_storage._txResponse {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Tx_V1beta1_SimulateRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SimulateRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tx"),
  ]

  fileprivate class _StorageClass {
    var _tx: Cosmos_Tx_V1beta1_Tx? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _tx = source._tx
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._tx)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._tx {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Tx_V1beta1_SimulateRequest, rhs: Cosmos_Tx_V1beta1_SimulateRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._tx != rhs_storage._tx {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Tx_V1beta1_SimulateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SimulateResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "gas_info"),
    2: .same(proto: "result"),
  ]

  fileprivate class _StorageClass {
    var _gasInfo: Cosmos_Base_Abci_V1beta1_GasInfo? = nil
    var _result: Cosmos_Base_Abci_V1beta1_Result? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _gasInfo = source._gasInfo
      _result = source._result
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._gasInfo)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._result)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._gasInfo {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._result {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Tx_V1beta1_SimulateResponse, rhs: Cosmos_Tx_V1beta1_SimulateResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._gasInfo != rhs_storage._gasInfo {return false}
        if _storage._result != rhs_storage._result {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Tx_V1beta1_GetTxRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetTxRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "hash"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.hash)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.hash.isEmpty {
      try visitor.visitSingularStringField(value: self.hash, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Tx_V1beta1_GetTxRequest, rhs: Cosmos_Tx_V1beta1_GetTxRequest) -> Bool {
    if lhs.hash != rhs.hash {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Tx_V1beta1_GetTxResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetTxResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tx"),
    2: .standard(proto: "tx_response"),
  ]

  fileprivate class _StorageClass {
    var _tx: Cosmos_Tx_V1beta1_Tx? = nil
    var _txResponse: Cosmos_Base_Abci_V1beta1_TxResponse? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _tx = source._tx
      _txResponse = source._txResponse
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._tx)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._txResponse)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._tx {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._txResponse {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Tx_V1beta1_GetTxResponse, rhs: Cosmos_Tx_V1beta1_GetTxResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._tx != rhs_storage._tx {return false}
        if _storage._txResponse != rhs_storage._txResponse {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
