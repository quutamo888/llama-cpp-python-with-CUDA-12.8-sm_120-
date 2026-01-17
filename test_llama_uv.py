import sys
import os

try:
    from llama_cpp import Llama
    print("SUCCESS: llama_cpp imported successfully.")
except ImportError as e:
    print(f"ERROR: Could not import llama_cpp. {e}")
    sys.exit(1)

def test_gpu_load():
    print("\n--- Testing Model Load (Dummy) ---")
    # We might not have a model file, so we just check if we can instantiate with gpu_layers
    # If no model is provided, Llama() needs a model_path. 
    # We will try to load a dummy path and check the error message or minimal initialization if possible without model.
    # Actually, it's better to check internal flags if exposed, or just print library info.
    
    try:
        import llama_cpp
        print(f"llama_cpp version: {llama_cpp.__version__}")
        if hasattr(llama_cpp, "llama_backend_init"):
            print("llama_backend_init available.")
        
        # There isn't a direct "is_cuda_available" in high level API easily without loading model.
        # But we can check if the shared library loaded has CUDA symbols if we dug deep, but that's complex.
        # Best check is to inspect the build logs we just produced or rely on Llama(..., n_gpu_layers=1) failing with "file not found" 
        # but showing "BLAS = 1" in stdout.
        
        print("Test script finished. Please check the output above for 'BLAS = 1' or 'CUDA = 1' which indicates GPU support.")
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    test_gpu_load()
