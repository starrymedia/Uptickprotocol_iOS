//
//  Typealias.swift
//  DmaIRIS_SDK_IOS
//
//  Created by StarryMedia on 2020/11/19.
//

import Foundation
import SwiftProtobuf

typealias Tx = Cosmos_Tx_V1beta1_Tx
typealias TxFee = Cosmos_Tx_V1beta1_Fee
typealias TxBody = Cosmos_Tx_V1beta1_TxBody
typealias TxModeInfo = Cosmos_Tx_V1beta1_ModeInfo
typealias TxSignerInfo = Cosmos_Tx_V1beta1_SignerInfo
typealias TxAuthInfo = Cosmos_Tx_V1beta1_AuthInfo
typealias TxSignDoc = Cosmos_Tx_V1beta1_SignDoc

typealias AuthQueryClient = Cosmos_Auth_V1beta1_QueryClient
typealias AuthQueryAccountRequest = Cosmos_Auth_V1beta1_QueryAccountRequest
typealias AuthBaseAccount = Cosmos_Auth_V1beta1_BaseAccount

typealias BankQueryClient = Cosmos_Bank_V1beta1_QueryClient
typealias BankQueryBalanceRequest = Cosmos_Bank_V1beta1_QueryBalanceRequest
typealias BankQueryAllBalancesRequest = Cosmos_Bank_V1beta1_QueryAllBalancesRequest
typealias BankQueryTotalSupplyRequest = Cosmos_Bank_V1beta1_QueryTotalSupplyRequest
typealias BankQuerySupplyOfRequest = Cosmos_Bank_V1beta1_QuerySupplyOfRequest
typealias BankMsgSend = Cosmos_Bank_V1beta1_MsgSend

typealias NftMsgIssueDenom = Irismod_Nft_MsgIssueDenom
typealias NftMsgMintNFT = Irismod_Nft_MsgMintNFT
typealias NftMsgBurnNFT = Irismod_Nft_MsgBurnNFT
typealias NftMsgTransferNFT = Irismod_Nft_MsgTransferNFT
typealias NftQueryDenomRequest = Irismod_Nft_QueryDenomRequest
typealias NftQueryDenomsRequest = Irismod_Nft_QueryDenomsRequest
typealias NftQueryCollectionRequest = Irismod_Nft_QueryCollectionRequest
typealias NftQueryClient = Irismod_Nft_QueryClient
typealias NftQueryNFTRequest = Irismod_Nft_QueryNFTRequest
typealias NftQueryOwnerRequest = Irismod_Nft_QueryOwnerRequest
typealias NftQuerySupplyRequest = Irismod_Nft_QuerySupplyRequest

typealias TokenMsgIssueToken = Irismod_Token_MsgIssueToken
typealias TokenMsgMintToken = Irismod_Token_MsgMintToken
typealias TokenMsgTransferTokenOwner = Irismod_Token_MsgTransferTokenOwner
typealias TokenQueryTokenRequest = Irismod_Token_QueryTokenRequest
typealias TokenQueryTokensRequest = Irismod_Token_QueryTokensRequest
typealias TokenQueryFeesRequest = Irismod_Token_QueryFeesRequest
typealias TokenQueryClient = Irismod_Token_QueryClient

public typealias Token = Irismod_Token_Token
public typealias NftCollection = Irismod_Nft_Collection
public typealias NftDenom = Irismod_Nft_Denom
public typealias NftBaseNFT = Irismod_Nft_BaseNFT
public typealias NftOwner = Irismod_Nft_Owner

public typealias Coin = Cosmos_Base_V1beta1_Coin
typealias PubKey = Cosmos_Crypto_Secp256k1_PubKey

typealias ProtobufAny = Google_Protobuf_Any
typealias BytesValue = Google_Protobuf_BytesValue
