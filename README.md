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
Setup the repository and fetch model files using the inception_setup.sh script file.

```
./inception_setup.sh
```
For unet based on [this](https://github.com/reachsumit/deep-unet-for-satellite-image-segmentation) model repository run the following
```
./unet_setup.sh
```

You can read briefly about setting up custom model repositories [here](https://github.com/bansal01yash/Triton-Inference-server-Use/blob/main/model-setup.md).


# Using Triton Inference Server
 
```
$ docker run --gpus=1 --rm -p8000:8000 -p8001:8001 -p8002:8002 -v $(pwd)/model_repository:/models nvcr.io/nvidia/tritonserver:21.05-py3 tritonserver --model-repository=/models --strict-model-config=false
```
To run without gpus, remove the gpus=1 flag
For multiple gpus, change the gpus flag to the number of gpus or use gpus=all

All models in the model repository should be loaded with version number and status displayed (STATUS should be ready)


## Verify Triton Is Running Correctly

Use Triton’s *ready* endpoint to verify that the server and the models
are ready for inference. From the host system use curl to access the
HTTP endpoint that indicates server status.

```
$ curl -v localhost:8000/v2/health/ready
...
< HTTP/1.1 200 OK
< Content-Length: 0
< Content-Type: text/plain
```

The HTTP request returns status 200 if Triton is ready and non-200 if
it is not ready.

You can also check the availability of your models as ```v2/models/${MODEL_NAME}[/versions/${MODEL_VERSION}]/ready```
For example to check unet

```
$ curl -v localhost:8000/v2/models/unet/versions/1/ready
```


## Running Inference on the models

We can test the inference for the inception model for image classification using our [sample frontend](https://github.com/Taarushthenoob/NESAC_front) for image classification. 


You can also refer to [API_requests.md](https://github.com/bansal01yash/Triton-Inference-server-Use/blob/main/API_requests.md) for example GET and POST requests that are used in the frontend and can also be tested using postman.

# Future Work

Use the [dali-backend](https://github.com/triton-inference-server/dali_backend) to implement end-to-end inference on triton itself including image preprocessing, model inference and post-processing of results. 

# References

1. https://github.com/triton-inference-server
2. https://github.com/kubeflow/kfserving

