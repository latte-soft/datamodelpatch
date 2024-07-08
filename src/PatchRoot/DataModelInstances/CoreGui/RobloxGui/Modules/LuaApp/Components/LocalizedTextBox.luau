local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
if not require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)() then
    return v4.connect({
        "PlaceholderText"
    })("TextBox");
else
    return v3.forwardRef(function(v6, v7)
        return v5({
            localizedText = v6.PlaceholderText
        })(function(v8)
            return v3.createElement("TextBox", v2.Dictionary.join(v6, {
                PlaceholderText = v8.localizedText, 
                [v3.Ref] = v7
            }));
        end);
    end);
end;
