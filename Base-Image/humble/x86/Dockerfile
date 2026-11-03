# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# Use default Linux Shell
SHELL ["/bin/bash", "-c"]

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    curl \
    git \
    nano \
    vim \
    btop \
    neofetch \
    software-properties-common \
    build-essential

# Username with UID/GID
ARG UID=1000
ARG GID=1000
ARG USERNAME="ubuntu"

# No Password 
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN groupadd --gid "$GID" "$USERNAME" \
    && useradd \
        --uid "$UID" \
        --gid "$GID" \
        --create-home \
        --shell /bin/bash \
        "$USERNAME"

ENV HOME=/home/${USERNAME}
ENV USER=${USERNAME}
ENV LOGNAME=${USERNAME}

# Switch to new user (so any other commands won't be on root)
USER ${USERNAME}

# Switch main workspace to $HOME of user
WORKDIR /home/${USERNAME}

# Start doing things below!

# ===== START OF SCRIPTS =====

# Copy scripts into /tmp/scripts
COPY scripts /tmp/scripts

WORKDIR /tmp/scripts

# Install Anaconda FIRST so that subsequent calls can use pip properly
# RUN sudo chmod +x anaconda.sh && ./anaconda.sh

# # Install Main Components
RUN sudo chmod +x install.sh && ./install.sh

# # Switch back to HOME
WORKDIR /home/${USERNAME}

# # Remove the script files
RUN sudo rm -rf /tmp/scripts

# # ===== END OF SCRIPTS =====

# # ===== ENTRYPOINT =====
# COPY entrypoint.sh entrypoint.sh

# RUN sudo chmod +x entrypoint.sh

# ENTRYPOINT [ "/home/ubuntu/entrypoint.sh" ]

CMD [ "/bin/bash" ]