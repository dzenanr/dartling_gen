# dartling_gen 

## Categories: dartling, model, code generation

## Description

A [dartling] (https://github.com/dzenanr/dartling) project based on a model
done in [Magic Boxes] (https://github.com/dzenanr/magic_boxes) is generated.

The json representation of a model designed in Magic Boxes must be copied in the
dartlingModelJson variable of the bin/dartling_gen.dart file. Replace demo 
projects by your domain model.

In the Run/Manage Launches of Dart Editor, enter the four arguments in the 
dartling_gen.dart command-line launch: 
--genall path domain model

Example:
--genall C:/Users/ridjanod/git/dart demo projects

By running the main function in the bin/dartling_gen.dart file,
a project, with the demo domain name and the projects model name, will be 
generated in the dart directory. Note that both domain and model names must be
one word words in lower case.

If the model changes, update the json representation of the model in the
dartlingModelJson variable of the bin/dartling_gen.dart file. Regenerate only   
the lib/gen directory, where the generated code must not be edited by a 
programmer:
--gengen path domain model


