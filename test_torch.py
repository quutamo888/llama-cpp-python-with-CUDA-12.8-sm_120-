import torch
import sys

def check_torch_cuda():
    print("----------------------------------------------------------------")
    print("Testing PyTorch CUDA installation...")
    print(f"PyTorch Version: {torch.__version__}")
    
    if torch.cuda.is_available():
        print("✅ Success: CUDA is available.")
        print(f"CUDA Version: {torch.version.cuda}")
        print(f"Device Count: {torch.cuda.device_count()}")
        print(f"Current Device: {torch.cuda.current_device()}")
        print(f"Device Name: {torch.cuda.get_device_name(0)}")
    else:
        print("❌ Error: CUDA is NOT available for PyTorch.")
        print("This might happen if you installed the CPU-only version or if drivers are missing.")
    print("----------------------------------------------------------------")

if __name__ == "__main__":
    check_torch_cuda()
