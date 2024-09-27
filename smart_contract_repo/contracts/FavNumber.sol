// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FavNumberStore{
    struct User{
        uint256 id;
        string name;
        uint256 favNumber;
    }

    User[] private users;
    uint256 nextId = 1;

    function createUser(string memory _name, uint256 _favNumber) public {
        users.push(User(nextId,_name,_favNumber));
        nextId++;
    }

    function getUser(uint256 _userId) public view  returns (uint256, string memory , uint256 ){
        uint256 indx=findUser(_userId);
        return (users[indx].id,users[indx].name, users[indx].favNumber);
    }

    function updateUser(uint256 _userId, string memory _name, uint256 _favNumber) public {
        uint256 indx=findUser(_userId);
        users[indx].name=_name;
        users[indx].favNumber=_favNumber;
    }

    function deleteUser(uint256 _userId) public{
        uint256 indx=findUser(_userId);
        delete users[indx];
    }

    function getUserCount() public view returns (uint256){
        return users.length;
    }

    function findUser(uint256 _id) internal view returns (uint256){
        for(uint256 i=0; i<users.length; i++){
            if(users[i].id==_id){
                return i;
            }
        }
        revert("user not found...");
    }
}