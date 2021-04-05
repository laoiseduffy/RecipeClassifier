close all 
clear all
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat

sourceCodeFile = 'UnitTests/UnitTests.m';
reportFile = 'CoverageResults.xml';
reportFormat = CoberturaFormat(reportFile);
plugin = CodeCoveragePlugin.forFile(sourceCodeFile,'Producing',reportFormat);