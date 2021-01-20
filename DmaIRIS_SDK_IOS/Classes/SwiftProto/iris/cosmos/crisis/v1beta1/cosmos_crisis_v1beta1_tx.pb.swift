// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/crisis/v1beta1/tx.proto
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

/// MsgVerifyInvariant represents a message to verify a particular invariance.
struct Cosmos_Crisis_V1beta1_MsgVerifyInvariant {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var sender: String = String()

  var invariantModuleName: String = String()

  var invariantRoute: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgVerifyInvariantResponse defines the Msg/VerifyInvariant response type.
struct Cosmos_Crisis_V1beta1_MsgVerifyInvariantResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.crisis.v1beta1"

extension Cosmos_Crisis_V1beta1_MsgVerifyInvariant: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgVerifyInvariant"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .standard(proto: "invariant_module_name"),
    3: .standard(proto: "invariant_route"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.sender)
      case 2: try decoder.decodeSingularStringField(value: &self.invariantModuleName)
      case 3: try decoder.decodeSingularStringField(value: &self.invariantRoute)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.invariantModuleName.isEmpty {
      try visitor.visitSingularStringField(value: self.invariantModuleName, fieldNumber: 2)
    }
    if !self.invariantRoute.isEmpty {
      try visitor.visitSingularStringField(value: self.invariantRoute, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Crisis_V1beta1_MsgVerifyInvariant, rhs: Cosmos_Crisis_V1beta1_MsgVerifyInvariant) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.invariantModuleName != rhs.invariantModuleName {return false}
    if lhs.invariantRoute != rhs.invariantRoute {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Crisis_V1beta1_MsgVerifyInvariantResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgVerifyInvariantResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Crisis_V1beta1_MsgVerifyInvariantResponse, rhs: Cosmos_Crisis_V1beta1_MsgVerifyInvariantResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
