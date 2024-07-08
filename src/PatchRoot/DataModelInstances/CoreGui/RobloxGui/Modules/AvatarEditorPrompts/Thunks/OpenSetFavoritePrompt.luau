local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v3 = require(l_CorePackages_0.Promise);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.OpenPrompt);
local v6 = require(l_Parent_0.PromptType);
return function(v7, v8, v9)
    return function(v10)
        return v3.new(function(v11, v12)
            local v13 = nil;
            v13 = if v8 == Enum.AvatarItemType.Asset then Enum.InfoType.Asset else Enum.InfoType.Bundle;
            local l_status_0, l_result_0 = pcall(function()
                return l_MarketplaceService_0:GetProductInfo(v7, v13);
            end);
            if not l_status_0 then
                l_AvatarEditorService_0:SignalSetFavoriteFailed();
                v12();
            else
                v10:dispatch(v5(v6.SetFavorite, {
                    itemId = v7, 
                    itemName = l_result_0.Name, 
                    itemType = v8, 
                    shouldFavorite = v9
                }));
                v11();
            end;
        end);
    end;
end;
