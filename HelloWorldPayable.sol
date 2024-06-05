pragma solidity ^0.8.25;

contract HelloWorldPayable {
    
    string private _hello;
    address public _owner;
    
    constructor(string memory hello) {
        _hello = hello;
        _owner = msg.sender;
    }
    
    function getMessage() public view returns (string memory) {
        return _hello;
    }
    
    function setMessage(string memory hello) public payable {
        require(msg.value >= 1 ether, "Insufficient Ether sent");
        _hello = hello;
    }
    
    function sendOwner() public {
        payable(_owner).transfer(address(this).balance);
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }  
}
