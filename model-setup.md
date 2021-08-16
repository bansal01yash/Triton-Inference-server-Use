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

The details for <model-definition-file> can be found [here](https://github.com/triton-inference-server/server/blob/main/docs/model_repository.md#model-files) for various different model files. Triton supports various types of models, following is an example of how to make a TensorFlow saved_model file which supports [Auto Generated Model Configuration]()
 ```
  tf.saved_model.save(model, model_save_path)
```
### Auto-Generated Model Configuration
  

