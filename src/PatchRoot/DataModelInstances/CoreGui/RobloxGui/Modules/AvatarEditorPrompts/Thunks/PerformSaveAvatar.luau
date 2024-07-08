local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v3 = require(l_Parent_0.GetConformedHumanoidDescription);
return function(v4)
    local v5 = v4:getState().analyticsInfo.addedAssets or {};
    local v6 = v4:getState().analyticsInfo.removedAssets or {};
    v3(v4:getState().promptInfo.humanoidDescription, false):andThen(function(v7)
        l_AvatarEditorService_0:PerformSaveAvatarWithDescription(v7, v5, v6);
    end, function(_)
        l_AvatarEditorService_0:SignalSaveAvatarFailed();
    end);
    v4:dispatch(v2());
end;
