const hre = require("hardhat");

async function main() {
  // Deploy GuessingGame with an answer, e.g., 7
  const GuessingGame = await hre.ethers.getContractFactory("GuessingGame");
  const guessingGame = await GuessingGame.deploy(7); // You can change 7 to any number you want as the answer
  await guessingGame.waitForDeployment();

  console.log("GuessingGame deployed to:", await guessingGame.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});