// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Token{
    string public name = 'My First Contracts';
    string public symbol  = 'FLIP';
    uint public totalSupply  = 21000000;
    address public owner;
    mapping(address=>uint) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
        
        owner = msg.sender;
    }

    function transfer (address to, uint amount) external{
        require(balances[msg.sender] >= amount, 'No enough tokens');
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns(uint){
        return balances[account];
    }
}