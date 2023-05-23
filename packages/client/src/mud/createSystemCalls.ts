import { getComponentValue } from "@latticexyz/recs";
import { awaitStreamValue } from "@latticexyz/utils";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";
import { utils } from 'ethers';

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  { worldSend, txReduced$, singletonEntity }: SetupNetworkResult,
  { Counter, BalanceTable, MudPie }: ClientComponents
) {
  const increment = async () => {
    const tx = await worldSend("increment", []);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(Counter, singletonEntity);
  };

  const mint = async () => {
    const tx = await worldSend("mint", [1]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
    return getComponentValue(BalanceTable, singletonEntity);
  };

  const claim = async (name: string) => {
    const bytes32Name = utils.formatBytes32String(name);
    const tx = await worldSend("claim", [bytes32Name]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };

  const setAbout = async (name: string, about: string) => {
    const bytes32Name = utils.formatBytes32String(name);
    const tx = await worldSend("setAbout", [bytes32Name, about]);
    await awaitStreamValue(txReduced$, (txHash) => txHash === tx.hash);
  };

  return {
    increment,
    mint,
    claim,
    setAbout
  };
}
