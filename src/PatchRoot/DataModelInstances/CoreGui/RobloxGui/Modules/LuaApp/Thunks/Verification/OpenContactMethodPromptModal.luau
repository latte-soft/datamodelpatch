local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v3 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableContactMethodPromptModal);
return function(_, v5)
    return function(v6)
        if v3() then
            v6:dispatch(v2(v1.ContactMethodPromptModalOverlay, v5, {
                DisableBackButtonClose = true
            }));
        end;
    end;
end;
