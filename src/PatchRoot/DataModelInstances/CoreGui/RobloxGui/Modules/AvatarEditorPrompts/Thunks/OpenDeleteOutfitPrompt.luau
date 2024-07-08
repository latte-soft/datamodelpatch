local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local _ = game:GetService("CorePackages");
local _ = game:GetService("HttpRbxApiService");
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.OpenPrompt);
local v5 = require(l_Parent_0.Network.GetOutfitName);
local v6 = require(l_Parent_0.PromptType);
return function(v7)
    return function(v8)
        v5(v7):andThen(function(v9)
            v8:dispatch(v4(v6.DeleteOutfit, {
                outfitId = v7, 
                outfitName = v9
            }));
        end, function(_)
            l_AvatarEditorService_0:SignalDeleteOutfitFailed();
        end);
    end;
end;
