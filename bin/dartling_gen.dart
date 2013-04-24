library dartling_gen;

import 'dart:io';
import 'package:dartling/dartling.dart';

part 'doc_gen.dart';
part 'lib_gen.dart';
part 'test_gen.dart';
part 'web_gen.dart';

String dartlingModelJson = r'''
{
   "width":990,
   "height":580,
   "lines":[

   ],
   "boxes":[
      {
         "entry":true,
         "name":"Project",
         "x":179,
         "y":226,
         "width":120,
         "height":120,
         "items":[
            {
               "sequence":10,
               "category":"identifier",
               "name":"name",
               "type":"String",
               "init":""
            },
            {
               "sequence":20,
               "category":"attribute",
               "name":"description",
               "type":"String",
               "init":""
            }
         ]
      }
   ]
}
''';

String libraryName;
String domainName;
String modelName;

Repo dartlingRepository;
Domain dartlingDomain;
Model dartlingModel;

String firstLetterToUpper(String text) {
  return '${text[0].toUpperCase()}${text.substring(1)}';
}

Directory genDir(String path) {
  var dir = new Directory(path);
  if (dir.existsSync()) {
    print('directory ${path} exists already');
  } else {
    dir.createSync();
    print('directory created: ${path}');
  }
  return dir;
}

File genFile(String path) {
  File file = new File(path);
  if (file.existsSync()) {
    print('file ${path} exists already');
  } else {
    file.createSync();
    print('file created: ${path}');
  }
  return file;
}

addText(File file, String text) {
  IOSink writeSink = file.openWrite();
  writeSink.write(text);
  writeSink.close();
}

genGitignore(File file) {
  var text = '''
.buildlog
packages
web/out
*~
*.js
*.js.deps
*.js.map
  ''';
  addText(file, text);
}

genReadme(File file) {
  var text = '';
  text = '${text}# ${domainName}_${modelName} \n';
  text = '${text}\n';
  text = '${text}**Categories**: dartling, \n';
  text = '${text}\n';
  text = '${text}## Description: ${domainName}_${modelName} project uses [dartling] (https://github.com/dzenanr/dartling) for the model.';
  addText(file, text);
}

genPubspec(File file) {
  var text = '''
name: ${domainName}_${modelName}
author: Your Name
homepage: http://ondart.me/
version: 0.0.1
description: ${domainName}_${modelName} application that uses dartling for its model.
dependencies:
  browser: any
  dartling:
    git: git://github.com/dzenanr/dartling.git
  dartling_default_app:
    git: git://github.com/dzenanr/dartling_default_app.git
  ''';
  addText(file, text);
}

genProject(String gen, String contextPath) {
  var projectPath = '${contextPath}/${domainName}_${modelName}';
  if (gen == '--genall') {
    genDir(projectPath);
    genDoc(projectPath);
    genLib(gen, projectPath);
    genTest(projectPath);
    genWeb(projectPath);
    File gitignore = genFile('${projectPath}/.gitignore');
    genGitignore(gitignore);
    File readme = genFile('${projectPath}/README.md');
    genReadme(readme);
    File pubspec = genFile('${projectPath}/pubspec.yaml');
    genPubspec(pubspec);
  } else if (gen == '--gengen') {
    genLib(gen, projectPath);
  } else {
    print('valid gen argument is either --genall or --gengen');
  }
}

createDomainModel() {
  if (dartlingModelJson.trim() == '') {
    print('missing json of the model');
  } else {
    dartlingRepository = new Repo();
    dartlingDomain = new Domain(firstLetterToUpper(domainName));
    dartlingModel = fromMagicBoxes(dartlingModelJson,
        dartlingDomain, firstLetterToUpper(modelName));
    dartlingRepository.domains.add(dartlingDomain);
  }
}

void main() {
  Options options = new Options();
  // --genall C:/Users/ridjanod/git/dart demo projects
  // --gengen C:/Users/ridjanod/git/dart demo projects
  List<String> args = options.arguments;
  if (args.length == 4 && (args[0] == '--genall' || args[0] == '--gengen')) {
    domainName = args[2];
    modelName = args[3];
    libraryName = '${domainName}_${modelName}';
    createDomainModel();
    genProject(args[0], args[1]);
  } else {
    print('arguments are not entered properly in Run/Manage Launches of Dart Editor');
  }
}
