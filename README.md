# ![Alt dartling](https://raw.github.com/dzenanr/dartling/master/resources/dartling.png) **gen**

**Categories**: dartling, model, code generation

## Description

A [dartling](http://pub.dartlang.org/packages/dartling) project based on a model
done in [Model Concepts](https://github.com/dzenanr/model_concepts) is generated.

The json representation of a model designed in Model Concepts must be copied in
the model.json file in the project directory.

In the Run/Manage Launches of Dart Editor, enter the four arguments in the
Script arguments of the dartling_gen.dart command-line launch
with the bin/dartling_gen.dart Dart script:

--genall projectpath domain model

Example:

--genall C:/Users/ridjanod/dart/demo_projects demo projects

or

--genall /home/dr/dart/demo_projects demo projects

By running the main function in the bin/dartling_gen.dart file,
a project, with its domain and model, will be generated in the project directory.

If the model changes, update the json representation of the model.
Regenerate only the lib/gen directory, where the generated code must not be
edited by a programmer:

--gengen projectpath domain model

### Code Gen Example

Open dartling_gen in Dart Editor.

Select bin/dartling_gen.dart.

Right mouse button Run bin/dartling_gen.dart.

dartling_gen.dart console message:

arguments are not entered properly in Run/Manage Launches of Dart Editor

In the menu Run open Manage Launches.

Select dartling_gen.dart the command-line launch.

In the Script arguments enter the following four arguments:

--genall C:\Users\ridjanod.FSA-RIDJANOD-2\dart\apps\social_blogging\spirals\social_blogging_00 social blogging

Click on the Run button to generate the project.

### More Details

[**dartling: Domain Model Framework**](http://goo.gl/Fd08zZ)

[*Learning Dart*](http://www.packtpub.com/learning-dart/book) by Dzenan Ridjanovic & Ivo Balbaert

[*Version History*](CHANGE_LOG.md)


