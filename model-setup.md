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
### Auto-Generated Model Configuration

