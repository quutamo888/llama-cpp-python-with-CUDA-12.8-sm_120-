# llama-cpp-python for RTX 5070 (SM_120) / CUDA 12.8

This repository contains scripts and instructions to install `llama-cpp-python` compiled specifically for **NVIDIA RTX 5070** (Compute Capability 12.0 / SM_120) using CUDA 12.8.

## 🚀 Quick Start in a New Project

**Option 1: Use the Helper Script**
1. Copy `install_llama_gpu.ps1` to your new project folder.
2. Run it inside your `uv` environment (or any venv):
   ```powershell
   .\install_llama_gpu.ps1
   ```

**Option 2: Monitor Installation (Manual)**
Run this command in your new project's terminal (assuming `uv` is installed):
```powershell
$env:CMAKE_ARGS = "-DGGML_CUDA=on -DCMAKE_CUDA_ARCHITECTURES=120 -DCMAKE_CUDA_FLAGS='-allow-unsupported-compiler'"
$env:FORCE_CMAKE = "1"
uv pip install llama-cpp-python --no-binary llama-cpp-python --upgrade
```
*Note: Since you have compiled this before on this machine using `uv`, the installation will use the cached build and be nearly instant.*

## 📂 Required Files
If you want to move this setup to another machine or keep it portable, you mainly need:
- `install_llama_gpu.ps1`: The auto-install script.
- `test_llama_uv.py`: To verify the installation works and detects GPU.

## ✅ Verification
Run the python test script to confirm GPU detection:
```powershell
uv run python test_llama_uv.py
```
Look for `BLAS = 1` or `CUDA = 1` in the output.
