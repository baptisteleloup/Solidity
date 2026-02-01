// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage{
    function store(uint8 _number) public override{
        MyFavoriteNumber = _number + 5;
    }
}


