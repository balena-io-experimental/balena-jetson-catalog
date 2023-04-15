import torch
print("Checking for CUDA device(s) for PyTorch...")
print("------------------------------------------")
print("Torch CUDA available: {}".format(torch.cuda.is_available()))
dev = torch.cuda.current_device()
print("Torch CUDA current device: {}".format(dev))
print("Torch CUDA device info: ".format(torch.cuda.device(dev)))
print("Torch CUDA device count: {}".format(torch.cuda.device_count()))
print("Torch CUDA device name: {}".format(torch.cuda.get_device_name(dev)))
