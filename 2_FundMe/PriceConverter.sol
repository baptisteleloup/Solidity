//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{

    function getPrice() internal view returns(uint256) {
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        (,int256 price,,,) = PriceFeed.latestRoundData();
        return uint256(price * 1e10);
    }
    function getConversionRate(uint256 amount) internal view returns(uint256) {
        //Returns Price in USD * 10^18 of the amount sent
        uint256 ethPrice = getPrice();
        return ethPrice * amount / 1e18;
        
    }
}