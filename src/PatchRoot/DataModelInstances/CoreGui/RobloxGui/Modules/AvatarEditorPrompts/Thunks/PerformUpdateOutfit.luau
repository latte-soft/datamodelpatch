local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v3 = require(l_Parent_0.GetConformedHumanoidDescription);
return function(v4)
    v3(v4:getState().promptInfo.humanoidDescription, false):andThen(function(v5)
        l_AvatarEditorService_0:PerformUpdateOutfit(v5);
    end, function(_)
        l_AvatarEditorService_0:SignalUpdateOutfitFailed();
    end);
    v4:dispatch(v2());
end;
