// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public simpleStorageList;

    function CreateStorage() public {
        simpleStorageList.push(new SimpleStorage());
    }

    function sfStore(uint8 index, uint8 NewNumber) public {
        SimpleStorage mySimpleStorage = simpleStorageList[index];
        mySimpleStorage.store(NewNumber);

    }

    function sfGet(uint8 index) public view returns(uint8) {
        SimpleStorage mySimpleStorage = simpleStorageList[index];
        return mySimpleStorage.retrieve();
        
    }

}

