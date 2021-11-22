const main = async () => {
  const waveContractFactory = await hre.ethers.getContractFactory('WavePortal')
  const waveContract = await waveContractFactory.deploy({
    value: hre.ethers.utils.parseEther('0.1'),
  })
  await waveContract.deployed()
  console.log('waveContract address: ', waveContract.address)

  let contractBalance = await hre.ethers.provider.getBalance(
    waveContract.address
  )
  console.log(
    'Contract Balance: ',
    hre.ethers.utils.formatEther(contractBalance)
  )

  let waveCount
  waveCount = await waveContract.getTotalWaves()

  let waveTxn = await waveContract.wave('Wassssssup????!!!')
  waveTxn.wait()

  let waveTnx2 = await waveContract.wave("Yoooo!!! What's good?!!")
  await waveTnx2.wait()

  contractBalance = await hre.ethers.provider.getBalance(waveContract.address)
  console.log('Contract Balance', hre.ethers.utils.formatEther(contractBalance))

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
