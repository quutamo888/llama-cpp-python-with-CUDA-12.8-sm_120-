# Check for admin privileges (optional but good practice for ensuring deps can be installed if needed)
# But standard pip install usually works in user scope if configured.

Write-Host "================================================================"
Write-Host "    LLAMA-CPP-PYTHON CUDA INSTALLATION SCRIPT"
Write-Host "    Targeting: Native Architecture (Autodetect)"
Write-Host "================================================================"

# Check for nvcc
try {
    $nvccVersion = nvcc --version
    if ($LASTEXITCODE -ne 0) {
        Write-Error "NVCC not found. Please ensure CUDA Toolkit is installed and in PATH."
        exit 1
    }
    Write-Host "NVCC Found. Proceeding..."
} catch {
    Write-Error "NVCC check failed. Is CUDA Toolkit installed?"
    exit 1
}

# Uninstall existing
Write-Host "`n[1/3] Cleaning up existing installations..."
python -m pip uninstall -y llama-cpp-python

# Set Environment Variables
# -DGGML_CUDA=on : Enables CUDA backend
# -DCMAKE_CUDA_ARCHITECTURES=120 : Targets the user's RTX 5070 specifically (sm_120) as 'native' failed detection
Write-Host "`n[2/3] Configuring Build Environment..."
$env:CMAKE_ARGS = "-DGGML_CUDA=on -DCMAKE_CUDA_ARCHITECTURES=120 -DCMAKE_CUDA_FLAGS='-allow-unsupported-compiler'"
$env:FORCE_CMAKE = "1"

Write-Host "   CMAKE_ARGS: $env:CMAKE_ARGS"

# Install
Write-Host "`n[3/3] Installing llama-cpp-python (Compiling from source)..."
# Using --no-cache-dir to ensure we don't pick up a non-CUDA cached wheel
python -m pip install llama-cpp-python --upgrade --force-reinstall --no-cache-dir --verbose

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ Installation command completed successfully."
    Write-Host "Running Verification Script..."
    python test_load.py
} else {
    Write-Host "`n❌ Installation failed. Please check the compilation errors above."
}
