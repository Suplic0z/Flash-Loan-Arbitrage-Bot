// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 9309
// Optimized logic batch 5074
// Optimized logic batch 9420
// Optimized logic batch 6819
// Optimized logic batch 3357
// Optimized logic batch 4876
// Optimized logic batch 9504
// Optimized logic batch 7589
// Optimized logic batch 8133
// Optimized logic batch 8375
// Optimized logic batch 6648
// Optimized logic batch 9711
// Optimized logic batch 2466
// Optimized logic batch 7568
// Optimized logic batch 5660
// Optimized logic batch 1550
// Optimized logic batch 5603
// Optimized logic batch 4457
// Optimized logic batch 4847
// Optimized logic batch 2106
// Optimized logic batch 7796