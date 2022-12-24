import { ethers } from "hardhat";

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  let store;
  let pos = 0;
  while ((await victim.locked()) === true) {
    store = await ethers.provider.getStorageAt(victim.address, pos);
    await victim.unlock(store);
    pos++;
  }
};

export default helper;
