// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./NFTtransfer.sol"; // Import du contrat de transfert de NFT
import "./NFTselling.sol"; // Import du contrat de vente de NFT
import "./NFTbuying.sol"; // Import du contrat d'achat de NFT

contract NFTTransactionContract {
    NFTTransferContract public transferContract;
    NFTSaleContract public saleContract;
    NFTPurchaseContract public purchaseContract;

    constructor(address _transferContract, address _saleContract, address _purchaseContract) {
        transferContract = NFTTransferContract(_transferContract);
        saleContract = NFTSaleContract(_saleContract);
        purchaseContract = NFTPurchaseContract(_purchaseContract);
    }

    struct Transaction {
        address buyer;
        address seller;
        uint256 tokenId;
        uint256 price;
        uint256 timestamp;
    }

    Transaction[] public transactions;

    function recordTransaction(address _buyer, address _seller, uint256 _tokenId, uint256 _price) external {
        Transaction memory newTransaction = Transaction({
            buyer: _buyer,
            seller: _seller,
            tokenId: _tokenId,
            price: _price,
            timestamp: block.timestamp
        });

        transactions.push(newTransaction);
    }

    function getTransactionCount() external view returns (uint256) {
        return transactions.length;
    }

    function getTransaction(uint256 _index) external view returns (
        address buyer,
        address seller,
        uint256 tokenId,
        uint256 price,
        uint256 timestamp
    ) {
        require(_index < transactions.length, "Transaction index out of range");

        Transaction memory transaction = transactions[_index];
        return (transaction.buyer, transaction.seller, transaction.tokenId, transaction.price, transaction.timestamp);
    }
}