local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local v1 = require(script.Parent.Parent.Actions.CloseOpenPrompt);
return function(v2)
    l_AvatarEditorService_0:PerformDeleteOutfit();
    v2:dispatch(v1());
end;
