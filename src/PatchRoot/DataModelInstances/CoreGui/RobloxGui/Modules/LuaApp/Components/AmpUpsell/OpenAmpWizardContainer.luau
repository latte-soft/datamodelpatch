local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
return function(v4, v5)
    return function(v6)
        v6:dispatch(v2({
            name = v1.AmpWizardContainer, 
            extraProps = {
                featureName = v4, 
                completionCallback = function(v7, v8)
                    v6:dispatch(v3());
                    v5(v7, v8);
                end
            }
        }, true));
    end;
end;
