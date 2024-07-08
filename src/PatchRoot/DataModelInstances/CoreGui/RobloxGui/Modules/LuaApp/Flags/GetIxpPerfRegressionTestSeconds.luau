local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v2 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
game:DefineFastFlag("EnablePerfRegressionTest", false);
return function()
    local l_EnablePerfRegressionTest_0 = game:GetFastFlag("EnablePerfRegressionTest");
    if l_EnablePerfRegressionTest_0 then
        local v4 = v1.default:getLayerVariables(v2.PerfRegressionTestLayer);
        if not (not v4 or not v4.homePageSleepTimeSeconds) and typeof(v4.homePageSleepTimeSeconds) == "number" then
            return l_EnablePerfRegressionTest_0, v4.homePageSleepTimeSeconds;
        end;
    end;
    return l_EnablePerfRegressionTest_0, 0;
end;
