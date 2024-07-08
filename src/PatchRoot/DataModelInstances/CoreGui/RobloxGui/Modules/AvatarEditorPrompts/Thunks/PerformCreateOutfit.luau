local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v3 = require(l_Parent_0.GetConformedHumanoidDescription);
return function(v4)
    return function(v5)
        v3(v5:getState().promptInfo.humanoidDescription, false):andThen(function(v6)
            l_AvatarEditorService_0:PerformCreateOutfitWithDescription(v6, v4);
        end, function(_)
            l_AvatarEditorService_0:SignalCreateOutfitFailed();
        end);
        v5:dispatch(v2());
    end;
end;
