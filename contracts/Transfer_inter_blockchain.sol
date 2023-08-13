pragma solidity ^0.8.0;

import "./LayerZero.sol"; // Importer la bibliothèque LayerZero

contract InterBlockchainTransferContract {
   
    address public owner;

    constructor(address _layerZeroAddress) {
        owner = msg.sender;
        layerZero = LayerZero(_layerZeroAddress);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function lockNFT(uint256 tokenId, bytes32 targetBlockchain) external onlyOwner {
        require(layerZero.lockNFT(tokenId, targetBlockchain), "Failed to lock NFT");
    }

    function transferNFT(uint256 tokenId, address to) external onlyOwner {
        require(layerZero.transferNFT(tokenId, to), "Failed to transfer NFT via LayerZero");
    }

    function unlockNFT(uint256 tokenId, bytes32 sourceBlockchain) external onlyOwner {
        require(layerZero.unlockNFT(tokenId, sourceBlockchain), "Failed to unlock NFT");
    }
}