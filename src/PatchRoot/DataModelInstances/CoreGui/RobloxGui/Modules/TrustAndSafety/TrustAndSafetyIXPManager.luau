local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagReportAnythingAnnotationIXP);
local v2 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFStringReportAnythingAnnotationIXPLayerName);
local v3 = require(script.Parent.Flags.GetFFlagForceReportAnythingAnnotationEnabled);
local v4 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local v5 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v6 = {};
v6.__index = v6;
v6.new = function(v7)
    local v8 = {
        _ixpServiceWrapper = v7 or v4, 
        _initialized = false, 
        _ixpInitialized = false, 
        _optionalScreenshotEnabled = false, 
        _reportAnythingExperienceEnabled = false, 
        _reportAnythingAvatarEnabled = false, 
        _callbacks = {}
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.getReportAnythingExperienceEnabled = function(v9)
    if not v3() then
        return v9._reportAnythingExperienceEnabled or v9._optionalScreenshotEnabled;
    else
        return true;
    end;
end;
v6.getReportAnythingAvatarEnabled = function(v10)
    if not v3() then
        return v10._reportAnythingAvatarEnabled or v10._optionalScreenshotEnabled;
    else
        return true;
    end;
end;
v6.waitForInitialization = function(v11, v12)
    if not v11._ixpInitialized then
        table.insert(v11._callbacks, v12);
        return ;
    else
        v12();
        return ;
    end;
end;
v6.initialize = function(v13)
    if not v13._initialized then
        v13._initialized = true;
        local function v16()
            for _, v15 in ipairs(v13._callbacks) do
                v15();
            end;
            v13._callbacks = {};
        end;
        if v1() then
            task.spawn(function()
                v13._ixpServiceWrapper:WaitForInitialization();
                local l_LayerData_0 = v13._ixpServiceWrapper:GetLayerData(v2());
                if l_LayerData_0 then
                    v13._optionalScreenshotEnabled = l_LayerData_0.OptionalScreenshotEnabled or false;
                    v13._reportAnythingExperienceEnabled = l_LayerData_0.OptionalScreenshotExperience or false;
                    v13._reportAnythingAvatarEnabled = l_LayerData_0.OptionalScreenshotAvatar or false;
                end;
                v5:debug("RA Optional Screenshot enabled? Both: {}, Exp: {}, Avatar: {}. Invoking {} callbacks.", v13._optionalScreenshotEnabled, v13._reportAnythingExperienceEnabled, v13._reportAnythingAvatarEnabled, #v13._callbacks);
                v13._ixpInitialized = true;
                v16();
            end);
            return ;
        else
            v13._ixpInitialized = true;
            v16();
            return ;
        end;
    else
        return ;
    end;
end;
v6.default = v6.new();
return v6;
