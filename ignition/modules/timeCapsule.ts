import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TimeCapsule", (m) => {
  const timeCapsule = m.contract("TimeCapsule");
  return { timeCapsule };
});
