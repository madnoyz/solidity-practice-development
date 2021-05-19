// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Ownable {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, 'must be owner');
        _;
    }    
    
}

// for factory design pattern. 
contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }
    
    function getSecret() public view returns(string memory) {
        return secret;    
    }
    
}

// inheritance. is Ownable
contract MyContract is Ownable {
    // Learning inheritance
    // Learn Factories
    // Learn Smart Contract Interactions
    
    address secretVault; 

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault); // casting address. 
        super; // uses inheritance. to use other constructors. owner = msg.sender
    }
    
    function getSecret() public view onlyOwner returns(string memory) {
        SecretVault _secretVault = SecretVault(secretVault);
        return _secretVault.getSecret();    
    }
}