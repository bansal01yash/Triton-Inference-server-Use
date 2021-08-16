# Setting up your own model repository

The repository layout must be:

```
  <model-repository-path>/
    <model-name>/
      [config.pbtxt]
      [<output-labels-file> ...]
      <version>/
        <model-definition-file>
      <version>/
        <model-definition-file>
      ...
    <model-name>/
      [config.pbtxt]
      [<output-labels-file> ...]
      <version>/
        <model-definition-file>
      <version>/
        <model-definition-file>
      ...
    ...
```
Each <model-name> directory must have at least one numeric
sub-directory representing a version of the model.  Each model configuration specifies a [version
policy](https://github.com/triton-inference-server/server/blob/main/docs/model_configuration.md#version-policy)

Model Repository can have various cloud locations as well, details for which can be found [here](https://github.com/triton-inference-server/server/blob/main/docs/model_repository.md#model-repository-locations)

The details for <model-definition-file> can be found [here](https://github.com/triton-inference-server/server/blob/main/docs/model_repository.md#model-files) for various different model files. Triton supports various types of models, following is an example of how to make a TensorFlow saved_model file which supports [Auto Generated Model Configuration](https://github.com/bansal01yash/Triton-Inference-server-Use/blob/main/model-setup.md#auto-generated-model-configuration)
 ```
  tf.saved_model.save(model, model_save_path)
```
  
## Model Configuration

Each model in a model repository must include a model configuration that provides required and optional information about the model. This configuration is provided in a config.pbtxt file. A minimal model configuration must specify the platform and/or backend properties, the max_batch_size property, and the input and output tensors of the model. 
Example model config file can be found [here](https://github.com/bansal01yash/Triton-Inference-server-Use/blob/main/model_repository/inception_graphdef/config.pbtxt) for a model that takes an image of size 299\*299\*3 and gives an output of dimension 1001 which is an array giving the label from the [labels file](https://github.com/bansal01yash/Triton-Inference-server-Use/blob/main/model_repository/inception_graphdef/inception_labels.txt).
  
### Auto-Generated Model Configuration
By default, the model configuration file containing the required settings must be provided with each model. However, if Triton is started with the ```--strict-model-config=false``` option, then in some cases the required portions of the model configuration file can be generated automatically by Triton.
  
Specifically, TensorRT, TensorFlow saved-model, and ONNX models do not require a model configuration file because Triton can derive all the required settings automatically. All other model types must provide a model configuration file.
  
When using --strict-model-config=false you can see the model configuration that was generated for a model by using the model configuration endpoint. The easiest way to do this is to use a utility like curl:
```
  $ curl localhost:8000/v2/models/<model name>/config
```  
Triton only generates the minimal portion of the model configuration. You must still provide the optional portions of the model configuration by editing the config.pbtxt file.


