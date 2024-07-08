local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.ArgCheck);
local v2 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v4 = require(l_Modules_0.LuaApp.Models.Authentication.Birthday);
return function(v5)
    return function(v6)
        v1.isType(v5.onClose, "function", "props.onClose passed down to OpenCentralOverlayForSignUpBirthdayPicker");
        if v5.initialBirthday then
            v1.assert(v4.is(v5.initialBirthday), "props.initialBirthday passed down to OpenCentralOverlayForSignUpBirthdayPicker");
        end;
        v6:dispatch(v3(v2.SignUpBirthdayPickerOverlay, v5));
    end;
end;
