import { Name } from "./Name";
import { Web3Storage } from 'web3.storage';

const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDJEZjhFMzU3MjQ4NGE3MmFBOTA1MGIwNTEyRDUyNmI0QkM2MTAzNjIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2ODQ4NDIwNDM0NjQsIm5hbWUiOiJtdWQifQ.jsJFopNpTtkIGlKBAIOJjWtey7PM1ZYzFpTLpuK9gu0';

const client = new Web3Storage({ token });

export const Names = ({ mudPie, setAbout }) => {
  return (
    <div>
      <h1>Registry</h1>
      <ul>
        {mudPie.map((claim, index) => (
          <Name claim={claim} key={index} setAbout={setAbout} client={client} />
        ))}
      </ul>
    </div>
  );
};