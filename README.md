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
a project, with its demo domain and projects model, 
will be generated in the project directory.

The dependencies in the pubspec.yaml file are on the last versions of
dartling and dartling_default_app on GitHub.
You should have git installed on your computer and Dart Editor should be
able to find where.
If you want to change them to paths on your computer or to the Pub of Dart,
consult the generated doc/pubspec.txt file for an example.

If the model changes, update the json representation of the model.
Regenerate only the lib/gen directory, where the generated code must not be
edited by a programmer:

--gengen projectpath domain model

### Code Gen Example

Create the dart/social_blogging folder (domain: social; model: blogging).

Create the empty model.json file in the folder.

Design the blogging model in 
[Model Concepts](https://github.com/dzenanr/model_concepts) 
and generate its JSON version.

Copy the JSON representation from Model Concepts and 
paste it into the model.json file.

Open dartling_gen in Dart Editor.

Select bin/dartling_gen.dart.

Click on the right mouse button then Run bin/dartling_gen.dart.

dartling_gen.dart console message:
arguments are not entered properly in Run/Manage Launches of Dart Editor

In the Run menu open Manage Launches.

Select the dartling_gen.dart command-line launch.

In the Script arguments enter the following four arguments:

--genall C:\dart\social_blogging social blogging

Click on the Run button to generate the project.

### More Details

[**dartling: Domain Model Framework**](http://goo.gl/Fd08zZ)

[*Learning Dart*](http://www.packtpub.com/learning-dart/book)

[*Version History*](CHANGE_LOG.md)


