local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Actions.OpenPrompt);
local v3 = require(l_Parent_0.PromptType);
local v4 = require(l_Parent_0.Thunks.OpenSetFavoritePrompt);
local v5 = require(l_Parent_0.Thunks.OpenSaveAvatarPrompt);
local v6 = require(l_Parent_0.Thunks.OpenDeleteOutfitPrompt);
local v7 = require(l_Parent_0.Thunks.OpenRenameOutfitPrompt);
local v8 = require(l_Parent_0.Thunks.OpenUpdateOutfitPrompt);
return function(v9)
    local v10 = {};
    table.insert(v10, l_AvatarEditorService_0.OpenPromptSaveAvatar:Connect(function(v11, v12)
        v9:dispatch(v5(v11, v12));
    end));
    table.insert(v10, l_AvatarEditorService_0.OpenAllowInventoryReadAccess:Connect(function()
        v9:dispatch(v2(v3.AllowInventoryReadAccess, {}));
    end));
    table.insert(v10, l_AvatarEditorService_0.OpenPromptCreateOufit:Connect(function(v13, v14)
        v9:dispatch(v2(v3.CreateOutfit, {
            humanoidDescription = v13, 
            rigType = v14
        }));
    end));
    table.insert(v10, l_AvatarEditorService_0.OpenPromptSetFavorite:Connect(function(v15, v16, v17)
        v9:dispatch(v4(v15, v16, v17));
    end));
    table.insert(v10, l_AvatarEditorService_0.OpenPromptDeleteOutfit:Connect(function(v18)
        v9:dispatch(v6(v18));
    end));
    table.insert(v10, l_AvatarEditorService_0.OpenPromptRenameOutfit:Connect(function(v19)
        v9:dispatch(v7(v19));
    end));
    table.insert(v10, l_AvatarEditorService_0.OpenPromptUpdateOutfit:Connect(function(v20, v21, v22)
        v9:dispatch(v8(v20, v21, v22));
    end));
    return v10;
end;
