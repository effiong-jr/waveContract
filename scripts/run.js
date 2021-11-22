const main = async () => {
  const waveContractFactory = await hre.ethers.getContractFactory('WavePortal')
  const waveContract = await waveContractFactory.deploy()
  await waveContract.deployed()
  console.log('waveContract deployed to: ', waveContract.address)

  let waveCount
  waveCount = await waveContract.getTotalWaves()

  let waveTxn = await waveContract.wave('Wassssssup????!!!')
  waveTxn.wait()

  waveCount = await waveContract.getTotalWaves()

  const [_, randomPerson] = await hre.ethers.getSigners()
  waveTxn = await waveContract.connect(randomPerson).wave('Hello stranger!')
  waveTxn.wait()

  waveCount = await waveContract.getTotalWaves()

  let allWaves = await waveContract.getAllWaves()
  console.log(allWaves)
}

const runMain = async () => {
  try {
    await main()
    process.exit(0)
  } catch (error) {
    console.log(error)
    process.exit(1)
  }
}

runMain()
