// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/gov/v1beta1/gov.proto
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

/// VoteOption enumerates the valid vote options for a given governance proposal.
enum Cosmos_Gov_V1beta1_VoteOption: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// VOTE_OPTION_UNSPECIFIED defines a no-op vote option.
  case unspecified // = 0

  /// VOTE_OPTION_YES defines a yes vote option.
  case yes // = 1

  /// VOTE_OPTION_ABSTAIN defines an abstain vote option.
  case abstain // = 2

  /// VOTE_OPTION_NO defines a no vote option.
  case no // = 3

  /// VOTE_OPTION_NO_WITH_VETO defines a no with veto vote option.
  case noWithVeto // = 4
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .yes
    case 2: self = .abstain
    case 3: self = .no
    case 4: self = .noWithVeto
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .yes: return 1
    case .abstain: return 2
    case .no: return 3
    case .noWithVeto: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmos_Gov_V1beta1_VoteOption: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmos_Gov_V1beta1_VoteOption] = [
    .unspecified,
    .yes,
    .abstain,
    .no,
    .noWithVeto,
  ]
}

#endif  // swift(>=4.2)

/// ProposalStatus enumerates the valid statuses of a proposal.
enum Cosmos_Gov_V1beta1_ProposalStatus: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// PROPOSAL_STATUS_UNSPECIFIED defines the default propopsal status.
  case unspecified // = 0

  /// PROPOSAL_STATUS_DEPOSIT_PERIOD defines a proposal status during the deposit
  /// period.
  case depositPeriod // = 1

  /// PROPOSAL_STATUS_VOTING_PERIOD defines a proposal status during the voting
  /// period.
  case votingPeriod // = 2

  /// PROPOSAL_STATUS_PASSED defines a proposal status of a proposal that has
  /// passed.
  case passed // = 3

  /// PROPOSAL_STATUS_REJECTED defines a proposal status of a proposal that has
  /// been rejected.
  case rejected // = 4

  /// PROPOSAL_STATUS_FAILED defines a proposal status of a proposal that has
  /// failed.
  case failed // = 5
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .depositPeriod
    case 2: self = .votingPeriod
    case 3: self = .passed
    case 4: self = .rejected
    case 5: self = .failed
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .depositPeriod: return 1
    case .votingPeriod: return 2
    case .passed: return 3
    case .rejected: return 4
    case .failed: return 5
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmos_Gov_V1beta1_ProposalStatus: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmos_Gov_V1beta1_ProposalStatus] = [
    .unspecified,
    .depositPeriod,
    .votingPeriod,
    .passed,
    .rejected,
    .failed,
  ]
}

#endif  // swift(>=4.2)

/// TextProposal defines a standard text proposal whose changes need to be
/// manually updated in case of approval.
struct Cosmos_Gov_V1beta1_TextProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var title: String = String()

  var description_p: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Deposit defines an amount deposited by an account address to an active
/// proposal.
struct Cosmos_Gov_V1beta1_Deposit {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var proposalID: UInt64 = 0

  var depositor: String = String()

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Proposal defines the core field members of a governance proposal.
struct Cosmos_Gov_V1beta1_Proposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var proposalID: UInt64 {
    get {return _storage._proposalID}
    set {_uniqueStorage()._proposalID = newValue}
  }

  var content: SwiftProtobuf.Google_Protobuf_Any {
    get {return _storage._content ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_uniqueStorage()._content = newValue}
  }
  /// Returns true if `content` has been explicitly set.
  var hasContent: Bool {return _storage._content != nil}
  /// Clears the value of `content`. Subsequent reads from it will return its default value.
  mutating func clearContent() {_uniqueStorage()._content = nil}

  var status: Cosmos_Gov_V1beta1_ProposalStatus {
    get {return _storage._status}
    set {_uniqueStorage()._status = newValue}
  }

  var finalTallyResult: Cosmos_Gov_V1beta1_TallyResult {
    get {return _storage._finalTallyResult ?? Cosmos_Gov_V1beta1_TallyResult()}
    set {_uniqueStorage()._finalTallyResult = newValue}
  }
  /// Returns true if `finalTallyResult` has been explicitly set.
  var hasFinalTallyResult: Bool {return _storage._finalTallyResult != nil}
  /// Clears the value of `finalTallyResult`. Subsequent reads from it will return its default value.
  mutating func clearFinalTallyResult() {_uniqueStorage()._finalTallyResult = nil}

