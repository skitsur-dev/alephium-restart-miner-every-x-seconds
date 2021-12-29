$pathToGpuMiner = ": C:\Users\USER\FOLDER\alephium-0.5.3-cuda-miner-windows.exe" #path to GPU-miner.exe, for example: C:\Users\USER\FOLDER\alephium-0.5.3-cuda-miner-windows.exe
$argumentsToGpuMiner = "-a 192.168.1.1 -p 30032" #arguments for GPU-miner, for example: -p 30032 -a 192.168.1.1
$nameOfGpuMinerProcess = "alephium-0.5.3-cuda-miner-windows" #Name of the GPU-miner process, should be that same name as your .exe file, without .exe part, for example: alephium-0.5.3-cuda-miner-windows
$secondsBeforeRestart = 900 #Amount of seconds you want the miner to run before killing it and restarting. Default is 900, which is 15 minutes.

while($true) {

    $gpuminer = Get-Process $nameOfGpuMinerProcess -ErrorAction SilentlyContinue
    if ($gpuminer) {
        $gpuminer | Stop-Process -Force
    }
    Start-Process $pathToGpuMiner -ArgumentList $argumentsToGpuMiner
    Start-Sleep -s $secondsBeforeRestart
}