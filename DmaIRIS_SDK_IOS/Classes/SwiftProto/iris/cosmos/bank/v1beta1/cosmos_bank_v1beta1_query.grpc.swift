//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/bank/v1beta1/query.proto
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


/// Usage: instantiate Cosmos_Bank_V1beta1_QueryClient, then call methods of this protocol to make API calls.
internal protocol Cosmos_Bank_V1beta1_QueryClientProtocol: GRPCClient {
  func balance(
    _ request: Cosmos_Bank_V1beta1_QueryBalanceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QueryBalanceRequest, Cosmos_Bank_V1beta1_QueryBalanceResponse>

  func allBalances(
    _ request: Cosmos_Bank_V1beta1_QueryAllBalancesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QueryAllBalancesRequest, Cosmos_Bank_V1beta1_QueryAllBalancesResponse>

  func totalSupply(
    _ request: Cosmos_Bank_V1beta1_QueryTotalSupplyRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QueryTotalSupplyRequest, Cosmos_Bank_V1beta1_QueryTotalSupplyResponse>

  func supplyOf(
    _ request: Cosmos_Bank_V1beta1_QuerySupplyOfRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QuerySupplyOfRequest, Cosmos_Bank_V1beta1_QuerySupplyOfResponse>

  func params(
    _ request: Cosmos_Bank_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QueryParamsRequest, Cosmos_Bank_V1beta1_QueryParamsResponse>

}

extension Cosmos_Bank_V1beta1_QueryClientProtocol {

  /// Balance queries the balance of a single coin for a single account.
  ///
  /// - Parameters:
  ///   - request: Request to send to Balance.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func balance(
    _ request: Cosmos_Bank_V1beta1_QueryBalanceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QueryBalanceRequest, Cosmos_Bank_V1beta1_QueryBalanceResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.bank.v1beta1.Query/Balance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// AllBalances queries the balance of all coins for a single account.
  ///
  /// - Parameters:
  ///   - request: Request to send to AllBalances.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func allBalances(
    _ request: Cosmos_Bank_V1beta1_QueryAllBalancesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QueryAllBalancesRequest, Cosmos_Bank_V1beta1_QueryAllBalancesResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.bank.v1beta1.Query/AllBalances",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// TotalSupply queries the total supply of all coins.
  ///
  /// - Parameters:
  ///   - request: Request to send to TotalSupply.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func totalSupply(
    _ request: Cosmos_Bank_V1beta1_QueryTotalSupplyRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QueryTotalSupplyRequest, Cosmos_Bank_V1beta1_QueryTotalSupplyResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.bank.v1beta1.Query/TotalSupply",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// SupplyOf queries the supply of a single coin.
  ///
  /// - Parameters:
  ///   - request: Request to send to SupplyOf.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func supplyOf(
    _ request: Cosmos_Bank_V1beta1_QuerySupplyOfRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QuerySupplyOfRequest, Cosmos_Bank_V1beta1_QuerySupplyOfResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.bank.v1beta1.Query/SupplyOf",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Params queries the parameters of x/bank module.
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Cosmos_Bank_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Bank_V1beta1_QueryParamsRequest, Cosmos_Bank_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/cosmos.bank.v1beta1.Query/Params",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Cosmos_Bank_V1beta1_QueryClient: Cosmos_Bank_V1beta1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the cosmos.bank.v1beta1.Query service.
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
internal protocol Cosmos_Bank_V1beta1_QueryProvider: CallHandlerProvider {
  /// Balance queries the balance of a single coin for a single account.
  func balance(request: Cosmos_Bank_V1beta1_QueryBalanceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Bank_V1beta1_QueryBalanceResponse>
  /// AllBalances queries the balance of all coins for a single account.
  func allBalances(request: Cosmos_Bank_V1beta1_QueryAllBalancesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Bank_V1beta1_QueryAllBalancesResponse>
  /// TotalSupply queries the total supply of all coins.
  func totalSupply(request: Cosmos_Bank_V1beta1_QueryTotalSupplyRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Bank_V1beta1_QueryTotalSupplyResponse>
  /// SupplyOf queries the supply of a single coin.
  func supplyOf(request: Cosmos_Bank_V1beta1_QuerySupplyOfRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Bank_V1beta1_QuerySupplyOfResponse>
  /// Params queries the parameters of x/bank module.
  func params(request: Cosmos_Bank_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Bank_V1beta1_QueryParamsResponse>
}

extension Cosmos_Bank_V1beta1_QueryProvider {
  internal var serviceName: Substring { return "cosmos.bank.v1beta1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handleMethod(_ methodName: Substring, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "Balance":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.balance(request: request, context: context)
        }
      }

    case "AllBalances":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.allBalances(request: request, context: context)
        }
      }

    case "TotalSupply":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.totalSupply(request: request, context: context)
        }
      }

    case "SupplyOf":
      return CallHandlerFactory.makeUnary(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.supplyOf(request: request, context: context)
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

