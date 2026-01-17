import torch

print(f"PyTorch Version: {torch.__version__}")
if torch.cuda.is_available():
    try:
        print("CUDA available. Testing tensor operation on GPU...")
        x = torch.rand(5, 5).cuda()
        y = torch.rand(5, 5).cuda()
        z = x @ y
        print("✅ Tensor multiplication successful!")
        print(f"Result mean: {z.mean().item()}")
    except Exception as e:
        print(f"❌ Tensor operation failed: {e}")
else:
    print("❌ CUDA not available.")
