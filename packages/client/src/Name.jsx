import { utils } from 'ethers';
import { useRef } from 'react';

export const Name = ({ claim, setAbout, client }) => {

    const ref = useRef();
    const { key, namespace, table, value } = claim;
    const { name } = key;
    const { about, owner, ttl } = value;
    const resolvedName = utils.parseBytes32String(name);
    console.log('');
    const set = () => {
        setAbout(resolvedName, "hello");
    };
    const onSubmit = async (event) => {
        event.preventDefault();
        console.log(ref.current.files[0]);
        const cid = await client.put([ref.current.files[0]]);
        const path = 'https://ipfs.io/ipfs/' + cid + '/' + ref.current.files[0].name;
        setAbout(resolvedName, path);
    };
    return (<div>
        {about && <img src={about} width={100} alt="profile" />}
        <p>{owner} has {resolvedName} with about {about}</p>
        <form onSubmit={onSubmit}>
            <label htmlFor="avatar">Choose a profile picture:</label>
            <input type="file"
                id="avatar" name="avatar"
                accept="image/png, image/jpeg" ref={ref} />
            <button type='submit'>Submit</button>
        </form>
    </div>
    );
};