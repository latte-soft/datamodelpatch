return {
    ["jest.config"] = script["jest.config"], 
    SurfaceGuiWithAdornee_new = require(script.SurfaceGuiWithAdornee_new), 
    Lighting = require(script.Lighting), 
    BackgroundScene = require(script.BackgroundScene), 
    useCameraFacingGeometry = require(script.hooks.useCameraFacingGeometry)
};
