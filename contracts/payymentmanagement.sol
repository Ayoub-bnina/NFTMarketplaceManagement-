pragma solidity ^0.8.0;


import "./Transactionmanagement.sol";

contract PaymentContract {
    address public owner;
   
    TransactionContract public transactionContract;

    constructor(address _nftContract, address _transactionContract) {
        owner = msg.sender;
        nftContract = NFTContract(_nftContract);
        transactionContract = TransactionContract(_transactionContract);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    

    function setTransactionContract(address _transactionContract) external onlyOwner {
        transactionContract = TransactionContract(_transactionContract);
    }

    function receivePayment(uint256 transactionId) external payable {
        require(msg.value > 0, "Payment amount must be greater than 0");
        
        address seller = transactionContract.getSeller(transactionId);
        uint256 amount = msg.value;

        (bool success, ) = seller.call{value: amount}("");
        require(success, "Failed to send payment to seller");
    }
}
//Ce contrat gère les paiements associés aux transactions d'achat et de vente de NFTs. Il reçoit le paiement de l'acheteur et le transfère au vendeur.

//Assurez-vous d'importer les contrats nécessaires (NFTContract.sol et TransactionContract.sol) et de les déployer correctement avant d'utiliser ce contrat de gestion des paiements.





