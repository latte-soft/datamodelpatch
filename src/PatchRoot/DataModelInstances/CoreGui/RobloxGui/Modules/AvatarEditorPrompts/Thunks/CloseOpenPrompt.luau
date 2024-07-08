local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v3 = require(l_Parent_0.PromptType);
return function(v4)
    local l_promptType_0 = v4:getState().promptInfo.promptType;
    if l_promptType_0 == v3.AllowInventoryReadAccess then
        l_AvatarEditorService_0:SetAllowInventoryReadAccess(false);
    elseif l_promptType_0 == v3.SaveAvatar then
        l_AvatarEditorService_0:SignalSaveAvatarPermissionDenied();
    elseif l_promptType_0 == v3.CreateOutfit then
        l_AvatarEditorService_0:SignalCreateOutfitPermissionDenied();
    elseif l_promptType_0 == v3.EnterOutfitName then
        l_AvatarEditorService_0:SignalCreateOutfitPermissionDenied();
    elseif l_promptType_0 == v3.SetFavorite then
        l_AvatarEditorService_0:SignalSetFavoritePermissionDenied();
    elseif l_promptType_0 == v3.DeleteOutfit then
        l_AvatarEditorService_0:SignalDeleteOutfitPermissionDenied();
    elseif l_promptType_0 == v3.RenameOutfit then
        l_AvatarEditorService_0:SignalRenameOutfitPermissionDenied();
    elseif l_promptType_0 == v3.UpdateOutfit then
        l_AvatarEditorService_0:SignalUpdateOutfitPermissionDenied();
    elseif l_promptType_0 ~= nil then
        error("CloseOpenPrompt for unhandled prompt type " .. tostring(l_promptType_0));
    end;
    v4:dispatch(v2());
end;
