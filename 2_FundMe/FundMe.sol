//Get funds from users
//The owner of the contract is able to withdraw
//Minimum ammount 

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe{

    using PriceConverter for uint256;

    modifier OnlyOwner(){
    if(msg.sender != OWNER){
        revert NotOwner();
    }
    _;
    }

    uint8 public constant MINIMUM_USD = 5;
    address public immutable OWNER;

    mapping(address => uint256) public addressToAmountFunded;

    constructor(){
        OWNER = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD * 1e18, "You need to spend more !");
        addressToAmountFunded[msg.sender] += msg.value;
    }

   function withdraw() public OnlyOwner {
    (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "Call Failed!");
   }

    receive() external payable{
        fund();
    }

    fallback() external payable{
        fund();
    }

    
}

