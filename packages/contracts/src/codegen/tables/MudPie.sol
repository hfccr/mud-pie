// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("MudPie")));
bytes32 constant MudPieTableId = _tableId;

struct MudPieData {
  address owner;
  uint64 ttl;
  string about;
}

library MudPie {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](3);
    _schema[0] = SchemaType.ADDRESS;
    _schema[1] = SchemaType.UINT64;
    _schema[2] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](3);
    _fieldNames[0] = "owner";
    _fieldNames[1] = "ttl";
    _fieldNames[2] = "about";
    return ("MudPie", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get owner */
  function getOwner(bytes32 name) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get owner (using the specified store) */
  function getOwner(IStore _store, bytes32 name) internal view returns (address owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Set owner */
  function setOwner(bytes32 name, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((owner)));
  }

  /** Set owner (using the specified store) */
  function setOwner(IStore _store, bytes32 name, address owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((owner)));
  }

  /** Get ttl */
  function getTtl(bytes32 name) internal view returns (uint64 ttl) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Get ttl (using the specified store) */
  function getTtl(IStore _store, bytes32 name) internal view returns (uint64 ttl) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Set ttl */
  function setTtl(bytes32 name, uint64 ttl) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((ttl)));
  }

  /** Set ttl (using the specified store) */
  function setTtl(IStore _store, bytes32 name, uint64 ttl) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((ttl)));
  }

  /** Get about */
  function getAbout(bytes32 name) internal view returns (string memory about) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (string(_blob));
  }

  /** Get about (using the specified store) */
  function getAbout(IStore _store, bytes32 name) internal view returns (string memory about) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (string(_blob));
  }

  /** Set about */
  function setAbout(bytes32 name, string memory about) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    StoreSwitch.setField(_tableId, _keyTuple, 2, bytes((about)));
  }

  /** Set about (using the specified store) */
  function setAbout(IStore _store, bytes32 name, string memory about) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    _store.setField(_tableId, _keyTuple, 2, bytes((about)));
  }

  /** Get the length of about */
  function lengthAbout(bytes32 name) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of about (using the specified store) */
  function lengthAbout(IStore _store, bytes32 name) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of about (unchecked, returns invalid data if index overflows) */
  function getItemAbout(bytes32 name, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of about (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemAbout(IStore _store, bytes32 name, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to about */
  function pushAbout(bytes32 name, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    StoreSwitch.pushToField(_tableId, _keyTuple, 2, bytes((_slice)));
  }

  /** Push a slice to about (using the specified store) */
  function pushAbout(IStore _store, bytes32 name, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    _store.pushToField(_tableId, _keyTuple, 2, bytes((_slice)));
  }

  /** Pop a slice from about */
  function popAbout(bytes32 name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    StoreSwitch.popFromField(_tableId, _keyTuple, 2, 1);
  }

  /** Pop a slice from about (using the specified store) */
  function popAbout(IStore _store, bytes32 name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    _store.popFromField(_tableId, _keyTuple, 2, 1);
  }

  /** Update a slice of about at `_index` */
  function updateAbout(bytes32 name, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    StoreSwitch.updateInField(_tableId, _keyTuple, 2, _index * 1, bytes((_slice)));
  }

  /** Update a slice of about (using the specified store) at `_index` */
  function updateAbout(IStore _store, bytes32 name, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    _store.updateInField(_tableId, _keyTuple, 2, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(bytes32 name) internal view returns (MudPieData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 name) internal view returns (MudPieData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 name, address owner, uint64 ttl, string memory about) internal {
    bytes memory _data = encode(owner, ttl, about);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 name, address owner, uint64 ttl, string memory about) internal {
    bytes memory _data = encode(owner, ttl, about);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 name, MudPieData memory _table) internal {
    set(name, _table.owner, _table.ttl, _table.about);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 name, MudPieData memory _table) internal {
    set(_store, name, _table.owner, _table.ttl, _table.about);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (MudPieData memory _table) {
    // 28 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 28));

    _table.owner = (address(Bytes.slice20(_blob, 0)));

    _table.ttl = (uint64(Bytes.slice8(_blob, 20)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 28) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 60;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.about = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(address owner, uint64 ttl, string memory about) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](1);
    _counters[0] = uint40(bytes(about).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(owner, ttl, _encodedLengths.unwrap(), bytes((about)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 name) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 name) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((name));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}