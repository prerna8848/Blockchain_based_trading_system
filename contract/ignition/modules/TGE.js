const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("TGEContractModule", (m) => {
  // Default values for token parameters
  const tokenName = m.getParameter("tokenName", "Nepse");
  const tokenSymbol = m.getParameter("tokenSymbol", "NEP");
  const initialSupply = m.getParameter("initialSupply", 1000); // in raw units, i.e., without decimals

  // Deploy the TokenFactory contract first
  const tokenFactory = m.contract("TokenFactory", []);

  // Create a new token using the factory
  const tgeTokenAddress = m.call(tokenFactory, "createToken", [tokenName,tokenSymbol,initialSupply])

  return { tgeTokenAddress, tokenFactory };
});
