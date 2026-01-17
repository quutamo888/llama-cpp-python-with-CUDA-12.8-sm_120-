# build_wheel.ps1
Write-Host "Ensuring pip and build tools are installed..."
uv pip install pip scikit-build-core cmake ninja pathspec pyproject_metadata typing_extensions

Write-Host "Setting Environment Variables for RTX 5070..."
$env:CMAKE_ARGS = "-DGGML_CUDA=on -DCMAKE_CUDA_ARCHITECTURES=120 -DCMAKE_CUDA_FLAGS='-allow-unsupported-compiler'"
$env:FORCE_CMAKE = "1"

if (!(Test-Path "wheels")) {
    New-Item -ItemType Directory -Force -Path "wheels"
}

Write-Host "Building Wheel with --no-build-isolation..."
# We use the python from the venv and disable build isolation to use our installed cmake/ninja
.\.venv\Scripts\python -m pip wheel llama-cpp-python --no-binary llama-cpp-python -w ./wheels --no-cache-dir --no-build-isolation --verbose

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Wheel built successfully in ./wheels"
}
else {
    Write-Host "❌ Wheel build failed"
    exit 1
}
