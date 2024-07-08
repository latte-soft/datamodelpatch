local v0 = require(script.GameProtocol);
local v1 = require(script.ExperienceServiceWrapper);
local _ = require(script.GameProtocolTypes);
return {
    GameProtocol = v0, 
    GameParams = require(script.GameParams), 
    ExperienceService = v1, 
    Flags = {
        GetFFlagMoveLuaExpLaunchBegin = require(script.Flags.GetFFlagMoveLuaExpLaunchBegin), 
        UseExperienceService = require(script.Flags.UseExperienceService)
    }
};
