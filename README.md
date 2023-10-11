# balena-jetson-catalog
This is an experimental project to run L4T containers from [Nvidia NGC](https://catalog.ngc.nvidia.com/containers) on Jetson devices running [balenaOS](https://www.balena.io/).

Normally, these containers require the Nvidia [Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/overview.html) or Nvidia Container Runtime, neither of which are currently supported by balenaOS.

The following containers are working:

- [NVIDIA L4T CUDA](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-cuda)

- [NVIDIA L4T TensorRT](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-tensorrt)

- [NVIDIA L4T PyTorch](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-pytorch)

- [NVIDIA L4T TensorFlow](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-tensorflow)

This one is still in developemnet and not yet fully functional:

- [DeepStream-L4T](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/deepstream-l4t/)


## Background
The NVIDIA Container Toolkit (and similar software) are proprietary tools that mount specific libraries and device nodes from the host into the container so it can use the GPU for computing purposes. Since these libraries are not available on a balenaOS host, the Toolkit will not work as intended and the container will fail to access the GPU. For a more in-depth description, as well as steps for converting other NGC containers to balenaOS, see [the related blog post](https://blog.balena.io/jetson-ngc-catalog-containers/).

The Dockerfiles in this repository use the NVIDIA images as base images and then install the missing libraries on top of them to provide full fucntionality without the Toolkit/Runtime.

## How to Use
Clone this repo to your development machine, then edit the `docker-compose.yml` file provided here and delete the service(s) you don't need. Use the [balena CLI](https://docs.balena.io/learn/more/masterclasses/cli-masterclass/) to push this code to your device and/or fleet. If you're unfamiliar with the balena platform, check out this [getting started guide](https://docs.balena.io/learn/getting-started/jetson-tx2/nodejs/).

These examples are for the Jetson TX2 and Jetson Nano running balenaOS version 2.113.33 or any version that includes L4T 32.7 (JetPack 4.6.3)

We hope to include additional examples for newer devices running more recent versions of JetPack in the near future.

