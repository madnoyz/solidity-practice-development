// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <=0.9.0;

contract MapContract {
    // Mappings ( key => value )
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    // myBooks uses Account, Book Id. myBooks[msg.sender][_id]
    mapping(address => mapping(uint => Book)) public myBooks;
    
    struct Book {
        string title;
        string author;
    }
    
    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Clyde";
    }
    
    function addBook( uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
        
    }
    
    function addMyBook( uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
    
}