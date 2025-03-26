// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConverter {
    function getLatestPrice() internal view returns(uint256) {
        // Get the price of Dollar per ETH
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price) * 1e10;
    }
    function getConversionRate(uint ethAmount) internal view returns(uint256) {
        // Converts ETH into dollars
        uint256 ethPrice = getLatestPrice();
        uint256 ethAmoutnInUsd = (ethAmount * ethPrice) / 1e18;
        return ethAmoutnInUsd;
        
    }

    function getVersion() internal view returns(uint256) {
        return AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF).version();
    }
}