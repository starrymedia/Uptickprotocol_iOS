//
//  EventKey.swift
//  UptickProtocolIRISnet
//
//  Created by StarryMedia on 2020/12/16.
//

import Foundation
import Foundation

enum EventKey: String {
    //message
    case MessageAction = "message.action"
    case MessageSender = "message.sender"
    
    //nft
    case MessageModule = "message.module"
    case TransferNftId = "transfer_nft.denom"
    case TransferNftTokenId = "transfer_nft.token-id"
    case TransferNftRecipient = "transfer_nft.recipient"
    case EditNftId = "edit_nft.denom"
    case EditNftTokenId = "edit_nft.token-id"
    case MintNftId = "mint_nft.denom"
    case MintNftTokenId = "mint_nft.token-id"
    case BurnNftId = "burn_nft.denom"
    case BurnNftTokenId = "burn_nft.token-id"

    //token
    case IssueToken = "issue_token.symbol"// token symbol
    case EditToken = "edit_token.symbol"// token symbol
    case TransferTokenOwner = "transfer_token_owner.validator"//address
    case MintToken = "mint_token.symbol"// token symbol
    case TransferSender = "transfer.sender"//address
    case TransferRecipient = "transfer.recipient"//address

}
