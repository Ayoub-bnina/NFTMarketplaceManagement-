// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract NFTCollectionContract {
    address public owner;
    string[] public collectionNames;
    mapping(string => address[]) public collections;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function createCollection(string memory _name) public onlyOwner {
        collectionNames.push(_name);
    }

    function addNFTToCollection(string memory _collectionName, address _nftAddress) public onlyOwner {
        collections[_collectionName].push(_nftAddress);
    }

    function getCollectionNames() public view returns (string[] memory) {
        return collectionNames;
    }

    function getCollection(string memory _name) public view returns (address[] memory) {
        return collections[_name];
    }

    // ... Autres fonctions pour éditer, supprimer, etc.
}