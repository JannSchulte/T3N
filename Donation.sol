pragma solidity ^0.4.19;
contract Donation {
	address owner;
	event fundMoved(address _to, uint _amount);
	modifier onlyowner { if (msg.sender == owner) _; }
	address[] _giver;
	uint[] _values;
	event deployed(address _a, address _creator);   
	function Donation() public {
    	owner = msg.sender;
    	// reverseRegistrar.claim(msg.sender)
    	deployed(this, msg.sender);
}
function donate() payable public {
	addGiver(msg.value);
}
function moveFund(address _to, uint _amount) onlyowner public {
	if (_amount <= this.balance) {
    	if (_to.send(this.balance)) {
        	fundMoved(_to, _amount);
    	} else {
    	revert();
	}
    	} else {
    	revert();
 	}    
 }
function addGiver(uint _amount) internal {
    	_giver.push(msg.sender);
    	_values.push(_amount);
	}
}
