# API requests

Here are examples of the requests we used in our use of the HTTP/REST and GRPC inference protocols based on the community developed [KFServing protocol](https://github.com/kubeflow/kfserving/blob/master/docs/predict-api/v2/required_api.md).

## Health:

GET v2/health/live 

GET v2/health/ready

GET v2/models/${MODEL_NAME}[/versions/${MODEL_VERSION}]/ready

Eg: GET localhost:8000/v2/models/inception_graphdef/versions/1/ready

Note: Health requests have shown to not work on Linux except using curl so have been disabled on the example frontend as well


### Server Metadata:

GET v2

Eg: GET localhost:8000/v2


## Model Metadata:

Provides the input and output configuration, as well as platform. This can be used to view the generated model configuration for the case where a mdoel configuration is not specified [(Auto-Generated Model Configuration)](https://github.com/bansal01yash/Triton-Inference-server-Use/blob/main/model-setup.md#auto-generated-model-configuration)

GET v2/models/${MODEL_NAME}[/versions/${MODEL_VERSION}]

Eg: GET localhost:8000/v2/models/unet

   GET localhost:8000/v2/models/unet/versions/1
   
   
## Inference:

These requests were used for inference in our example frontend [(here)](https://github.com/Taarushthenoob/NESAC_front/blob/main/index.js).

POST v2/models/${MODEL_NAME}[/versions/${MODEL_VERSION}]/infer

    $inference_request =
    {
        "id" : $string #optional,
        "parameters" : $parameters #optional,
        "inputs" : [ $request_input, ... ],
        "outputs" : [ $request_output, ... ] #optional
    }

POST localhost:8000/v2/models/unet/versions/1/infer

    {   
        "inputs" : [
        {
            "name" : "input_1",
            "shape" : [1,160,160,8],
            "datatype" : "FP32",
            "data" : [{{sample}}]
        }
      ]
    }
where 'sample' is a an input array of type FP32 and with 160*160*8 elements

More example requests can be found [here](https://github.com/kubeflow/kfserving/blob/master/docs/predict-api/v2/required_api.md#inference-request-examples).
[C++ and Python APIs](https://github.com/triton-inference-server/client) can also be used for client side inference
