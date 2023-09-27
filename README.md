# Foundry UUPS Upgradeable Contracts

## Introduction

This repository demonstrates the implementation and usage of the UUPS (Universal Upgradeable Proxy Standard) upgradeable pattern in smart contracts. UUPS allows for seamless and secure contract upgrades, ensuring the continuity of decentralized applications (DApps) without disrupting user experiences.

## Functionality Overview

To understand how the UUPS upgradeable pattern works, follow these steps:

1. **Define Two Contracts Inheriting from UUPSUpgradeable:**

   - Start by defining two smart contracts, both inheriting from the `UUPSUpgradeable` contract. These contracts represent different versions of your DApp's functionality.

2. **Deployment Using ERC1967Proxy:**

   - Deploy the first contract using an `ERC1967Proxy`. The proxy contract is an upgradeable proxy that enables controlled contract upgrades without changing the proxy's address.

3. **Retrieve the Proxy Address:**

   - Obtain the address of the proxy contract that points to the initial (first) contract. This address will be used to interact with your DApp.

4. **Repoint the Proxy:**
   - To upgrade your DApp to the second contract version, simply repoint the proxy contract to the new contract address. This action ensures that users continue to interact with the latest version of your DApp.

## Example Code

Here is a simplified code example to illustrate the process:
