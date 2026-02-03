// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage{
    uint8 MyFavoriteNumber;
    uint8[] ListOfFavoriteNumbers;

    struct Person{
        uint8 FavoriteNumber;
        string Name;
    }

    Person public MyFriend = Person(7, "Victor");
    Person public MyFriend2 = Person({FavoriteNumber : 8, Name : "Cocker"});

    Person[] public listOfPeople;

    mapping(string => uint256) public NameToFavoriteNumber;

    function store(uint8 _favoriteNumber) public virtual{
        MyFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint8) {
        return MyFavoriteNumber;
    }

    function addPerson(uint8 _favNumber, string calldata _name) public { //Calldata because I don't modify the _name
        listOfPeople.push(Person(_favNumber, _name));
        NameToFavoriteNumber[_name] = _favNumber;

    }
}

