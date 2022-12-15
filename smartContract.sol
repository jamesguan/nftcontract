pragma solidity ^0.5.0;

// Import the ERC-721 token standard
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

// Import the SafeMath library for overflow protection
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

// Define the contract
contract NFTMinter {
  using SafeMath for uint256;

  // The ERC-721 token
  ERC721 public token;

  // The address of the admin user
  address public admin;

  // The constructor sets the admin user and creates the ERC-721 token
  constructor(address _admin) public {
    admin = _admin;
    token = new ERC721();
  }

  // The mint function allows the admin user to mint NFTs for other wallets
  function mint(address _to, uint256 _tokenId) public {
    require(msg.sender == admin, "Only the admin user can mint NFTs");
    token.mint(_to, _tokenId);
  }

}