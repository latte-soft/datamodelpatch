local v0 = require(script.Parent.Parent.Parent.IsExperienceMenuABTestEnabled);
local v1 = require(script.Parent.Parent.Parent.ExperienceMenuABTestManager);
game:DefineFastFlag("EnableChromeFTUX", false);
return function()
    if not v0() or not v1.default:shouldShowFTUX() then
        return game:GetFastFlag("EnableChromeFTUX");
    else
        return true;
    end;
end;
