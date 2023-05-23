import { useComponentValue, useRow, useRows } from "@latticexyz/react";
import { useMUD } from "./MUDContext";

export const App = () => {
  const {
    components: { Counter },
    systemCalls: { increment, mint },
    network: { singletonEntity, storeCache },
  } = useMUD();

  // const counter = useComponentValue(Counter, singletonEntity);
  const counter = useRow(storeCache, { table: 'Counter', key: {} });

  const balances = useRows(storeCache, { table: 'BalanceTable' });
  console.log('The balances are ');
  console.log(balances);
  return (
    <>
      <div>
        Counter: <span>{counter?.value.value ?? "??"}</span>
      </div>
      <button
        type="button"
        onClick={async (event) => {
          event.preventDefault();
          console.log("new counter value:", await increment());
        }}
      >
        Increment
      </button>
      <button onClick={mint}>Mint</button>
      <>{balances.map((balance, index) => <p key={index}>{balance.key.owner} has {balance.value.value}</p>)}</>
    </>
  );
};
