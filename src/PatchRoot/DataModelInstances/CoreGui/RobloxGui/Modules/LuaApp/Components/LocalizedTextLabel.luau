local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
if not require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then
    return v4.connect({
        "Text"
    })("TextLabel");
else
    return function(v6)
        return v5({
            localizedText = v6.Text
        })(function(v7)
            return v3.createElement("TextLabel", v2.Dictionary.join(v6, {
                Text = v7.localizedText
            }));
        end);
    end;
end;
