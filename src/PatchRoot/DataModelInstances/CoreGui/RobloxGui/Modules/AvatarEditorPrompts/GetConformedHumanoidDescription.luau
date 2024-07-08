local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local v1 = require(game:GetService("CorePackages").Promise);
local v2 = nil;
local v3 = nil;
local function v15(v4, v5, v6)
    local l_l_AvatarEditorService_0_AvatarRules_0 = l_AvatarEditorService_0:GetAvatarRules();
    if l_l_AvatarEditorService_0_AvatarRules_0.DefaultClothingAssetLists then
        local l_DefaultShirtAssetIds_0 = l_l_AvatarEditorService_0_AvatarRules_0.DefaultClothingAssetLists.DefaultShirtAssetIds;
        local l_DefaultPantAssetIds_0 = l_l_AvatarEditorService_0_AvatarRules_0.DefaultClothingAssetLists.DefaultPantAssetIds;
        if l_DefaultShirtAssetIds_0 and l_DefaultPantAssetIds_0 then
            local v10 = nil;
            for _, v12 in ipairs(l_DefaultShirtAssetIds_0) do
                if v12 == v4.Shirt then
                    v10 = v10 or v4:Clone();
                    v10.Shirt = 0;
                end;
            end;
            for _, v14 in ipairs(l_DefaultPantAssetIds_0) do
                if v14 == v4.Pants then
                    v10 = v10 or v4:Clone();
                    v10.Pants = 0;
                end;
            end;
            v5(v10 or v4);
            return ;
        else
            v6("No default clothing ids in avatar rules");
            return ;
        end;
    else
        v6("No default clothing in avatar rules");
        return ;
    end;
end;
return function(v16, v17)
    if v16 == v2 then
        if not v17 then
            return v1.new(function(v18, v19)
                v15(v3, v18, v19);
            end);
        else
            return v1.resolve(v3);
        end;
    else
        return v1.new(function(v20, v21)
            coroutine.wrap(function()
                local l_status_0, l_result_0 = pcall(function()
                    return l_AvatarEditorService_0:ConformToAvatarRules(v16);
                end);
                if not l_status_0 then
                    v21(l_result_0);
                    return ;
                else
                    v2 = v16;
                    v3 = l_result_0;
                    if not v17 then
                        v15(l_result_0, v20, v21);
                        return ;
                    else
                        v20(l_result_0);
                        return ;
                    end;
                end;
            end)();
        end);
    end;
end;
