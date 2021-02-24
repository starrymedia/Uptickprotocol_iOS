//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: random/tx.proto
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


/// Usage: instantiate Irismod_Random_MsgClient, then call methods of this protocol to make API calls.
internal protocol Irismod_Random_MsgClientProtocol: GRPCClient {
  func requestRandom(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse>

}

extension Irismod_Random_MsgClientProtocol {

  /// RequestRandom defines a method for requesting a new random number.
  ///
  /// - Parameters:
  ///   - request: Request to send to RequestRandom.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func requestRandom(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse> {
    return self.makeUnaryCall(
      path: "/irismod.random.Msg/RequestRandom",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Irismod_Random_MsgClient: Irismod_Random_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the irismod.random.Msg service.
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
internal protocol Irismod_Random_MsgProvider: CallHandlerProvider {
  /// RequestRandom defines a method for requesting a new random number.
  func requestRandom(request: Irismod_Random_MsgRequestRandom, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Random_MsgRequestRandomResponse>
}

extension Irismod_Random_MsgProvider {
  internal var serviceName: Substring { return "irismod.random.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handleMethod(_ methodName: Substring, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "RequestRandom":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.requestRandom(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}