  var submitTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._submitTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._submitTime = newValue}
  }
  /// Returns true if `submitTime` has been explicitly set.
  var hasSubmitTime: Bool {return _storage._submitTime != nil}
  /// Clears the value of `submitTime`. Subsequent reads from it will return its default value.
  mutating func clearSubmitTime() {_uniqueStorage()._submitTime = nil}

  var depositEndTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._depositEndTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._depositEndTime = newValue}
  }
  /// Returns true if `depositEndTime` has been explicitly set.
  var hasDepositEndTime: Bool {return _storage._depositEndTime != nil}
  /// Clears the value of `depositEndTime`. Subsequent reads from it will return its default value.
  mutating func clearDepositEndTime() {_uniqueStorage()._depositEndTime = nil}

  var totalDeposit: [Cosmos_Base_V1beta1_Coin] {
    get {return _storage._totalDeposit}
    set {_uniqueStorage()._totalDeposit = newValue}
  }

  var votingStartTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._votingStartTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._votingStartTime = newValue}
  }
  /// Returns true if `votingStartTime` has been explicitly set.
  var hasVotingStartTime: Bool {return _storage._votingStartTime != nil}
  /// Clears the value of `votingStartTime`. Subsequent reads from it will return its default value.
  mutating func clearVotingStartTime() {_uniqueStorage()._votingStartTime = nil}

  var votingEndTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._votingEndTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._votingEndTime = newValue}
  }
  /// Returns true if `votingEndTime` has been explicitly set.
  var hasVotingEndTime: Bool {return _storage._votingEndTime != nil}
  /// Clears the value of `votingEndTime`. Subsequent reads from it will return its default value.
  mutating func clearVotingEndTime() {_uniqueStorage()._votingEndTime = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// TallyResult defines a standard tally for a governance proposal.
struct Cosmos_Gov_V1beta1_TallyResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var yes: String = String()

  var abstain: String = String()

  var no: String = String()

  var noWithVeto: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Vote defines a vote on a governance proposal.
/// A Vote consists of a proposal ID, the voter, and the vote option.
struct Cosmos_Gov_V1beta1_Vote {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var proposalID: UInt64 = 0

  var voter: String = String()

  var option: Cosmos_Gov_V1beta1_VoteOption = .unspecified

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// DepositParams defines the params for deposits on governance proposals.
struct Cosmos_Gov_V1beta1_DepositParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///  Minimum deposit for a proposal to enter voting period.
  var minDeposit: [Cosmos_Base_V1beta1_Coin] {
    get {return _storage._minDeposit}
    set {_uniqueStorage()._minDeposit = newValue}
  }

  ///  Maximum period for Atom holders to deposit on a proposal. Initial value: 2
  ///  months.
  var maxDepositPeriod: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _storage._maxDepositPeriod ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_uniqueStorage()._maxDepositPeriod = newValue}
  }
  /// Returns true if `maxDepositPeriod` has been explicitly set.
  var hasMaxDepositPeriod: Bool {return _storage._maxDepositPeriod != nil}
  /// Clears the value of `maxDepositPeriod`. Subsequent reads from it will return its default value.
  mutating func clearMaxDepositPeriod() {_uniqueStorage()._maxDepositPeriod = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// VotingParams defines the params for voting on governance proposals.
struct Cosmos_Gov_V1beta1_VotingParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///  Length of the voting period.
  var votingPeriod: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _storage._votingPeriod ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_uniqueStorage()._votingPeriod = newValue}
  }
  /// Returns true if `votingPeriod` has been explicitly set.
  var hasVotingPeriod: Bool {return _storage._votingPeriod != nil}
  /// Clears the value of `votingPeriod`. Subsequent reads from it will return its default value.
  mutating func clearVotingPeriod() {_uniqueStorage()._votingPeriod = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// TallyParams defines the params for tallying votes on governance proposals.
struct Cosmos_Gov_V1beta1_TallyParams {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///  Minimum percentage of total stake needed to vote for a result to be
  ///  considered valid.
  var quorum: Data = SwiftProtobuf.Internal.emptyData

  ///  Minimum proportion of Yes votes for proposal to pass. Default value: 0.5.
  var threshold: Data = SwiftProtobuf.Internal.emptyData

  ///  Minimum value of Veto votes to Total votes ratio for proposal to be
  ///  vetoed. Default value: 1/3.
  var vetoThreshold: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.gov.v1beta1"

extension Cosmos_Gov_V1beta1_VoteOption: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "VOTE_OPTION_UNSPECIFIED"),
    1: .same(proto: "VOTE_OPTION_YES"),
    2: .same(proto: "VOTE_OPTION_ABSTAIN"),
    3: .same(proto: "VOTE_OPTION_NO"),
    4: .same(proto: "VOTE_OPTION_NO_WITH_VETO"),
  ]
}

