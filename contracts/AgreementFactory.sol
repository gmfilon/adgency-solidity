pragma solidity ^0.4.25;

contract Agreement {
    uint256 public paymentDay;
    
    constructor(uint256 _paymentDay) public{
        paymentDay = _paymentDay;
    }
}

contract AgreementFactory{

    mapping(uint => Agreement) public agreements;
    
}