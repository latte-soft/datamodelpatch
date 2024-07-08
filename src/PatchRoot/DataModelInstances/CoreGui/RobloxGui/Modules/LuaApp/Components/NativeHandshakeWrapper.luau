local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v5 = require(l_Modules_0.LuaApp.Enum.ToastType);
return (v2.connect(function(_, _)
    return {};
end, function(v8)
    return {
        navigateBack = function()
            return v8(v3(true));
        end, 
        onError = function(v9, v10)
            return v8(v4({
                toastMessage = v9, 
                toastSubMessage = v10, 
                isLocalized = true, 
                toastType = v5.NetworkingError
            }));
        end
    };
end)((require(l_CorePackages_0.RoactNavigation).withNavigation((require(script.Parent._NativeHandshakeWrapper))))));
