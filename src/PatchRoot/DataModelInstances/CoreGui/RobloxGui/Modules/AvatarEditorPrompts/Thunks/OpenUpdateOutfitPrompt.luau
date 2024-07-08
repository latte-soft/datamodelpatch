local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Actions.OpenPrompt);
local v3 = require(l_Parent_0.Network.GetOutfitName);
local v4 = require(l_Parent_0.PromptType);
return function(v5, v6, v7)
    return function(v8)
        v3(v5):andThen(function(v9)
            v8:dispatch(v2(v4.UpdateOutfit, {
                outfitId = v5, 
                outfitName = v9, 
                humanoidDescription = v6, 
                rigType = v7
            }));
        end, function(_)
            l_AvatarEditorService_0:SignalUpdateOutfitFailed();
        end);
    end;
end;
