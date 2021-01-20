//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: service/tx.proto
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


/// Usage: instantiate Irismod_Service_MsgClient, then call methods of this protocol to make API calls.
internal protocol Irismod_Service_MsgClientProtocol: GRPCClient {
  func defineService(
    _ request: Irismod_Service_MsgDefineService,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgDefineService, Irismod_Service_MsgDefineServiceResponse>

  func bindService(
    _ request: Irismod_Service_MsgBindService,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgBindService, Irismod_Service_MsgBindServiceResponse>

  func updateServiceBinding(
    _ request: Irismod_Service_MsgUpdateServiceBinding,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgUpdateServiceBinding, Irismod_Service_MsgUpdateServiceBindingResponse>

  func setWithdrawAddress(
    _ request: Irismod_Service_MsgSetWithdrawAddress,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgSetWithdrawAddress, Irismod_Service_MsgSetWithdrawAddressResponse>

  func enableServiceBinding(
    _ request: Irismod_Service_MsgEnableServiceBinding,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgEnableServiceBinding, Irismod_Service_MsgEnableServiceBindingResponse>

  func disableServiceBinding(
    _ request: Irismod_Service_MsgDisableServiceBinding,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgDisableServiceBinding, Irismod_Service_MsgDisableServiceBindingResponse>

  func refundServiceDeposit(
    _ request: Irismod_Service_MsgRefundServiceDeposit,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgRefundServiceDeposit, Irismod_Service_MsgRefundServiceDepositResponse>

  func callService(
    _ request: Irismod_Service_MsgCallService,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgCallService, Irismod_Service_MsgCallServiceResponse>

  func respondService(
    _ request: Irismod_Service_MsgRespondService,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgRespondService, Irismod_Service_MsgRespondServiceResponse>

  func pauseRequestContext(
    _ request: Irismod_Service_MsgPauseRequestContext,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgPauseRequestContext, Irismod_Service_MsgPauseRequestContextResponse>

  func startRequestContext(
    _ request: Irismod_Service_MsgStartRequestContext,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgStartRequestContext, Irismod_Service_MsgStartRequestContextResponse>

  func killRequestContext(
    _ request: Irismod_Service_MsgKillRequestContext,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgKillRequestContext, Irismod_Service_MsgKillRequestContextResponse>

  func updateRequestContext(
    _ request: Irismod_Service_MsgUpdateRequestContext,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgUpdateRequestContext, Irismod_Service_MsgUpdateRequestContextResponse>

  func withdrawEarnedFees(
    _ request: Irismod_Service_MsgWithdrawEarnedFees,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Service_MsgWithdrawEarnedFees, Irismod_Service_MsgWithdrawEarnedFeesResponse>

}

extension Irismod_Service_MsgClientProtocol {

  /// DefineService defines a method for define a new service.
  ///
  /// - Parameters:
  ///   - request: Request to send to DefineService.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func defineService(
    _ request: Irismod_Service_MsgDefineService,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgDefineService, Irismod_Service_MsgDefineServiceResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/DefineService",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// BindService defines a method for bind a server.
  ///
  /// - Parameters:
  ///   - request: Request to send to BindService.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func bindService(
    _ request: Irismod_Service_MsgBindService,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgBindService, Irismod_Service_MsgBindServiceResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/BindService",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// UpdateServiceBinding defines a method for update a service binding.
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateServiceBinding.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateServiceBinding(
    _ request: Irismod_Service_MsgUpdateServiceBinding,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgUpdateServiceBinding, Irismod_Service_MsgUpdateServiceBindingResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/UpdateServiceBinding",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// SetWithdrawAddress defines a method for setting a withdraw address.
  ///
  /// - Parameters:
  ///   - request: Request to send to SetWithdrawAddress.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func setWithdrawAddress(
    _ request: Irismod_Service_MsgSetWithdrawAddress,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgSetWithdrawAddress, Irismod_Service_MsgSetWithdrawAddressResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/SetWithdrawAddress",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// EnableServiceBinding defines a method for enabling a service binding.
  ///
  /// - Parameters:
  ///   - request: Request to send to EnableServiceBinding.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func enableServiceBinding(
    _ request: Irismod_Service_MsgEnableServiceBinding,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgEnableServiceBinding, Irismod_Service_MsgEnableServiceBindingResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/EnableServiceBinding",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// DisableServiceBinding defines a method for disabling a service binding.
  ///
  /// - Parameters:
  ///   - request: Request to send to DisableServiceBinding.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func disableServiceBinding(
    _ request: Irismod_Service_MsgDisableServiceBinding,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgDisableServiceBinding, Irismod_Service_MsgDisableServiceBindingResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/DisableServiceBinding",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// RefundServiceDeposit defines a method for refunding a fee.
  ///
  /// - Parameters:
  ///   - request: Request to send to RefundServiceDeposit.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func refundServiceDeposit(
    _ request: Irismod_Service_MsgRefundServiceDeposit,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgRefundServiceDeposit, Irismod_Service_MsgRefundServiceDepositResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/RefundServiceDeposit",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// CallService defines a method for calling a service.
  ///
  /// - Parameters:
  ///   - request: Request to send to CallService.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func callService(
    _ request: Irismod_Service_MsgCallService,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgCallService, Irismod_Service_MsgCallServiceResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/CallService",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// RespondService defines a method for responding a service.
  ///
  /// - Parameters:
  ///   - request: Request to send to RespondService.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func respondService(
    _ request: Irismod_Service_MsgRespondService,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgRespondService, Irismod_Service_MsgRespondServiceResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/RespondService",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// PauseRequestContext defines a method for pausing a service call.
  ///
  /// - Parameters:
  ///   - request: Request to send to PauseRequestContext.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func pauseRequestContext(
    _ request: Irismod_Service_MsgPauseRequestContext,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgPauseRequestContext, Irismod_Service_MsgPauseRequestContextResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/PauseRequestContext",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// StartRequestContext defines a method for starting a service call.
  ///
  /// - Parameters:
  ///   - request: Request to send to StartRequestContext.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func startRequestContext(
    _ request: Irismod_Service_MsgStartRequestContext,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgStartRequestContext, Irismod_Service_MsgStartRequestContextResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/StartRequestContext",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// KillRequestContext defines a method for killing a service call.
  ///
  /// - Parameters:
  ///   - request: Request to send to KillRequestContext.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func killRequestContext(
    _ request: Irismod_Service_MsgKillRequestContext,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgKillRequestContext, Irismod_Service_MsgKillRequestContextResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/KillRequestContext",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// UpdateRequestContext defines a method for updating a service call.
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateRequestContext.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateRequestContext(
    _ request: Irismod_Service_MsgUpdateRequestContext,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgUpdateRequestContext, Irismod_Service_MsgUpdateRequestContextResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/UpdateRequestContext",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// WithdrawEarnedFees defines a method for Withdrawing a earned fees.
  ///
  /// - Parameters:
  ///   - request: Request to send to WithdrawEarnedFees.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func withdrawEarnedFees(
    _ request: Irismod_Service_MsgWithdrawEarnedFees,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Service_MsgWithdrawEarnedFees, Irismod_Service_MsgWithdrawEarnedFeesResponse> {
    return self.makeUnaryCall(
      path: "/irismod.service.Msg/WithdrawEarnedFees",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Irismod_Service_MsgClient: Irismod_Service_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the irismod.service.Msg service.
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
internal protocol Irismod_Service_MsgProvider: CallHandlerProvider {
  /// DefineService defines a method for define a new service.
  func defineService(request: Irismod_Service_MsgDefineService, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgDefineServiceResponse>
  /// BindService defines a method for bind a server.
  func bindService(request: Irismod_Service_MsgBindService, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgBindServiceResponse>
  /// UpdateServiceBinding defines a method for update a service binding.
  func updateServiceBinding(request: Irismod_Service_MsgUpdateServiceBinding, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgUpdateServiceBindingResponse>
  /// SetWithdrawAddress defines a method for setting a withdraw address.
  func setWithdrawAddress(request: Irismod_Service_MsgSetWithdrawAddress, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgSetWithdrawAddressResponse>
  /// EnableServiceBinding defines a method for enabling a service binding.
  func enableServiceBinding(request: Irismod_Service_MsgEnableServiceBinding, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgEnableServiceBindingResponse>
  /// DisableServiceBinding defines a method for disabling a service binding.
  func disableServiceBinding(request: Irismod_Service_MsgDisableServiceBinding, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgDisableServiceBindingResponse>
  /// RefundServiceDeposit defines a method for refunding a fee.
  func refundServiceDeposit(request: Irismod_Service_MsgRefundServiceDeposit, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgRefundServiceDepositResponse>
  /// CallService defines a method for calling a service.
  func callService(request: Irismod_Service_MsgCallService, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgCallServiceResponse>
  /// RespondService defines a method for responding a service.
  func respondService(request: Irismod_Service_MsgRespondService, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgRespondServiceResponse>
  /// PauseRequestContext defines a method for pausing a service call.
  func pauseRequestContext(request: Irismod_Service_MsgPauseRequestContext, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgPauseRequestContextResponse>
  /// StartRequestContext defines a method for starting a service call.
  func startRequestContext(request: Irismod_Service_MsgStartRequestContext, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgStartRequestContextResponse>
  /// KillRequestContext defines a method for killing a service call.
  func killRequestContext(request: Irismod_Service_MsgKillRequestContext, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgKillRequestContextResponse>
  /// UpdateRequestContext defines a method for updating a service call.
  func updateRequestContext(request: Irismod_Service_MsgUpdateRequestContext, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgUpdateRequestContextResponse>
  /// WithdrawEarnedFees defines a method for Withdrawing a earned fees.
  func withdrawEarnedFees(request: Irismod_Service_MsgWithdrawEarnedFees, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Service_MsgWithdrawEarnedFeesResponse>
}

extension Irismod_Service_MsgProvider {
  internal var serviceName: Substring { return "irismod.service.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handleMethod(_ methodName: Substring, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "DefineService":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.defineService(request: request, context: context)
        }
      }

    case "BindService":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.bindService(request: request, context: context)
        }
      }

    case "UpdateServiceBinding":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.updateServiceBinding(request: request, context: context)
        }
      }

    case "SetWithdrawAddress":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.setWithdrawAddress(request: request, context: context)
        }
      }

    case "EnableServiceBinding":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.enableServiceBinding(request: request, context: context)
        }
      }

    case "DisableServiceBinding":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.disableServiceBinding(request: request, context: context)
        }
      }

    case "RefundServiceDeposit":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.refundServiceDeposit(request: request, context: context)
        }
      }

    case "CallService":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.callService(request: request, context: context)
        }
      }

    case "RespondService":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.respondService(request: request, context: context)
        }
      }

    case "PauseRequestContext":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.pauseRequestContext(request: request, context: context)
        }
      }

    case "StartRequestContext":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.startRequestContext(request: request, context: context)
        }
      }

    case "KillRequestContext":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.killRequestContext(request: request, context: context)
        }
      }

    case "UpdateRequestContext":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.updateRequestContext(request: request, context: context)
        }
      }

    case "WithdrawEarnedFees":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.withdrawEarnedFees(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}

