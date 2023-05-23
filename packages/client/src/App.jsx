import { useComponentValue, useRow, useRows } from "@latticexyz/react";
import { useMUD } from "./MUDContext";
import { useState } from 'react';
import { utils } from 'ethers';
import { Names } from './Names';

export const App = () => {
  const {
    components: { Counter },
    systemCalls: { increment, mint, claim, setAbout },
    network: { singletonEntity, storeCache, playerEntityId },
  } = useMUD();
  const [value, setValue] = useState('');
  // const counter = useComponentValue(Counter, singletonEntity);
  const counter = useRow(storeCache, { table: 'Counter', key: {} });

  const balances = useRows(storeCache, { table: 'BalanceTable' });
  const mudPie = useRows(storeCache, { table: 'MudPie' });
  console.log('The balances are ');
  console.log(mudPie)
  const onChange = (event) => {
    setValue(event.target.value);
  };
  const submit = (event) => {
    event.preventDefault();
    claim(value);
  };
  return (
    <>
      <form onSubmit={submit}>
        <input value={value} onChange={onChange} />
        <button type="submit">Claim</button>
      </form>
      <Names mudPie={mudPie} setAbout={setAbout} />
    </>
  );
};
