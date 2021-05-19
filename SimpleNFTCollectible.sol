// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

//import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract SimpleNFTCollectible is ERC721URIStorage {
    
    uint public tokenCounter;
    address public owner;
    
    constructor() ERC721("Joker", "JOKE") {
        owner = msg.sender;
        tokenCounter = 0;
    }
    
    function createCollectible(string memory tokenURI) public returns (uint) {
        uint newItemId = tokenCounter;
        
        _safeMint(owner, newItemId); //ERC721
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }
}