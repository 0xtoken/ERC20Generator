pragma solidity 0.4.24;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import './BaseToken.sol';

contract TokenGenerator is Ownable {
    uint256 public fee;

    // サービス利用料送付先
    // Ropsten test network: 0x4a0ddc5da715cb8e2d95669829a5ce8610137d14
    // Local network: 0x627306090abab3a6e1400e9345bc60c78a8bef57
    // Main network: 0x4A0DdC5DA715CB8E2D95669829A5CE8610137d14
    address internal fund = 0x4A0DdC5DA715CB8E2D95669829A5CE8610137d14;

    // Constructor
    constructor (uint256 _fee) public {
        fee = _fee;
    }

    function setFee(uint256 _fee) onlyOwner public {
        fee = _fee;
    }

    function setFundAddress(address _address) onlyOwner public {
        fund = _address;
    }

    function generateTorken(string _name, string _symbol, uint256 _totalSupply) payable public {
        // fee以上の送金が必要
        require(msg.value >= fee);

        // 指定した送付先に利用料金
        fund.transfer(msg.value);

        address tokenAddress = new BaseToken(_name, _symbol, msg.sender, _totalSupply);

        log0(bytes32(tokenAddress));
    }
}
