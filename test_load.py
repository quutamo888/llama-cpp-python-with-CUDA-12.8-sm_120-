import sys
import os

def check_llama_cuda():
    print("----------------------------------------------------------------")
    print("Testing llama-cpp-python installation...")
    try:
        import llama_cpp
        print(f"✅ Success: llama_cpp module found. Version: {llama_cpp.__version__}")
        print("Path:", llama_cpp.__file__)
        
        # Simple check to see if we can access the library
        # We can't definitively proof CUDA is active without loading a model 
        # and checking logs/VRAM, but we can check if the installation didn't crash.
        
        print("\nInstallation seems compatible with the python environment.")
        print("To fully verify CUDA offloading, please run a script that loads a GGUF model")
        print("with `n_gpu_layers=-1`.")
        
    except ImportError:
        print("❌ Error: llama_cpp module NOT found. Installation might have failed.")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Error during import: {e}")
        sys.exit(1)
    print("----------------------------------------------------------------")

if __name__ == "__main__":
    check_llama_cuda()
