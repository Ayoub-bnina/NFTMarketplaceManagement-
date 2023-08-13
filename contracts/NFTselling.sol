// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract NFTSaleContract is Ownable {
    using SafeMath for uint256;

    address public nftContractAddress;
    uint256 public saleFeePercentage; // Fee percentage taken from each sale

    constructor(address _nftContractAddress, uint256 _saleFeePercentage) {
        nftContractAddress = _nftContractAddress;
        saleFeePercentage = _saleFeePercentage;
    }

    modifier onlyNFTOwner(uint256 _tokenId) {
        require(ERC721(nftContractAddress).ownerOf(_tokenId) == msg.sender, "Not the owner");
        _;
    }

    function setSaleFeePercentage(uint256 _percentage) external onlyOwner {
        saleFeePercentage = _percentage;
    }

    function putNFTForSale(uint256 _tokenId, uint256 _price) external onlyNFTOwner(_tokenId) {
        ERC721(nftContractAddress).approve(address(this), _tokenId);
        // Set the NFT for sale
        // Implement your logic to list the NFT for sale
    }

    function buyNFT(uint256 _tokenId) external payable {
        // Buy the NFT
        // Implement your logic for buying NFT and transferring ownership
        // Pay the owner and the fee
    }
}