pragma solidity ^0.5.0;

import 'openzeppelin-solidity/contracts/math/SafeMath.sol';

contract GreatestShow {
  using SafeMath for uint256;
  address public owner;
  string public ringMaster;
  uint availableSeats;

  struct Performance {
    string name;
    uint32 actors;
    uint8 tigers;
    uint8 bears;
    uint8 elephants;
    uint16 timeInSeconds;
    bool clearTheStageFirst;
  }

  Performance[] performances;

  mapping(address => uint256) internal tickets;
  uint256 internal ethusd = 700; // 1 ether = 700 usd
  uint256 internal rateInCents = 2000; //costo de la entrada

  constructor(string memory _ringMaster) public {
    owner = msg.sender;
    ringMaster = _ringMaster;
  }

  function setAvailableSeats( uint _availableSeats ) public {
    availableSeats = _availableSeats;
  }

  function getAvailableSeats() view public returns(uint) {
    return availableSeats;
  }

  function addPerformance(
      string memory _name,
      uint32 _actors,
      uint8 _tigers,
      uint8 _bears,
      uint8 _elephants,
      uint16 _timeInSeconds,
      bool _clearTheStageFirst ) public {

    performances.push(
        Performance( {
          name: _name,
          actors: _actors,
          tigers: _tigers,
          bears: _bears,
          elephants: _elephants,
          timeInSeconds: _timeInSeconds,
          clearTheStageFirst: _clearTheStageFirst
        }
        )
    );
  }

  function getPerformance( uint _index) view public
    returns (string memory, uint32, uint8, uint8, uint8, uint16, bool) {
      Performance storage perf = performances[_index];

      return (perf.name, perf.actors, perf.tigers, perf.bears,
        perf.elephants, perf.timeInSeconds, perf.clearTheStageFirst);
  }

  function () external payable {
    uint256 _wei = msg.value; //1 Ether = 1000000000000000000 wei
    uint256 tickets4ETH = _wei.mul(ethusd).mul(100).div(rateInCents);
    tickets[msg.sender] = tickets[msg.sender].add( tickets4ETH);
  }

}
