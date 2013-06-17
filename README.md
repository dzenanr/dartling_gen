# ![Alt dartling] (https://raw.github.com/dzenanr/dartling/master/resources/dartling.png) **gen** 

**Categories**: dartling, model, code generation

## Description

A [dartling] (https://github.com/dzenanr/dartling) project based on a model
done in [Model Concepts] (https://github.com/dzenanr/magic_boxes) is generated.

The json representation of a model designed in Model Concepts must be copied in 
the model.json file in the project directory.

In the Run/Manage Launches of Dart Editor, enter the four arguments in the 
Script arguments of the dartling_gen.dart command-line launch 
with the bin/dartling_gen.dart Dart script:
 
--genall projectpath domain model

Example:

--genall C:/Users/ridjanod/git/dart/demo_projects demo projects
or
--genall /home/dr/git/demo_projects demo projects

By running the main function in the bin/dartling_gen.dart file,
a project, with its domain and model names, will be 
generated in the project directory. 
Note that both domain and model names must be one word words in lower case.

If the model changes, update the json representation of the model. 
Regenerate only the lib/gen directory, where the generated code must not be 
edited by a programmer:

--gengen projectpath domain model


