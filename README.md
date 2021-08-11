# Triton-Inference-server-Use

# Initial Setup

The easiest way to setup and use Triton Inference Server is using a Docker image.
There are 3 main steps involved in the setup.
1. Install Docker specific to Operating System from [here](https://docs.docker.com/engine/install/).
    - Docker can also be isntalled using a [convenience script](https://get.docker.com/). Please read about the potential risks and limitations [here](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script). Installation at the time of testing was done using the repository [here](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script).   
2. Install the NVIDIA Container Toolkit for GPU compatibility from [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)(Not available on Windows)
3. Pull the latest Triton Docker image using the following command

  ``` 
  $ docker pull nvcr.io/nvidia/tritonserver:<xx.yy>-py3
  ```
  Replace <xx.yy> with the latest release of Triton which can be found [here](https://github.com/triton-inference-server/server#triton-inference-serve).
  
  Testing at the time was done on r21.05 using the command  
  
  ```
  $ docker pull nvcr.io/nvidia/tritonserver:21.05-py3
  ```

  
[Here](https://docs.docker.com/engine/install/linux-postinstall/) you can find some post-installation steps for Docker.(These are not mandatory and some are just for convenience)

# Setting up our models

The model repository is the directory where you place the models to serve using triton. 
Setup the repository and fetch model files using the fetch_models.sh script file.

```
./fetch_models.sh
```
Model file for 

You can read briefly about setting up custom model repositories [here]().


# Using Triton Inference Server
 
```
$ docker run --gpus=1 --rm -p8000:8000 -p8001:8001 -p8002:8002 -v $(pwd)/model_repository:/models nvcr.io/nvidia/tritonserver:21.05-py3 tritonserver --model-repository=/models --strict-model-config=false

```
