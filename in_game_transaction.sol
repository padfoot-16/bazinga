pragma solidity ^0.8.0;

import "./NMTcoin.sol";

contract GameTransaction {
    NMTcoin public token;
    address public gameContractAddress;

    constructor(address _tokenAddress, address _gameContractAddress) {
        token = NMTcoin(_tokenAddress);
        gameContractAddress = _gameContractAddress;
    }

    function transferToken(address _to, uint256 _value) public {
        require(msg.sender == gameContractAddress);
        token.transfer(_to, _value);
    }

    function exchangeToken(address _to, uint256 _value) public {
        require(msg.sender == gameContractAddress);
        token.transferFrom(_to, address(this), _value);
        // Do exchange logic here
        token.transfer(gameContractAddress, _value);
    }
}