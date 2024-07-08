local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Actions.PromptDismissed);
return function(v3, v4)
    return function(v5)
        v5:dispatch(v2(v3));
        l_CaptureService_0:OnSavePromptFinished(v3, v4);
    end;
end;
