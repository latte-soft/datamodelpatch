local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
if not require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then
    return v4.connect({
        "Text"
    })(v6);
else
    return function(v7)
        return v5({
            localizedText = v7.Text
        })(function(v8)
            return v3.createElement(v6, v2.Dictionary.join(v7, {
                Text = v8.localizedText
            }));
        end);
    end;
end;
