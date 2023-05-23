import { utils } from 'ethers';
import { useEffect, useRef, useState } from 'react';

export const Name = ({ claim, setAbout, client }) => {

    const ref = useRef();
    const { key, namespace, table, value } = claim;
    const [tryal, setTryal] = useState(1);
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
    let hasFile = false;
    let fileName = '';
    if (ref && ref.current && ref.current.files && ref.current.files.length) {
        console.log(ref.current.files);
        hasFile = ref.current.files.length > 0;
        fileName = ref.current.files[0].name;
    }
    const labelText = !hasFile ? 'Set Profile Picture' : 'Change';
    return (
        <div className="claim">
            {about && <img src={about} width={100} alt="profile" className="profile-image" title={about} />}
            <div>
                <h2>{resolvedName}.MUD</h2>
                <p>{owner}</p>
                <form onSubmit={onSubmit}>
                    <label htmlFor="avatar" className="">{labelText}</label>
                    <input type="file"
                        className='file-input'
                        id="avatar" name="avatar"
                        accept="image/png, image/jpeg" ref={ref} onChange={() => { setTryal(Math.random()) }} />
                    {hasFile &&
                        <button type='submit'>Set {fileName} as profile picture</button>
                    }
                </form>
            </div>
        </div>
    );
};