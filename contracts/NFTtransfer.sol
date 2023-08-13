// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTTransferContract {
    address public nftContractAddress;

    constructor(address _nftContractAddress) {
        nftContractAddress = _nftContractAddress;
    }

    function transferNFT(address _to, uint256 _tokenId) external {
        IERC721 nftContract = IERC721(nftContractAddress);

        require(nftContract.ownerOf(_tokenId) == msg.sender, "Not the owner of the NFT");

        nftContract.transferFrom(msg.sender, _to, _tokenId);
    }
}