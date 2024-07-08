local l_script_FirstAncestor_0 = script:FindFirstAncestor("Style");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local l_AppStyleProvider_0 = require(l_Parent_0.UIBlox).App.Style.AppStyleProvider;
return function(v8)
    local v9 = l_useDeviceType_0();
    local v10, v11 = v4.useState({
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency, 
        reducedMotion = l_UserGameSettings_0.ReducedMotion
    });
    v4.useEffect(function()
        local function v12()
            v11({
                preferredTransparency = l_UserGameSettings_0.PreferredTransparency, 
                reducedMotion = l_UserGameSettings_0.ReducedMotion
            });
        end;
        local v13 = l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(v12);
        local v14 = l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(v12);
        return function()
            v13:Disconnect();
            v14:Disconnect();
        end;
    end, {});
    local l_style_0 = v8.style;
    return v4.createElement(l_AppStyleProvider_0, {
        style = v4.useMemo(function()
            return v3.Dictionary.join({
                deviceType = l_style_0.deviceType or v9
            }, l_style_0, {
                settings = v10
            });
        end, l_dependencyArray_0(l_style_0, v9, v10))
    }, v8.children);
end;
