# API requests

Here are examples of the requests we used in our use of the HTTP/REST and GRPC inference protocols based on the community developed [KFServing protocol](https://github.com/kubeflow/kfserving/blob/master/docs/predict-api/v2/required_api.md).

Health:

GET v2/health/live 
GET v2/health/ready 
GET v2/models/${MODEL_NAME}[/versions/${MODEL_VERSION}]/ready
Eg localhost:8000/v2/models/inception_graphdef/versions/1/ready
Note: Health requests have shown to not work on Linux except using curl so have been disabled on the example frontend as well

Server Metadata:

GET v2
    localhost:8000/v2

Model Metadata:

GET v2/models/${MODEL_NAME}[/versions/${MODEL_VERSION}]
    localhost:8000/v2/models/unet
    localhost:8000/v2/models/unet/versions/1
