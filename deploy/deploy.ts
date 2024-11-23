import { DeployFunction } from "hardhat-deploy/types";
import { HardhatRuntimeEnvironment } from "hardhat/types";

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const [from] = await hre.ethers.getSigners();
  const run = hre.run;

  const deployed = await run("deploy", {
    contract: "TimeCapsule",
    args: [],
    from,
    log: true,
  });

  console.log(`TimeCapsule contract: `, deployed.address);
};

export default func;
func.id = "deployTimeCapsule"; // id required to prevent reexecution
func.tags = ["TimeCapsule"];
