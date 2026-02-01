//Get funds from users
//The owner of the contract is able to withdraw
//Minimum ammount 

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;
    uint8 public constant MINIMUM_USD = 5;
    address public immutable OWNER;

    struct Funder{
        address _address;
        uint256 _amount;
    }
    Funder[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    constructor(){
        OWNER = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD * 1e18, "You need to spend more !");
        funders.push(Funder(msg.sender, msg.value));
        addressToAmountFunded[msg.sender] += msg.value;
    }

   function withdraw() public OnlyOwner {
    (bool callSucces,) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSucces, "Call Failed!");

    }

modifier OnlyOwner(){
    require(msg.sender == OWNER, "You can't withdraw the funds");
    _;
}


}