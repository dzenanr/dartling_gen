part of dartling_gen;

genDomainModelGen(File file) {
  addText(file, genDartlingGen(dartlingModel));
}

genDomainModelTest(File file) {
  addText(file, genDartlingTest(dartlingRepository, dartlingModel));
}

genTest(String path) {
  var testPath = '${path}/test';
  genDir(testPath);

  var domainPath = '${testPath}/${domainName}';
  genDir(domainPath);

  var modelPath = '${domainPath}/${modelName}';
  genDir(modelPath);
  File domainModelGen = genFile('${modelPath}/${domainName}_${modelName}_gen.dart');
  genDomainModelGen(domainModelGen);
  File domainModelTest = genFile('${modelPath}/${domainName}_${modelName}_test.dart');
  genDomainModelTest(domainModelTest);
}

