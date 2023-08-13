// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract NFTPurchaseContract {
    using SafeMath for uint256;

    address public nftContractAddress;
    address public paymentTokenAddress;
    uint256 public serviceFee; // Fee percentage

    constructor(address _nftContractAddress, address _paymentTokenAddress, uint256 _serviceFee) {
        nftContractAddress = _nftContractAddress;
        paymentTokenAddress = _paymentTokenAddress;
        serviceFee = _serviceFee;
    }

    function purchaseNFT(uint256 _tokenId, uint256 _price) external {
        IERC721 nftContract = IERC721(nftContractAddress);
        IERC20 paymentToken = IERC20(paymentTokenAddress);

        uint256 totalAmount = _price.add(_price.mul(serviceFee).div(100)); // Add service fee

        // Transfer the total amount of payment token to this contract
        paymentToken.transferFrom(msg.sender, address(this), totalAmount);

        // Transfer the NFT to the buyer
        nftContract.transferFrom(address(this), msg.sender, _tokenId);

        // Implement authenticity checks and any other required logic
    }
}