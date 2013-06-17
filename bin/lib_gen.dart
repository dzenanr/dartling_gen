part of dartling_gen;

genDomainModelLibrary(File file) {
  addText(file, genDartlingLibrary(dartlingModel));
}

genDomainModelAppLibrary(File file) {
  addText(file, genDartlingLibraryApp(dartlingModel));
}

genInitData(File file) {
  addText(file, genInitDomainModel(dartlingModel, libraryName));
}

genConceptEntities(File file, Concept concept) {
  addText(file, genConcept(concept, libraryName));
}

genDartlingRepository(File file) {
  addText(file, genRepository(dartlingDomain, libraryName));
}

genDartlingModels(File file) {
  addText(file, genModels(dartlingDomain, libraryName));
}

genDartlingEntries(File file) {
  addText(file, genEntries(dartlingModel, libraryName));
}

genConceptEntitiesGen(File file, Concept concept) {
  addText(file, genConceptGen(concept, libraryName));
}

genJsonData(File file) {
  var text = """
part of ${domainName}_${modelName};

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// lib/${domainName}/${modelName}/json/data.dart

var ${domainName}${firstLetterToUpper(modelName)}DataJson = r'''

''';
  """;
  addText(file, text);
}

genJsonModel(File file) {
  var text = """
part of ${domainName}_${modelName};

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// lib/${domainName}/${modelName}/json/model.dart

var ${domainName}${firstLetterToUpper(modelName)}ModelJson = r'''
${modelJson}
''';
  """;
  addText(file, text);
}

genAll(String path) {
  var libPath = '${path}/lib';
  genDir(libPath);
  File domainModelLibrary = genFile('${libPath}/${domainName}_${modelName}.dart');
  genDomainModelLibrary(domainModelLibrary);
  File domainModelAppLibrary = genFile('${libPath}/${domainName}_${modelName}_app.dart');
  genDomainModelAppLibrary(domainModelAppLibrary);

  var domainPath = '${libPath}/${domainName}';
  genDir(domainPath);

  var modelPath = '${domainPath}/${modelName}';
  genDir(modelPath);
  File initData = genFile('${modelPath}/init.dart');
  genInitData(initData);
  for (Concept concept in dartlingModel.concepts) {
    File conceptEntities = genFile('${modelPath}/${concept.codesLowerUnderscore}.dart');
    genConceptEntities(conceptEntities, concept);
  }

  var jsonPath = '${modelPath}/json';
  genDir(jsonPath);
  File jsonData = genFile('${jsonPath}/data.dart');
  genJsonData(jsonData);
  File jsonModel = genFile('${jsonPath}/model.dart');
  genJsonModel(jsonModel);

  genGen(path);
}

genGen(String path) {
  var genPath = '${path}/lib/gen';
  genDir(genPath);

  var genDomainPath = '${genPath}/${domainName}';
  genDir(genDomainPath);
  File repository = genFile('${genDomainPath}/repository.dart');
  genDartlingRepository(repository);
  File models = genFile('${genDomainPath}/models.dart');
  genDartlingModels(models);

  var genModelPath = '${genDomainPath}/${modelName}';
  genDir(genModelPath);
  File entries = genFile('${genModelPath}/entries.dart');
  genDartlingEntries(entries);
  for (Concept concept in dartlingModel.concepts) {
    File conceptEntitiesGen = genFile('${genModelPath}/${concept.codesLowerUnderscore}.dart');
    genConceptEntitiesGen(conceptEntitiesGen, concept);
  }
}

genLib(String gen, String path) {
  if (gen == '--genall') {
    genAll(path);
  } else {
    genGen(path);
  }
}