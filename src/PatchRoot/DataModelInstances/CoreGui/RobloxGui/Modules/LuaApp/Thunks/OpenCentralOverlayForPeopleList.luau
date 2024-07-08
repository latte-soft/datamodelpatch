local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.ArgCheck);
local v2 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function(v4)
    return function(v5)
        v1.isType(v4.user, "table", "props.user passed down to OpenCentralOverlayForPeopleList");
        v1.isType(v4.positionIndex, "number", "props.positionIndex passed down to OpenCentralOverlayForPeopleList");
        v1.isType(v4.onOpen, "function", "props.onOpen passed down to OpenCentralOverlayForPeopleList");
        v1.isType(v4.onClose, "function", "props.onClose passed down to OpenCentralOverlayForPeopleList");
        v1.isType(v4.anchorSpaceSize, "Vector2", "props.anchorSpaceSize passed down to OpenCentralOverlayForPeopleList");
        v1.isType(v4.anchorSpacePosition, "Vector2", "props.anchorSpacePosition passed down to OpenCentralOverlayForPeopleList");
        v1.isType(v4.absolutePosition, "number", "props.absolutePosition passed down to OpenCentralOverlayForPeopleList");
        v5:dispatch(v3(v2.PeopleList, v4));
    end;
end;
