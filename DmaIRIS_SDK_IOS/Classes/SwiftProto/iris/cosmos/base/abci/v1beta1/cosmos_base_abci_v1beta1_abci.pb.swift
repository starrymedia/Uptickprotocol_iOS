// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/base/abci/v1beta1/abci.proto
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

/// TxResponse defines a structure containing relevant tx data and metadata. The
/// tags are stringified and the log is JSON decoded.
struct Cosmos_Base_Abci_V1beta1_TxResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The block height
  var height: Int64 {
    get {return _storage._height}
    set {_uniqueStorage()._height = newValue}
  }

  /// The transaction hash.
  var txhash: String {
    get {return _storage._txhash}
    set {_uniqueStorage()._txhash = newValue}
  }

  /// Namespace for the Code
  var codespace: String {
    get {return _storage._codespace}
    set {_uniqueStorage()._codespace = newValue}
  }

  /// Response code.
  var code: UInt32 {
    get {return _storage._code}
    set {_uniqueStorage()._code = newValue}
  }

  /// Result bytes, if any.
  var data: String {
    get {return _storage._data}
    set {_uniqueStorage()._data = newValue}
  }

  /// The output of the application's logger (raw string). May be
  /// non-deterministic.
  var rawLog: String {
    get {return _storage._rawLog}
    set {_uniqueStorage()._rawLog = newValue}
  }

  /// The output of the application's logger (typed). May be non-deterministic.
  var logs: [Cosmos_Base_Abci_V1beta1_ABCIMessageLog] {
    get {return _storage._logs}
    set {_uniqueStorage()._logs = newValue}
  }

  /// Additional information. May be non-deterministic.
  var info: String {
    get {return _storage._info}
    set {_uniqueStorage()._info = newValue}
  }

  /// Amount of gas requested for transaction.
  var gasWanted: Int64 {
    get {return _storage._gasWanted}
    set {_uniqueStorage()._gasWanted = newValue}
  }

  /// Amount of gas consumed by transaction.
  var gasUsed: Int64 {
    get {return _storage._gasUsed}
    set {_uniqueStorage()._gasUsed = newValue}
  }

  /// The request transaction bytes.
  var tx: SwiftProtobuf.Google_Protobuf_Any {
    get {return _storage._tx ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_uniqueStorage()._tx = newValue}
  }
  /// Returns true if `tx` has been explicitly set.
  var hasTx: Bool {return _storage._tx != nil}
  /// Clears the value of `tx`. Subsequent reads from it will return its default value.
  mutating func clearTx() {_uniqueStorage()._tx = nil}

  /// Time of the previous block. For heights > 1, it's the weighted median of
  /// the timestamps of the valid votes in the block.LastCommit. For height == 1,
  /// it's genesis time.
  var timestamp: String {
    get {return _storage._timestamp}
    set {_uniqueStorage()._timestamp = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// ABCIMessageLog defines a structure containing an indexed tx ABCI message log.
struct Cosmos_Base_Abci_V1beta1_ABCIMessageLog {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var msgIndex: UInt32 = 0

  var log: String = String()

  /// Events contains a slice of Event objects that were emitted during some
  /// execution.
  var events: [Cosmos_Base_Abci_V1beta1_StringEvent] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// StringEvent defines en Event object wrapper where all the attributes
/// contain key/value pairs that are strings instead of raw bytes.
struct Cosmos_Base_Abci_V1beta1_StringEvent {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var type: String = String()

  var attributes: [Cosmos_Base_Abci_V1beta1_Attribute] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Attribute defines an attribute wrapper where the key and value are
/// strings instead of raw bytes.
struct Cosmos_Base_Abci_V1beta1_Attribute {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var key: String = String()

  var value: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// GasInfo defines tx execution gas context.
struct Cosmos_Base_Abci_V1beta1_GasInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// GasWanted is the maximum units of work we allow this tx to perform.
  var gasWanted: UInt64 = 0

  /// GasUsed is the amount of gas actually consumed.
  var gasUsed: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Result is the union of ResponseFormat and ResponseCheckTx.
struct Cosmos_Base_Abci_V1beta1_Result {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Data is any data returned from message or handler execution. It MUST be
  /// length prefixed in order to separate data from multiple message executions.
  var data: Data = SwiftProtobuf.Internal.emptyData

  /// Log contains the log information from message or handler execution.
  var log: String = String()

  /// Events contains a slice of Event objects that were emitted during message
  /// or handler execution.
  var events: [Tendermint_Abci_Event] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// SimulationResponse defines the response generated when a transaction is
/// successfully simulated.
struct Cosmos_Base_Abci_V1beta1_SimulationResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var gasInfo: Cosmos_Base_Abci_V1beta1_GasInfo {
    get {return _storage._gasInfo ?? Cosmos_Base_Abci_V1beta1_GasInfo()}
    set {_uniqueStorage()._gasInfo = newValue}
  }
  /// Returns true if `gasInfo` has been explicitly set.
  var hasGasInfo: Bool {return _storage._gasInfo != nil}
  /// Clears the value of `gasInfo`. Subsequent reads from it will return its default value.
  mutating func clearGasInfo() {_uniqueStorage()._gasInfo = nil}

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

/// MsgData defines the data returned in a Result object during message
/// execution.
struct Cosmos_Base_Abci_V1beta1_MsgData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var msgType: String = String()

  var data: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// TxMsgData defines a list of MsgData. A transaction will have a MsgData object
/// for each message.
struct Cosmos_Base_Abci_V1beta1_TxMsgData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var data: [Cosmos_Base_Abci_V1beta1_MsgData] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// SearchTxsResult defines a structure for querying txs pageable
struct Cosmos_Base_Abci_V1beta1_SearchTxsResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Count of all txs
  var totalCount: UInt64 = 0

  /// Count of txs in current page
  var count: UInt64 = 0

  /// Index of current page, start from 1
  var pageNumber: UInt64 = 0

  /// Count of total pages
  var pageTotal: UInt64 = 0

  /// Max count txs per page
  var limit: UInt64 = 0

  /// List of txs in current page
  var txs: [Cosmos_Base_Abci_V1beta1_TxResponse] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.base.abci.v1beta1"

extension Cosmos_Base_Abci_V1beta1_TxResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TxResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "height"),
    2: .same(proto: "txhash"),
    3: .same(proto: "codespace"),
    4: .same(proto: "code"),
    5: .same(proto: "data"),
    6: .standard(proto: "raw_log"),
    7: .same(proto: "logs"),
    8: .same(proto: "info"),
    9: .standard(proto: "gas_wanted"),
    10: .standard(proto: "gas_used"),
    11: .same(proto: "tx"),
    12: .same(proto: "timestamp"),
  ]

  fileprivate class _StorageClass {
    var _height: Int64 = 0
    var _txhash: String = String()
    var _codespace: String = String()
    var _code: UInt32 = 0
    var _data: String = String()
    var _rawLog: String = String()
    var _logs: [Cosmos_Base_Abci_V1beta1_ABCIMessageLog] = []
    var _info: String = String()
    var _gasWanted: Int64 = 0
    var _gasUsed: Int64 = 0
    var _tx: SwiftProtobuf.Google_Protobuf_Any? = nil
    var _timestamp: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _height = source._height
      _txhash = source._txhash
      _codespace = source._codespace
      _code = source._code
      _data = source._data
      _rawLog = source._rawLog
      _logs = source._logs
      _info = source._info
      _gasWanted = source._gasWanted
      _gasUsed = source._gasUsed
      _tx = source._tx
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
        case 1: try decoder.decodeSingularInt64Field(value: &_storage._height)
        case 2: try decoder.decodeSingularStringField(value: &_storage._txhash)
        case 3: try decoder.decodeSingularStringField(value: &_storage._codespace)
        case 4: try decoder.decodeSingularUInt32Field(value: &_storage._code)
        case 5: try decoder.decodeSingularStringField(value: &_storage._data)
        case 6: try decoder.decodeSingularStringField(value: &_storage._rawLog)
        case 7: try decoder.decodeRepeatedMessageField(value: &_storage._logs)
        case 8: try decoder.decodeSingularStringField(value: &_storage._info)
        case 9: try decoder.decodeSingularInt64Field(value: &_storage._gasWanted)
        case 10: try decoder.decodeSingularInt64Field(value: &_storage._gasUsed)
        case 11: try decoder.decodeSingularMessageField(value: &_storage._tx)
        case 12: try decoder.decodeSingularStringField(value: &_storage._timestamp)
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
      if !_storage._txhash.isEmpty {
        try visitor.visitSingularStringField(value: _storage._txhash, fieldNumber: 2)
      }
      if !_storage._codespace.isEmpty {
        try visitor.visitSingularStringField(value: _storage._codespace, fieldNumber: 3)
      }
      if _storage._code != 0 {
        try visitor.visitSingularUInt32Field(value: _storage._code, fieldNumber: 4)
      }
      if !_storage._data.isEmpty {
        try visitor.visitSingularStringField(value: _storage._data, fieldNumber: 5)
      }
      if !_storage._rawLog.isEmpty {
        try visitor.visitSingularStringField(value: _storage._rawLog, fieldNumber: 6)
      }
      if !_storage._logs.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._logs, fieldNumber: 7)
      }
      if !_storage._info.isEmpty {
        try visitor.visitSingularStringField(value: _storage._info, fieldNumber: 8)
      }
      if _storage._gasWanted != 0 {
        try visitor.visitSingularInt64Field(value: _storage._gasWanted, fieldNumber: 9)
      }
      if _storage._gasUsed != 0 {
        try visitor.visitSingularInt64Field(value: _storage._gasUsed, fieldNumber: 10)
      }
      if let v = _storage._tx {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
      }
      if !_storage._timestamp.isEmpty {
        try visitor.visitSingularStringField(value: _storage._timestamp, fieldNumber: 12)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_TxResponse, rhs: Cosmos_Base_Abci_V1beta1_TxResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._height != rhs_storage._height {return false}
        if _storage._txhash != rhs_storage._txhash {return false}
        if _storage._codespace != rhs_storage._codespace {return false}
        if _storage._code != rhs_storage._code {return false}
        if _storage._data != rhs_storage._data {return false}
        if _storage._rawLog != rhs_storage._rawLog {return false}
        if _storage._logs != rhs_storage._logs {return false}
        if _storage._info != rhs_storage._info {return false}
        if _storage._gasWanted != rhs_storage._gasWanted {return false}
        if _storage._gasUsed != rhs_storage._gasUsed {return false}
        if _storage._tx != rhs_storage._tx {return false}
        if _storage._timestamp != rhs_storage._timestamp {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Abci_V1beta1_ABCIMessageLog: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ABCIMessageLog"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "msg_index"),
    2: .same(proto: "log"),
    3: .same(proto: "events"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt32Field(value: &self.msgIndex)
      case 2: try decoder.decodeSingularStringField(value: &self.log)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.events)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.msgIndex != 0 {
      try visitor.visitSingularUInt32Field(value: self.msgIndex, fieldNumber: 1)
    }
    if !self.log.isEmpty {
      try visitor.visitSingularStringField(value: self.log, fieldNumber: 2)
    }
    if !self.events.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.events, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_ABCIMessageLog, rhs: Cosmos_Base_Abci_V1beta1_ABCIMessageLog) -> Bool {
    if lhs.msgIndex != rhs.msgIndex {return false}
    if lhs.log != rhs.log {return false}
    if lhs.events != rhs.events {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Abci_V1beta1_StringEvent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StringEvent"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "attributes"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.type)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.attributes)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.type.isEmpty {
      try visitor.visitSingularStringField(value: self.type, fieldNumber: 1)
    }
    if !self.attributes.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.attributes, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_StringEvent, rhs: Cosmos_Base_Abci_V1beta1_StringEvent) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs.attributes != rhs.attributes {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Abci_V1beta1_Attribute: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Attribute"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.key)
      case 2: try decoder.decodeSingularStringField(value: &self.value)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.key.isEmpty {
      try visitor.visitSingularStringField(value: self.key, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_Attribute, rhs: Cosmos_Base_Abci_V1beta1_Attribute) -> Bool {
    if lhs.key != rhs.key {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Abci_V1beta1_GasInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GasInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "gas_wanted"),
    2: .standard(proto: "gas_used"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.gasWanted)
      case 2: try decoder.decodeSingularUInt64Field(value: &self.gasUsed)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.gasWanted != 0 {
      try visitor.visitSingularUInt64Field(value: self.gasWanted, fieldNumber: 1)
    }
    if self.gasUsed != 0 {
      try visitor.visitSingularUInt64Field(value: self.gasUsed, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_GasInfo, rhs: Cosmos_Base_Abci_V1beta1_GasInfo) -> Bool {
    if lhs.gasWanted != rhs.gasWanted {return false}
    if lhs.gasUsed != rhs.gasUsed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Abci_V1beta1_Result: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Result"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "data"),
    2: .same(proto: "log"),
    3: .same(proto: "events"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.data)
      case 2: try decoder.decodeSingularStringField(value: &self.log)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.events)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 1)
    }
    if !self.log.isEmpty {
      try visitor.visitSingularStringField(value: self.log, fieldNumber: 2)
    }
    if !self.events.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.events, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_Result, rhs: Cosmos_Base_Abci_V1beta1_Result) -> Bool {
    if lhs.data != rhs.data {return false}
    if lhs.log != rhs.log {return false}
    if lhs.events != rhs.events {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Abci_V1beta1_SimulationResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SimulationResponse"
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

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_SimulationResponse, rhs: Cosmos_Base_Abci_V1beta1_SimulationResponse) -> Bool {
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

extension Cosmos_Base_Abci_V1beta1_MsgData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "msg_type"),
    2: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.msgType)
      case 2: try decoder.decodeSingularBytesField(value: &self.data)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.msgType.isEmpty {
      try visitor.visitSingularStringField(value: self.msgType, fieldNumber: 1)
    }
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_MsgData, rhs: Cosmos_Base_Abci_V1beta1_MsgData) -> Bool {
    if lhs.msgType != rhs.msgType {return false}
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Abci_V1beta1_TxMsgData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TxMsgData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.data)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.data.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.data, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_TxMsgData, rhs: Cosmos_Base_Abci_V1beta1_TxMsgData) -> Bool {
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Abci_V1beta1_SearchTxsResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SearchTxsResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "total_count"),
    2: .same(proto: "count"),
    3: .standard(proto: "page_number"),
    4: .standard(proto: "page_total"),
    5: .same(proto: "limit"),
    6: .same(proto: "txs"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.totalCount)
      case 2: try decoder.decodeSingularUInt64Field(value: &self.count)
      case 3: try decoder.decodeSingularUInt64Field(value: &self.pageNumber)
      case 4: try decoder.decodeSingularUInt64Field(value: &self.pageTotal)
      case 5: try decoder.decodeSingularUInt64Field(value: &self.limit)
      case 6: try decoder.decodeRepeatedMessageField(value: &self.txs)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.totalCount != 0 {
      try visitor.visitSingularUInt64Field(value: self.totalCount, fieldNumber: 1)
    }
    if self.count != 0 {
      try visitor.visitSingularUInt64Field(value: self.count, fieldNumber: 2)
    }
    if self.pageNumber != 0 {
      try visitor.visitSingularUInt64Field(value: self.pageNumber, fieldNumber: 3)
    }
    if self.pageTotal != 0 {
      try visitor.visitSingularUInt64Field(value: self.pageTotal, fieldNumber: 4)
    }
    if self.limit != 0 {
      try visitor.visitSingularUInt64Field(value: self.limit, fieldNumber: 5)
    }
    if !self.txs.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.txs, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Abci_V1beta1_SearchTxsResult, rhs: Cosmos_Base_Abci_V1beta1_SearchTxsResult) -> Bool {
    if lhs.totalCount != rhs.totalCount {return false}
    if lhs.count != rhs.count {return false}
    if lhs.pageNumber != rhs.pageNumber {return false}
    if lhs.pageTotal != rhs.pageTotal {return false}
    if lhs.limit != rhs.limit {return false}
    if lhs.txs != rhs.txs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
