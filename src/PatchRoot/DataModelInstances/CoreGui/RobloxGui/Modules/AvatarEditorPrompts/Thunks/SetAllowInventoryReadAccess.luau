local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local v1 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
return function(v2)
    return function(v3)
        l_AvatarEditorService_0:SetAllowInventoryReadAccess(v2);
        v3:dispatch(v1());
    end;
end;
