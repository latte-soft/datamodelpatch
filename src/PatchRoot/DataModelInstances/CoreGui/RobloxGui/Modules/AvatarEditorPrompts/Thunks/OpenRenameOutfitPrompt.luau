local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.OpenPrompt);
local v3 = require(l_Parent_0.Network.GetOutfitName);
local v4 = require(l_Parent_0.PromptType);
return function(v5)
    return function(v6)
        v3(v5):andThen(function(v7)
            v6:dispatch(v2(v4.RenameOutfit, {
                outfitId = v5, 
                outfitName = v7
            }));
        end, function(_)
            l_AvatarEditorService_0:SignalRenameOutfitFailed();
        end);
    end;
end;
