// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.1 <0.9.0;

contract MyContract {
    //Array
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ["apple", "banana", "carrot"];
    string[] public values;
    uint[][] public array2D = [[1,2,3], [4,5,6]];
    
    // add value to array
    function addValue(string memory _value) public {
        values.push(_value);
    }
    
    // return the count of elements in array
    function valueCount() public view returns (uint) {
        return values.length;
    }
    
}





