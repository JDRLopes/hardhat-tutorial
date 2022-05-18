//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Token {

    string public name = "My Hardhat Token";
    string public symbol = "MHT";
    uint256 public totalSupply = 1000000;
    address public owner;

    mapping(address => uint256) balances;

    constructor () {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer (address _receiver, uint256 _amount) external {
        require(balances[msg.sender] >= _amount && balances[_receiver] + _amount >= balances[_receiver], "Not enough tokens");
        balances[msg.sender] -= _amount;
        balances[_receiver] += _amount;
    }

    function balanceOf (address _account) external view returns (uint256) {
        return balances[_account];
    }

}
