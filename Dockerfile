FROM nvcr.io/nvidia/l4t-base:r32.5.0

# Don't prompt with any configuration questions
ENV DEBIAN_FRONTEND noninteractive

# Install some utils
RUN apt-get update && apt-get install -y lbzip2 git wget unzip jq xorg tar python3 libegl1 binutils xz-utils bzip2


ENV UDEV=1

# Download and install BSP binaries for L4T 32.7.2
RUN \
    wget https://developer.nvidia.com/embedded/l4t/r32_release_v7.2/t210/jetson-210_linux_r32.7.2_aarch64.tbz2 && \
    tar xf jetson-210_linux_r32.7.2_aarch64.tbz2 && \
    cd Linux_for_Tegra && \
    sed -i 's/config.tbz2\"/config.tbz2\" --exclude=etc\/hosts --exclude=etc\/hostname/g' apply_binaries.sh && \
    sed -i 's/install --owner=root --group=root \"${QEMU_BIN}\" \"${L4T_ROOTFS_DIR}\/usr\/bin\/\"/#install --owner=root --group=root \"${QEMU_BIN}\" \"${L4T_ROOTFS_DIR}\/usr\/bin\/\"/g' nv_tegra/nv-apply-debs.sh && \
    sed -i 's/chroot . \//  /g' nv_tegra/nv-apply-debs.sh && \
    ./apply_binaries.sh -r / --target-overlay && cd .. \
    rm -rf jetson-210_linux_r32.7.2_aarch64.tbz2 && \
    rm -rf Linux_for_Tegra && \
    echo "/usr/lib/aarch64-linux-gnu/tegra" > /etc/ld.so.conf.d/nvidia-tegra.conf && ldconfig 


CMD [ "sleep", "infinity" ]
