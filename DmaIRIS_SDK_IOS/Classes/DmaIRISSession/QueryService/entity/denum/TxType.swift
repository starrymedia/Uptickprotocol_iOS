//
//  TxType.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation

public enum TxType: String {
    //bank
    case msgSend = "cosmos.bank.v1beta1.MsgSend"
    case msgMultiSend = "cosmos.bank.v1beta1.MsgMultiSend"
    //staking
    case msgDelegate = "cosmos.staking.v1beta1.MsgDelegate"
    case msgUndelegate = "cosmos.staking.v1beta1.MsgUndelegate"
    case msgBeginRedelegate = "cosmos.staking.v1beta1.MsgBeginRedelegate"
    case msgWithdrawDelegatorReward = "cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward"
    case msgSetWithdrawAddress = "cosmos.distribution.v1beta1.MsgSetWithdrawAddress"
    //coinswap
    case msgAddLiquidity = "irismod.coinswap.MsgAddLiquidity"
    case msgRemoveLiquidity = "irismod.coinswap.MsgRemoveLiquidity"
    case msgSwapOrder = "irismod.coinswap.MsgSwapOrder"
    //nft
    case msgIssueDenom = "irismod.nft.MsgIssueDenom"
    case msgTransferNFT = "irismod.nft.MsgTransferNFT"
    case msgEditNFT = "irismod.nft.MsgEditNFT"
    case msgMintNFT = "irismod.nft.MsgMintNFT"
    case msgBurnNFT = "irismod.nft.MsgBurnNFT"
    case msgIssueToken = "irismod.token.MsgIssueToken"
    case msgEditToken = "irismod.token.MsgEditToken"
    case msgMintToken = "irismod.token.MsgMintToken"
    case msgTransferTokenOwner = "irismod.token.MsgTransferTokenOwner"
}
