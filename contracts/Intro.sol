// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
contract IntroSolidity {
    // 0x00 != 0x000000000000000000000000000000000000000000000000000
    // Definir variable.
    address private contractOwner;

    function getContractOwner()
    public view
    returns (address)
    {
        return contractOwner;
    }

    function isContractOwner()
    public view
    returns (bool)
    {
        if( msg.sender == contractOwner ){
            return true;
        }
        return false;
    }

    function transferContract(address _to)
    external
    transferCheck(_to)
    {
        if(msg.sender == contractOwner){
            contractOwner = _to;
        }
    }

    modifier transferCheck(address _to)
    {
        require( _to != contractOwner, "SELF-TRANSFER" );
        require( _to != address(0x00), "DO-NOT-BURN" );
        _; // Wildcard ** ( ⚠️ Tarea: Investigar significado)
    }

    constructor (){
        contractOwner = msg.sender;
    }

}
