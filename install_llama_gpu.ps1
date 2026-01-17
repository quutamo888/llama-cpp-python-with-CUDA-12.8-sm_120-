# Installs llama-cpp-python with CUDA 12.8 / RTX 5070 support using uv.
# Can be run in any project folder to install the accelerated version.
# Since uv caches builds, this should be instant if previously compiled.

Write-Host "Installing llama-cpp-python for RTX 5070 (SM_120)..."

# Set Build Flags
$env:CMAKE_ARGS = "-DGGML_CUDA=on -DCMAKE_CUDA_ARCHITECTURES=120 -DCMAKE_CUDA_FLAGS='-allow-unsupported-compiler'"
$env:FORCE_CMAKE = "1"

# Install using uv pip
# We specify --no-binary to ensure it looks for the source-built version (cached or new build)
uv pip install llama-cpp-python --no-binary llama-cpp-python --upgrade

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Installation Complete."
}
else {
    Write-Host "❌ Installation Failed."
}
