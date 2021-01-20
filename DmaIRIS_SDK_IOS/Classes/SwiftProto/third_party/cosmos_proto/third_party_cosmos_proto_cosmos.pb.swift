// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos_proto/cosmos.proto
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

// MARK: - Extension support defined in cosmos.proto.

extension Google_Protobuf_FieldOptions {

  var CosmosProto_acceptsInterface: String {
    get {return getExtensionValue(ext: CosmosProto_Extensions_accepts_interface) ?? String()}
    set {setExtensionValue(ext: CosmosProto_Extensions_accepts_interface, value: newValue)}
  }
  /// Returns true if extension `CosmosProto_Extensions_accepts_interface`
  /// has been explicitly set.
  var hasCosmosProto_acceptsInterface: Bool {
    return hasExtensionValue(ext: CosmosProto_Extensions_accepts_interface)
  }
  /// Clears the value of extension `CosmosProto_Extensions_accepts_interface`.
  /// Subsequent reads from it will return its default value.
  mutating func clearCosmosProto_acceptsInterface() {
    clearExtensionValue(ext: CosmosProto_Extensions_accepts_interface)
  }
}

extension Google_Protobuf_MessageOptions {

  var CosmosProto_interfaceType: String {
    get {return getExtensionValue(ext: CosmosProto_Extensions_interface_type) ?? String()}
    set {setExtensionValue(ext: CosmosProto_Extensions_interface_type, value: newValue)}
  }
  /// Returns true if extension `CosmosProto_Extensions_interface_type`
  /// has been explicitly set.
  var hasCosmosProto_interfaceType: Bool {
    return hasExtensionValue(ext: CosmosProto_Extensions_interface_type)
  }
  /// Clears the value of extension `CosmosProto_Extensions_interface_type`.
  /// Subsequent reads from it will return its default value.
  mutating func clearCosmosProto_interfaceType() {
    clearExtensionValue(ext: CosmosProto_Extensions_interface_type)
  }

  var CosmosProto_implementsInterface: String {
    get {return getExtensionValue(ext: CosmosProto_Extensions_implements_interface) ?? String()}
    set {setExtensionValue(ext: CosmosProto_Extensions_implements_interface, value: newValue)}
  }
  /// Returns true if extension `CosmosProto_Extensions_implements_interface`
  /// has been explicitly set.
  var hasCosmosProto_implementsInterface: Bool {
    return hasExtensionValue(ext: CosmosProto_Extensions_implements_interface)
  }
  /// Clears the value of extension `CosmosProto_Extensions_implements_interface`.
  /// Subsequent reads from it will return its default value.
  mutating func clearCosmosProto_implementsInterface() {
    clearExtensionValue(ext: CosmosProto_Extensions_implements_interface)
  }

}

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
let CosmosProto_Cosmos_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  CosmosProto_Extensions_interface_type,
  CosmosProto_Extensions_implements_interface,
  CosmosProto_Extensions_accepts_interface
]

let CosmosProto_Extensions_interface_type = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 93001,
  fieldName: "cosmos_proto.interface_type"
)

let CosmosProto_Extensions_implements_interface = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 93002,
  fieldName: "cosmos_proto.implements_interface"
)

let CosmosProto_Extensions_accepts_interface = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalExtensionField<SwiftProtobuf.ProtobufString>, Google_Protobuf_FieldOptions>(
  _protobuf_fieldNumber: 93001,
  fieldName: "cosmos_proto.accepts_interface"
)
