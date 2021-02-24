//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: token/tx.proto
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


/// Usage: instantiate Irismod_Token_MsgClient, then call methods of this protocol to make API calls.
internal protocol Irismod_Token_MsgClientProtocol: GRPCClient {
  func issueToken(
    _ request: Irismod_Token_MsgIssueToken,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Token_MsgIssueToken, Irismod_Token_MsgIssueTokenResponse>

  func editToken(
    _ request: Irismod_Token_MsgEditToken,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Token_MsgEditToken, Irismod_Token_MsgEditTokenResponse>

  func mintToken(
    _ request: Irismod_Token_MsgMintToken,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Token_MsgMintToken, Irismod_Token_MsgMintTokenResponse>

  func burnToken(
    _ request: Irismod_Token_MsgBurnToken,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Token_MsgBurnToken, Irismod_Token_MsgBurnTokenResponse>

  func transferTokenOwner(
    _ request: Irismod_Token_MsgTransferTokenOwner,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Token_MsgTransferTokenOwner, Irismod_Token_MsgTransferTokenOwnerResponse>

}

extension Irismod_Token_MsgClientProtocol {

  /// IssueToken defines a method for issuing a new token.
  ///
  /// - Parameters:
  ///   - request: Request to send to IssueToken.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func issueToken(
    _ request: Irismod_Token_MsgIssueToken,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Token_MsgIssueToken, Irismod_Token_MsgIssueTokenResponse> {
    return self.makeUnaryCall(
      path: "/irismod.token.Msg/IssueToken",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// EditToken defines a method for editing a token.
  ///
  /// - Parameters:
  ///   - request: Request to send to EditToken.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func editToken(
    _ request: Irismod_Token_MsgEditToken,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Token_MsgEditToken, Irismod_Token_MsgEditTokenResponse> {
    return self.makeUnaryCall(
      path: "/irismod.token.Msg/EditToken",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// MintToken defines a method for minting some tokens.
  ///
  /// - Parameters:
  ///   - request: Request to send to MintToken.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func mintToken(
    _ request: Irismod_Token_MsgMintToken,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Token_MsgMintToken, Irismod_Token_MsgMintTokenResponse> {
    return self.makeUnaryCall(
      path: "/irismod.token.Msg/MintToken",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// BurnToken defines a method for burning some tokens.
  ///
  /// - Parameters:
  ///   - request: Request to send to BurnToken.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func burnToken(
    _ request: Irismod_Token_MsgBurnToken,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Token_MsgBurnToken, Irismod_Token_MsgBurnTokenResponse> {
    return self.makeUnaryCall(
      path: "/irismod.token.Msg/BurnToken",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// TransferTokenOwner defines a method for minting some tokens.
  ///
  /// - Parameters:
  ///   - request: Request to send to TransferTokenOwner.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func transferTokenOwner(
    _ request: Irismod_Token_MsgTransferTokenOwner,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Token_MsgTransferTokenOwner, Irismod_Token_MsgTransferTokenOwnerResponse> {
    return self.makeUnaryCall(
      path: "/irismod.token.Msg/TransferTokenOwner",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Irismod_Token_MsgClient: Irismod_Token_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the irismod.token.Msg service.
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
internal protocol Irismod_Token_MsgProvider: CallHandlerProvider {
  /// IssueToken defines a method for issuing a new token.
  func issueToken(request: Irismod_Token_MsgIssueToken, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Token_MsgIssueTokenResponse>
  /// EditToken defines a method for editing a token.
  func editToken(request: Irismod_Token_MsgEditToken, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Token_MsgEditTokenResponse>
  /// MintToken defines a method for minting some tokens.
  func mintToken(request: Irismod_Token_MsgMintToken, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Token_MsgMintTokenResponse>
  /// BurnToken defines a method for burning some tokens.
  func burnToken(request: Irismod_Token_MsgBurnToken, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Token_MsgBurnTokenResponse>
  /// TransferTokenOwner defines a method for minting some tokens.
  func transferTokenOwner(request: Irismod_Token_MsgTransferTokenOwner, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Token_MsgTransferTokenOwnerResponse>
}

extension Irismod_Token_MsgProvider {
  internal var serviceName: Substring { return "irismod.token.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handleMethod(_ methodName: Substring, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "IssueToken":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.issueToken(request: request, context: context)
        }
      }

    case "EditToken":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.editToken(request: request, context: context)
        }
      }

    case "MintToken":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.mintToken(request: request, context: context)
        }
      }

    case "BurnToken":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.burnToken(request: request, context: context)
        }
      }

    case "TransferTokenOwner":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.transferTokenOwner(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}