extension Cosmos_Gov_V1beta1_ProposalStatus: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PROPOSAL_STATUS_UNSPECIFIED"),
    1: .same(proto: "PROPOSAL_STATUS_DEPOSIT_PERIOD"),
    2: .same(proto: "PROPOSAL_STATUS_VOTING_PERIOD"),
    3: .same(proto: "PROPOSAL_STATUS_PASSED"),
    4: .same(proto: "PROPOSAL_STATUS_REJECTED"),
    5: .same(proto: "PROPOSAL_STATUS_FAILED"),
  ]
}

extension Cosmos_Gov_V1beta1_TextProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TextProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.title)
      case 2: try decoder.decodeSingularStringField(value: &self.description_p)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Gov_V1beta1_TextProposal, rhs: Cosmos_Gov_V1beta1_TextProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_Deposit: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Deposit"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proposal_id"),
    2: .same(proto: "depositor"),
    3: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.proposalID)
      case 2: try decoder.decodeSingularStringField(value: &self.depositor)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.amount)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.proposalID != 0 {
      try visitor.visitSingularUInt64Field(value: self.proposalID, fieldNumber: 1)
    }
    if !self.depositor.isEmpty {
      try visitor.visitSingularStringField(value: self.depositor, fieldNumber: 2)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Gov_V1beta1_Deposit, rhs: Cosmos_Gov_V1beta1_Deposit) -> Bool {
    if lhs.proposalID != rhs.proposalID {return false}
    if lhs.depositor != rhs.depositor {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_Proposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Proposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proposal_id"),
    2: .same(proto: "content"),
    3: .same(proto: "status"),
    4: .standard(proto: "final_tally_result"),
    5: .standard(proto: "submit_time"),
    6: .standard(proto: "deposit_end_time"),
    7: .standard(proto: "total_deposit"),
    8: .standard(proto: "voting_start_time"),
    9: .standard(proto: "voting_end_time"),
  ]

  fileprivate class _StorageClass {
    var _proposalID: UInt64 = 0
    var _content: SwiftProtobuf.Google_Protobuf_Any? = nil
    var _status: Cosmos_Gov_V1beta1_ProposalStatus = .unspecified
    var _finalTallyResult: Cosmos_Gov_V1beta1_TallyResult? = nil
    var _submitTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _depositEndTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _totalDeposit: [Cosmos_Base_V1beta1_Coin] = []
    var _votingStartTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _votingEndTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _proposalID = source._proposalID
      _content = source._content
      _status = source._status
      _finalTallyResult = source._finalTallyResult
      _submitTime = source._submitTime
      _depositEndTime = source._depositEndTime
      _totalDeposit = source._totalDeposit
      _votingStartTime = source._votingStartTime
      _votingEndTime = source._votingEndTime
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
        case 1: try decoder.decodeSingularUInt64Field(value: &_storage._proposalID)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._content)
        case 3: try decoder.decodeSingularEnumField(value: &_storage._status)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._finalTallyResult)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._submitTime)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._depositEndTime)
        case 7: try decoder.decodeRepeatedMessageField(value: &_storage._totalDeposit)
        case 8: try decoder.decodeSingularMessageField(value: &_storage._votingStartTime)
        case 9: try decoder.decodeSingularMessageField(value: &_storage._votingEndTime)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._proposalID != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._proposalID, fieldNumber: 1)
      }
      if let v = _storage._content {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if _storage._status != .unspecified {
        try visitor.visitSingularEnumField(value: _storage._status, fieldNumber: 3)
      }
      if let v = _storage._finalTallyResult {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._submitTime {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._depositEndTime {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if !_storage._totalDeposit.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._totalDeposit, fieldNumber: 7)
      }
      if let v = _storage._votingStartTime {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
      }
      if let v = _storage._votingEndTime {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Gov_V1beta1_Proposal, rhs: Cosmos_Gov_V1beta1_Proposal) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._proposalID != rhs_storage._proposalID {return false}
        if _storage._content != rhs_storage._content {return false}
        if _storage._status != rhs_storage._status {return false}
        if _storage._finalTallyResult != rhs_storage._finalTallyResult {return false}
        if _storage._submitTime != rhs_storage._submitTime {return false}
        if _storage._depositEndTime != rhs_storage._depositEndTime {return false}
        if _storage._totalDeposit != rhs_storage._totalDeposit {return false}
        if _storage._votingStartTime != rhs_storage._votingStartTime {return false}
        if _storage._votingEndTime != rhs_storage._votingEndTime {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_TallyResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TallyResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "yes"),
    2: .same(proto: "abstain"),
    3: .same(proto: "no"),
    4: .standard(proto: "no_with_veto"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.yes)
      case 2: try decoder.decodeSingularStringField(value: &self.abstain)
      case 3: try decoder.decodeSingularStringField(value: &self.no)
      case 4: try decoder.decodeSingularStringField(value: &self.noWithVeto)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.yes.isEmpty {
      try visitor.visitSingularStringField(value: self.yes, fieldNumber: 1)
    }
    if !self.abstain.isEmpty {
      try visitor.visitSingularStringField(value: self.abstain, fieldNumber: 2)
    }
    if !self.no.isEmpty {
      try visitor.visitSingularStringField(value: self.no, fieldNumber: 3)
    }
    if !self.noWithVeto.isEmpty {
      try visitor.visitSingularStringField(value: self.noWithVeto, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Gov_V1beta1_TallyResult, rhs: Cosmos_Gov_V1beta1_TallyResult) -> Bool {
    if lhs.yes != rhs.yes {return false}
    if lhs.abstain != rhs.abstain {return false}
    if lhs.no != rhs.no {return false}
    if lhs.noWithVeto != rhs.noWithVeto {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_Vote: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Vote"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "proposal_id"),
    2: .same(proto: "voter"),
    3: .same(proto: "option"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.proposalID)
      case 2: try decoder.decodeSingularStringField(value: &self.voter)
      case 3: try decoder.decodeSingularEnumField(value: &self.option)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.proposalID != 0 {
      try visitor.visitSingularUInt64Field(value: self.proposalID, fieldNumber: 1)
    }
    if !self.voter.isEmpty {
      try visitor.visitSingularStringField(value: self.voter, fieldNumber: 2)
    }
    if self.option != .unspecified {
      try visitor.visitSingularEnumField(value: self.option, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Gov_V1beta1_Vote, rhs: Cosmos_Gov_V1beta1_Vote) -> Bool {
    if lhs.proposalID != rhs.proposalID {return false}
    if lhs.voter != rhs.voter {return false}
    if lhs.option != rhs.option {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_DepositParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DepositParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "min_deposit"),
    2: .standard(proto: "max_deposit_period"),
  ]

  fileprivate class _StorageClass {
    var _minDeposit: [Cosmos_Base_V1beta1_Coin] = []
    var _maxDepositPeriod: SwiftProtobuf.Google_Protobuf_Duration? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _minDeposit = source._minDeposit
      _maxDepositPeriod = source._maxDepositPeriod
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
        case 1: try decoder.decodeRepeatedMessageField(value: &_storage._minDeposit)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._maxDepositPeriod)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._minDeposit.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._minDeposit, fieldNumber: 1)
      }
      if let v = _storage._maxDepositPeriod {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Gov_V1beta1_DepositParams, rhs: Cosmos_Gov_V1beta1_DepositParams) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._minDeposit != rhs_storage._minDeposit {return false}
        if _storage._maxDepositPeriod != rhs_storage._maxDepositPeriod {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_VotingParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".VotingParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "voting_period"),
  ]

  fileprivate class _StorageClass {
    var _votingPeriod: SwiftProtobuf.Google_Protobuf_Duration? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _votingPeriod = source._votingPeriod
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._votingPeriod)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._votingPeriod {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Gov_V1beta1_VotingParams, rhs: Cosmos_Gov_V1beta1_VotingParams) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._votingPeriod != rhs_storage._votingPeriod {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Gov_V1beta1_TallyParams: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TallyParams"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "quorum"),
    2: .same(proto: "threshold"),
    3: .standard(proto: "veto_threshold"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.quorum)
      case 2: try decoder.decodeSingularBytesField(value: &self.threshold)
      case 3: try decoder.decodeSingularBytesField(value: &self.vetoThreshold)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.quorum.isEmpty {
      try visitor.visitSingularBytesField(value: self.quorum, fieldNumber: 1)
    }
    if !self.threshold.isEmpty {
      try visitor.visitSingularBytesField(value: self.threshold, fieldNumber: 2)
    }
    if !self.vetoThreshold.isEmpty {
      try visitor.visitSingularBytesField(value: self.vetoThreshold, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Gov_V1beta1_TallyParams, rhs: Cosmos_Gov_V1beta1_TallyParams) -> Bool {
    if lhs.quorum != rhs.quorum {return false}
    if lhs.threshold != rhs.threshold {return false}
    if lhs.vetoThreshold != rhs.vetoThreshold {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}