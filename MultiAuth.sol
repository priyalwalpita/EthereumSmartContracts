pragma solidity ^0.8.25;


pragma solidity ^0.8.25;

contract MultiAuth {
    
    address public _requester;
    address public _receiver; 
    approval[] public _approvers;
    int n;
    
    struct approval {
        address approver;
        bool isApproved;
    }
    
    constructor(address[] memory approversList, address receivedBy) payable {
        _requester = msg.sender;
        _receiver = receivedBy;
        for (uint256 i = 0; i < approversList.length; i++) {
            approval memory a = approval({
                approver: approversList[i],
                isApproved: false
            });
            _approvers.push(a);
        }
    }
    
    function approve() public payable {
        bool isAllApproved = true;
        for (uint256 i = 0; i < _approvers.length; i++) {
            if (_approvers[i].approver == msg.sender) {
                _approvers[i].isApproved = true;
            }
            
            if (!_approvers[i].isApproved) {
                isAllApproved = false;
            }
        }
        
        if (isAllApproved) {
            payable(_receiver).transfer(address(this).balance);
        }
    }
    
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}


