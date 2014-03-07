part of dartling_gen;

genDomainModelGen(File file) {
  addText(file, genDartlingGen(dartlingModel));
}

genDomainModelTest(File file, Concept entryConcept) {
  addText(file, genDartlingTest(dartlingRepository, dartlingModel, entryConcept));
}

genTest(String path, Model dartlingModel) {
  var testPath = '${path}/test';
  genDir(testPath);

  var domainPath = '${testPath}/${domainName}';
  genDir(domainPath);

  var modelPath = '${domainPath}/${modelName}';
  genDir(modelPath);
  File domainModelGen =
      genFile('${modelPath}/${domainName}_${modelName}_gen.dart');
  genDomainModelGen(domainModelGen);
  for (Concept entryConcept in dartlingModel.entryConcepts) {
    File domainModelTest =
        genFile('${modelPath}/${domainName}_${modelName}_'
                '${entryConcept.codeLowerUnderscore}_test.dart');
    genDomainModelTest(domainModelTest, entryConcept);  
  }
}

