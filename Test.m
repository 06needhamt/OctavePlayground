global protonMassAmu = 1.00672676
global hydrogenMassAmu = 1.00782500
global neutronMassAmu = 1.00866492
global conversionFactor = 931.494
global protonMassMev = 938.2
global neutronMassMev = 935.6

function ret = calculateBindingEnergy(atomicNumber, neutronNumber) 
  global protonMassAmu
  global neutronMassAmu
  global protonMassAMUMeV
  global conversionFactor
  global hydrogenMassAmu

  atomicNumber_d = str2double(atomicNumber) # TODO Work Out How To Pass Double Parameters
  neutronNumber_d = str2double(neutronNumber) # TODO Work Out How To Pass Double Parameters

  atomicMass = atomicNumber_d + neutronNumber_d;
  atomicWeight = (atomicNumber_d * protonMassAmu) + (neutronNumber_d * neutronMassAmu);
  protonEnergy = atomicNumber_d * hydrogenMassAmu;
  neutronEnergy = neutronNumber_d * neutronMassAmu;
  energyDifference = (protonEnergy + neutronEnergy) - atomicMass;
  bindingEnergy = energyDifference * conversionFactor;
  bindingEnergyPerNeucleon = bindingEnergy / atomicWeight;
   ret = bindingEnergyPerNeucleon;
   return
endfunction

function main()
  energy = calculateBindingEnergy(argv(){1}, argv(){2});
  fprintf("Binding Energy Per Neucleon = %d MeV \n", energy)
endfunction

main()
