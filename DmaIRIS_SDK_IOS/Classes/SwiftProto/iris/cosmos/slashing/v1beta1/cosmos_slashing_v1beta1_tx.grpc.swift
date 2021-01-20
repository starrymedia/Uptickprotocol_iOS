//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/slashing/v1beta1/tx.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate Cosmos_Slashing_V1beta1_MsgClient, then call methods of this protocol to make API calls.
internal protocol Cosmos_Slashing_V1beta1_MsgClientProtocol: GRPCClient {
  func unjail(
    _ request: Cosmos_Slashing_V1beta1_MsgUnjail,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Slashing_V1beta1_MsgUnjail, Cosmos_Slashing_V1beta1_MsgUnjailResponse>

}

extension Cosmos_Slashing_V1beta1_MsgClientProtocol {

  /// Unjail defines a method for unjailing a jailed validator, thus returning
  /// them into the bonded validator set, so they can begin receiving provisions
  /// and rewards again.
  ///
  /// - Parameters:
  ///   - request: Request to send to Unjail.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func unjail(
    _ request: Cosmos_Slashing_V1beta1_MsgUnjail,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Slashing_V1beta1_MsgUnjail, Cosmos_Slashing_V1beta1_MsgUnjailResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.slashing.v1beta1.Msg/Unjail",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Cosmos_Slashing_V1beta1_MsgClient: Cosmos_Slashing_V1beta1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the cosmos.slashing.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  internal init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Cosmos_Slashing_V1beta1_MsgProvider: CallHandlerProvider {
  /// Unjail defines a method for unjailing a jailed validator, thus returning
  /// them into the bonded validator set, so they can begin receiving provisions
  /// and rewards again.
  func unjail(request: Cosmos_Slashing_V1beta1_MsgUnjail, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Slashing_V1beta1_MsgUnjailResponse>
}

extension Cosmos_Slashing_V1beta1_MsgProvider {
  internal var serviceName: Substring { return "cosmos.slashing.v1beta1.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handleMethod(_ methodName: Substring, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "Unjail":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.unjail(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}

