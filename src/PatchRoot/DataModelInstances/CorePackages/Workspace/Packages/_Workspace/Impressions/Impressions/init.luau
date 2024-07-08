return {
    ["jest.config"] = script["jest.config"], 
    Constants = require(script.Constants), 
    ImpressionsDetector = require(script.ImpressionsDetector), 
    ImpressionsTaggerWrapper = require(script.ImpressionsTaggerWrapper), 
    ImpressionsTagUtility = require(script.ImpressionsTagUtility), 
    ImpressionsVisualizer = require(script.ImpressionsVisualizer), 
    ScreenSizeImpressionsDetector = require(script.ScreenSizeImpressionsDetector), 
    useImpressionsTagger = require(script.useImpressionsTagger)
};
