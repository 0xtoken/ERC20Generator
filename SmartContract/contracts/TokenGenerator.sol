pragma solidity 0.4.21;
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import './BaseToken.sol';

contract TokenGenerator is Ownable {
	uint256 public fee;
	// TODO you need to set your own address here
//	address internal fund =

	// Constructor
	function TokenGenerator(uint256 _fee) public {
		fee = _fee;
	}

	function setFee(uint256 _fee) onlyOwner public {
		fee = _fee;
	}

	function generateToken(
			string _name,
			string _symbol,
			uint256 _totalSupply)
		payable
		public
	{
		require(msg.value >= fee);
		fund.transfer(msg.value);
		address tokenAddress = new BaseToken(
			_name, _symbol, msg.sender, _totalSupply);
		log0(bytes32(tokenAddress));
	}

}
