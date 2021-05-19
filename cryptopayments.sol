// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <=0.9.0;

contract HotelRoom {
    // Learning topics: 
    // Ether - pay smart contracts
    // Modifiers
    // Visibility
    // Events
    // Enums
    
    // Enums
    // Hotel vacant
    // Hotel occupied
    enum Statuses { Vacant, Occupied }
    Statuses currentStatus; 
    
    // Events
    event Occupy(address _occupant, uint _value);
  
    address payable public owner;
    
    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }
    
    // Modifiers
    modifier onlyWhileVacant {
        // Check Status
        require( currentStatus == Statuses.Vacant, "Currently Occupied.");
        _; //runs the modifier
    }
        
        // Modifiers
    modifier roomCosts(uint _amount) {
        // Check Status
        require(msg.value >= _amount, "Not enough ether provided");
        _; //runs the modifier
    }
    
    // book a room. pay for the room
    // change the room status
    // uses modifier to check vacancy
    // booking function. function book changed to recieve like crypto wallets
    receive() external payable onlyWhileVacant roomCosts(2 ether) {
        // Solidity has requirements/conditions before it moves forward
        // require() checks if true. if not, it will halt and sends message. 
        // Check Price. Moved to modifier.
        // Check Status. Moved to modifier.

        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value);
        emit Occupy(msg.sender, msg.value);
    }
    
}