# balena-jetson-catalog
This is an experimental project to run L4T containers from [Nvidia NGC](https://catalog.ngc.nvidia.com/containers) on Jetson devices running balenaOS.

Normally, these containers require the Nvidia [Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/overview.html) or Nvidia Container Runtime, neither of which are currently supported by balenaOS.

Currently, we have the following containers working:

- [NVIDIA L4T CUDA](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-cuda)

- [NVIDIA L4T TensorRT](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-tensorrt)

- [NVIDIA L4T PyTorch](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-pytorch)

- [NVIDIA L4T TensorFlow](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-tensorflow)

This one is still in developemnet and not yet fully functional:

- [DeepStream-L4T](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/deepstream-l4t/)

## Background
The NVIDIA Container Toolkit (and similar software) are prorietary tools that mount specific libraries and device nodes from the host into the container so it can use the GPU for computing purposes. Since these libraries are not available on a balenaOS host, the Toolkit will not work as intended and the container will fail to access the GPU. For a more in-depth description, as well as steps for converting other NGC containers to balenaOS, see the related blog post (TBA).

The Dockerfiles in this repository use the NVIDIA images as base images and then install the missing libraries on top of them to provide full fucntionality without the Toolkit/Runtime. Matching the versions of all the dependencies is the most critical (and difficult) part of the process.

## How to Use
You can edit the `docker-compose.yml` file provided here and delete the services you don't need. 

These examples are for the Jetson TX2 for balenaOS version 2.113.33 or any version that includes L4T 32.7 (JetPack 4.6.3)

They can also be easily modified for a Jetson Nano by making the following change: (TBA)

We hope to include additional examples for newer devices running more recent versions of JetPack in the near future.

