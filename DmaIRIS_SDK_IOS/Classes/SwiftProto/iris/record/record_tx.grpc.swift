//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: record/tx.proto
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


/// Usage: instantiate Irismod_Record_MsgClient, then call methods of this protocol to make API calls.
internal protocol Irismod_Record_MsgClientProtocol: GRPCClient {
  func createRecord(
    _ request: Irismod_Record_MsgCreateRecord,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Record_MsgCreateRecord, Irismod_Record_MsgCreateRecordResponse>

}

extension Irismod_Record_MsgClientProtocol {

  /// CreateRecord defines a method for creating a new record.
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateRecord.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createRecord(
    _ request: Irismod_Record_MsgCreateRecord,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Record_MsgCreateRecord, Irismod_Record_MsgCreateRecordResponse> {
    return self.makeUnaryCall(
      path: "/irismod.record.Msg/CreateRecord",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Irismod_Record_MsgClient: Irismod_Record_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the irismod.record.Msg service.
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
internal protocol Irismod_Record_MsgProvider: CallHandlerProvider {
  /// CreateRecord defines a method for creating a new record.
  func createRecord(request: Irismod_Record_MsgCreateRecord, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Record_MsgCreateRecordResponse>
}

extension Irismod_Record_MsgProvider {
  internal var serviceName: Substring { return "irismod.record.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handleMethod(_ methodName: Substring, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "CreateRecord":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.createRecord(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}

