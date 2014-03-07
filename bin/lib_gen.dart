part of dartling_gen;

genDomainModelLibrary(File file) {
  addText(file, genDartlingLibrary(dartlingModel));
}

genDomainModelAppLibrary(File file) {
  addText(file, genDartlingLibraryApp(dartlingModel));
}

genDartlingRepository(File file) {
  addText(file, genRepository(dartlingRepository, libraryName));
}

genDartlingModels(File file) {
  addText(file, genModels(dartlingDomain, libraryName));
}

genDartlingDomain(File file) {
  addText(file, genDomain(dartlingDomain, libraryName));
}

genDartlingEntries(File file) {
  addText(file, genEntries(dartlingModel, libraryName));
}

genDartlingModel(File file) {
  addText(file, genModel(dartlingModel, libraryName));
}

genConceptEntitiesGen(File file, Concept concept) {
  addText(file, genConceptGen(concept, libraryName));
}

genConceptEntities(File file, Concept concept) {
  addText(file, genConcept(concept, libraryName));
}

genJsonData(File file) {
  var sc = 'part of ${domainName}_${modelName}; \n';
  sc = '${sc} \n';
  sc = '${sc}// http://www.json.org/ \n';
  sc = '${sc}// http://jsonformatter.curiousconcept.com/ \n';
  sc = '${sc} \n';
  sc = '${sc}// lib/${domainName}/${modelName}/json/data.dart \n';

  for (Concept entryConcept in dartlingModel.entryConcepts) {
    sc = '${sc}var ${domainName}${firstLetterToUpper(modelName)}'
         '${entryConcept.code}Entry = r""" \n';
    sc = '${sc} \n';
    sc = '${sc}"""; \n';
    sc = '${sc} \n';     
  }
  
  addText(file, sc);
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
  File repository = genFile('${libPath}/repository.dart');
    genDartlingRepository(repository);
  File domainModelLibrary =
      genFile('${libPath}/${domainName}_${modelName}.dart');
  genDomainModelLibrary(domainModelLibrary);
  File domainModelAppLibrary =
      genFile('${libPath}/${domainName}_${modelName}_app.dart');
  genDomainModelAppLibrary(domainModelAppLibrary);
    
  var domainPath = '${libPath}/${domainName}';
  genDir(domainPath);
  File domain = genFile('${domainPath}/domain.dart');
  genDartlingDomain(domain);

  var modelPath = '${domainPath}/${modelName}';
  genDir(modelPath);
  File model = genFile('${modelPath}/model.dart');
  genDartlingModel(model);
  for (Concept concept in dartlingModel.concepts) {
    File conceptEntities =
        genFile('${modelPath}/${concept.codesLowerUnderscore}.dart');
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
  File models = genFile('${genDomainPath}/models.dart');
  genDartlingModels(models);

  var genModelPath = '${genDomainPath}/${modelName}';
  genDir(genModelPath);
  File entries = genFile('${genModelPath}/entries.dart');
  genDartlingEntries(entries);
  for (Concept concept in dartlingModel.concepts) {
    File conceptEntitiesGen =
        genFile('${genModelPath}/${concept.codesLowerUnderscore}.dart');
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