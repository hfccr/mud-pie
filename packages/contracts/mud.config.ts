import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    Counter: {
      keySchema: {},
      schema: "uint32",
    },
    BalanceTable: {
      schema: "uint32",
      keySchema: {
        owner: "address",
        item: 'uint32'
      }
    },
    MudPie: {
      keySchema: {
        name: "bytes32"
      },
      schema: {
        owner: "address",
        ttl: "uint64",
        about: "string"
      }
    }
  },
});
