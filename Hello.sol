
pragma solidity ^0.8.25;

contract HelloWorld {
    
    string private _hello;
    
    constructor(string memory hello) {
        _hello = hello;
    }
    
    function getMessage() public view returns (string memory) {
        return _hello;
    }
    
    function setMessage(string memory hello) public {
        _hello = hello;
    }
}
