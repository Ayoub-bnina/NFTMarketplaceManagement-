// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTCreationContract is ERC721Enumerable, Ownable {
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    struct NFTMetadata {
        string name;
        string description;
        string imageUrl;
    }

    NFTMetadata[] public nftMetadata;

    function createNFT(string memory _name, string memory _description, string memory _imageUrl) external onlyOwner {
        uint256 tokenId = totalSupply();
        nftMetadata.push(NFTMetadata(_name, _description, _imageUrl));
        _mint(msg.sender, tokenId);
    }

    function getNFTMetadata(uint256 _tokenId) external view returns (NFTMetadata memory) {
        require(_tokenId < totalSupply(), "Invalid token ID");
        return nftMetadata[_tokenId];
    }
}