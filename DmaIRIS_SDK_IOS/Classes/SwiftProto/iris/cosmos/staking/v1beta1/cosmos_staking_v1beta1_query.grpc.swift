//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/staking/v1beta1/query.proto
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


/// Usage: instantiate Cosmos_Staking_V1beta1_QueryClient, then call methods of this protocol to make API calls.
internal protocol Cosmos_Staking_V1beta1_QueryClientProtocol: GRPCClient {
  func validators(
    _ request: Cosmos_Staking_V1beta1_QueryValidatorsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryValidatorsRequest, Cosmos_Staking_V1beta1_QueryValidatorsResponse>

  func validator(
    _ request: Cosmos_Staking_V1beta1_QueryValidatorRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryValidatorRequest, Cosmos_Staking_V1beta1_QueryValidatorResponse>

  func validatorDelegations(
    _ request: Cosmos_Staking_V1beta1_QueryValidatorDelegationsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryValidatorDelegationsRequest, Cosmos_Staking_V1beta1_QueryValidatorDelegationsResponse>

  func validatorUnbondingDelegations(
    _ request: Cosmos_Staking_V1beta1_QueryValidatorUnbondingDelegationsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryValidatorUnbondingDelegationsRequest, Cosmos_Staking_V1beta1_QueryValidatorUnbondingDelegationsResponse>

  func delegation(
    _ request: Cosmos_Staking_V1beta1_QueryDelegationRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegationRequest, Cosmos_Staking_V1beta1_QueryDelegationResponse>

  func unbondingDelegation(
    _ request: Cosmos_Staking_V1beta1_QueryUnbondingDelegationRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryUnbondingDelegationRequest, Cosmos_Staking_V1beta1_QueryUnbondingDelegationResponse>

  func delegatorDelegations(
    _ request: Cosmos_Staking_V1beta1_QueryDelegatorDelegationsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegatorDelegationsRequest, Cosmos_Staking_V1beta1_QueryDelegatorDelegationsResponse>

  func delegatorUnbondingDelegations(
    _ request: Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsRequest, Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsResponse>

  func redelegations(
    _ request: Cosmos_Staking_V1beta1_QueryRedelegationsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryRedelegationsRequest, Cosmos_Staking_V1beta1_QueryRedelegationsResponse>

  func delegatorValidators(
    _ request: Cosmos_Staking_V1beta1_QueryDelegatorValidatorsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegatorValidatorsRequest, Cosmos_Staking_V1beta1_QueryDelegatorValidatorsResponse>

  func delegatorValidator(
    _ request: Cosmos_Staking_V1beta1_QueryDelegatorValidatorRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegatorValidatorRequest, Cosmos_Staking_V1beta1_QueryDelegatorValidatorResponse>

  func historicalInfo(
    _ request: Cosmos_Staking_V1beta1_QueryHistoricalInfoRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryHistoricalInfoRequest, Cosmos_Staking_V1beta1_QueryHistoricalInfoResponse>

  func pool(
    _ request: Cosmos_Staking_V1beta1_QueryPoolRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryPoolRequest, Cosmos_Staking_V1beta1_QueryPoolResponse>

  func params(
    _ request: Cosmos_Staking_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryParamsRequest, Cosmos_Staking_V1beta1_QueryParamsResponse>

}

extension Cosmos_Staking_V1beta1_QueryClientProtocol {

  /// Validators queries all validators that match the given status.
  ///
  /// - Parameters:
  ///   - request: Request to send to Validators.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func validators(
    _ request: Cosmos_Staking_V1beta1_QueryValidatorsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryValidatorsRequest, Cosmos_Staking_V1beta1_QueryValidatorsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/Validators",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Validator queries validator info for given validator address.
  ///
  /// - Parameters:
  ///   - request: Request to send to Validator.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func validator(
    _ request: Cosmos_Staking_V1beta1_QueryValidatorRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryValidatorRequest, Cosmos_Staking_V1beta1_QueryValidatorResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/Validator",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// ValidatorDelegations queries delegate info for given validator.
  ///
  /// - Parameters:
  ///   - request: Request to send to ValidatorDelegations.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func validatorDelegations(
    _ request: Cosmos_Staking_V1beta1_QueryValidatorDelegationsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryValidatorDelegationsRequest, Cosmos_Staking_V1beta1_QueryValidatorDelegationsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/ValidatorDelegations",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// ValidatorUnbondingDelegations queries unbonding delegations of a validator.
  ///
  /// - Parameters:
  ///   - request: Request to send to ValidatorUnbondingDelegations.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func validatorUnbondingDelegations(
    _ request: Cosmos_Staking_V1beta1_QueryValidatorUnbondingDelegationsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryValidatorUnbondingDelegationsRequest, Cosmos_Staking_V1beta1_QueryValidatorUnbondingDelegationsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/ValidatorUnbondingDelegations",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Delegation queries delegate info for given validator delegator pair.
  ///
  /// - Parameters:
  ///   - request: Request to send to Delegation.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func delegation(
    _ request: Cosmos_Staking_V1beta1_QueryDelegationRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegationRequest, Cosmos_Staking_V1beta1_QueryDelegationResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/Delegation",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// UnbondingDelegation queries unbonding info for given validator delegator
  /// pair.
  ///
  /// - Parameters:
  ///   - request: Request to send to UnbondingDelegation.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func unbondingDelegation(
    _ request: Cosmos_Staking_V1beta1_QueryUnbondingDelegationRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryUnbondingDelegationRequest, Cosmos_Staking_V1beta1_QueryUnbondingDelegationResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/UnbondingDelegation",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// DelegatorDelegations queries all delegations of a given delegator address.
  ///
  /// - Parameters:
  ///   - request: Request to send to DelegatorDelegations.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func delegatorDelegations(
    _ request: Cosmos_Staking_V1beta1_QueryDelegatorDelegationsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegatorDelegationsRequest, Cosmos_Staking_V1beta1_QueryDelegatorDelegationsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/DelegatorDelegations",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// DelegatorUnbondingDelegations queries all unbonding delegations of a given
  /// delegator address.
  ///
  /// - Parameters:
  ///   - request: Request to send to DelegatorUnbondingDelegations.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func delegatorUnbondingDelegations(
    _ request: Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsRequest, Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/DelegatorUnbondingDelegations",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Redelegations queries redelegations of given address.
  ///
  /// - Parameters:
  ///   - request: Request to send to Redelegations.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func redelegations(
    _ request: Cosmos_Staking_V1beta1_QueryRedelegationsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryRedelegationsRequest, Cosmos_Staking_V1beta1_QueryRedelegationsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/Redelegations",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// DelegatorValidators queries all validators info for given delegator
  /// address.
  ///
  /// - Parameters:
  ///   - request: Request to send to DelegatorValidators.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func delegatorValidators(
    _ request: Cosmos_Staking_V1beta1_QueryDelegatorValidatorsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegatorValidatorsRequest, Cosmos_Staking_V1beta1_QueryDelegatorValidatorsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/DelegatorValidators",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// DelegatorValidator queries validator info for given delegator validator
  /// pair.
  ///
  /// - Parameters:
  ///   - request: Request to send to DelegatorValidator.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func delegatorValidator(
    _ request: Cosmos_Staking_V1beta1_QueryDelegatorValidatorRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryDelegatorValidatorRequest, Cosmos_Staking_V1beta1_QueryDelegatorValidatorResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/DelegatorValidator",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// HistoricalInfo queries the historical info for given height.
  ///
  /// - Parameters:
  ///   - request: Request to send to HistoricalInfo.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func historicalInfo(
    _ request: Cosmos_Staking_V1beta1_QueryHistoricalInfoRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryHistoricalInfoRequest, Cosmos_Staking_V1beta1_QueryHistoricalInfoResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/HistoricalInfo",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Pool queries the pool info.
  ///
  /// - Parameters:
  ///   - request: Request to send to Pool.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func pool(
    _ request: Cosmos_Staking_V1beta1_QueryPoolRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryPoolRequest, Cosmos_Staking_V1beta1_QueryPoolResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/Pool",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Parameters queries the staking parameters.
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Cosmos_Staking_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Staking_V1beta1_QueryParamsRequest, Cosmos_Staking_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.staking.v1beta1.Query/Params",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Cosmos_Staking_V1beta1_QueryClient: Cosmos_Staking_V1beta1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the cosmos.staking.v1beta1.Query service.
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
internal protocol Cosmos_Staking_V1beta1_QueryProvider: CallHandlerProvider {
  /// Validators queries all validators that match the given status.
  func validators(request: Cosmos_Staking_V1beta1_QueryValidatorsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryValidatorsResponse>
  /// Validator queries validator info for given validator address.
  func validator(request: Cosmos_Staking_V1beta1_QueryValidatorRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryValidatorResponse>
  /// ValidatorDelegations queries delegate info for given validator.
  func validatorDelegations(request: Cosmos_Staking_V1beta1_QueryValidatorDelegationsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryValidatorDelegationsResponse>
  /// ValidatorUnbondingDelegations queries unbonding delegations of a validator.
  func validatorUnbondingDelegations(request: Cosmos_Staking_V1beta1_QueryValidatorUnbondingDelegationsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryValidatorUnbondingDelegationsResponse>
  /// Delegation queries delegate info for given validator delegator pair.
  func delegation(request: Cosmos_Staking_V1beta1_QueryDelegationRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryDelegationResponse>
  /// UnbondingDelegation queries unbonding info for given validator delegator
  /// pair.
  func unbondingDelegation(request: Cosmos_Staking_V1beta1_QueryUnbondingDelegationRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryUnbondingDelegationResponse>
  /// DelegatorDelegations queries all delegations of a given delegator address.
  func delegatorDelegations(request: Cosmos_Staking_V1beta1_QueryDelegatorDelegationsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryDelegatorDelegationsResponse>
  /// DelegatorUnbondingDelegations queries all unbonding delegations of a given
  /// delegator address.
  func delegatorUnbondingDelegations(request: Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryDelegatorUnbondingDelegationsResponse>
  /// Redelegations queries redelegations of given address.
  func redelegations(request: Cosmos_Staking_V1beta1_QueryRedelegationsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryRedelegationsResponse>
  /// DelegatorValidators queries all validators info for given delegator
  /// address.
  func delegatorValidators(request: Cosmos_Staking_V1beta1_QueryDelegatorValidatorsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryDelegatorValidatorsResponse>
  /// DelegatorValidator queries validator info for given delegator validator
  /// pair.
  func delegatorValidator(request: Cosmos_Staking_V1beta1_QueryDelegatorValidatorRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryDelegatorValidatorResponse>
  /// HistoricalInfo queries the historical info for given height.
  func historicalInfo(request: Cosmos_Staking_V1beta1_QueryHistoricalInfoRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryHistoricalInfoResponse>
  /// Pool queries the pool info.
  func pool(request: Cosmos_Staking_V1beta1_QueryPoolRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryPoolResponse>
  /// Parameters queries the staking parameters.
  func params(request: Cosmos_Staking_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Staking_V1beta1_QueryParamsResponse>
}

extension Cosmos_Staking_V1beta1_QueryProvider {
  internal var serviceName: Substring { return "cosmos.staking.v1beta1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handleMethod(_ methodName: Substring, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "Validators":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.validators(request: request, context: context)
        }
      }

    case "Validator":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.validator(request: request, context: context)
        }
      }

    case "ValidatorDelegations":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.validatorDelegations(request: request, context: context)
        }
      }

    case "ValidatorUnbondingDelegations":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.validatorUnbondingDelegations(request: request, context: context)
        }
      }

    case "Delegation":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.delegation(request: request, context: context)
        }
      }

    case "UnbondingDelegation":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.unbondingDelegation(request: request, context: context)
        }
      }

    case "DelegatorDelegations":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.delegatorDelegations(request: request, context: context)
        }
      }

    case "DelegatorUnbondingDelegations":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.delegatorUnbondingDelegations(request: request, context: context)
        }
      }

    case "Redelegations":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.redelegations(request: request, context: context)
        }
      }

    case "DelegatorValidators":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.delegatorValidators(request: request, context: context)
        }
      }

    case "DelegatorValidator":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.delegatorValidator(request: request, context: context)
        }
      }

    case "HistoricalInfo":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.historicalInfo(request: request, context: context)
        }
      }

    case "Pool":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.pool(request: request, context: context)
        }
      }

    case "Params":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.params(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}

