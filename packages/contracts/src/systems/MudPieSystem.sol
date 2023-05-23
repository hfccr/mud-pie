// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { MudPie } from "../codegen/tables/MudPie.sol";

contract MudPieSystem is System {
  function claim(bytes32 name) public {
    string memory about = "";
    uint64 ttl = 100;
    MudPie.set(name, _msgSender(), 1000, about);
  }

  function setAbout(bytes32 name, string memory about) public {
    MudPie.setAbout(name, about);
  }
}
