local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local v2 = require(l_CorePackages_0.Promise);
return function(v3)
    return v2.new(function(v4, v5)
        local l_status_0, l_result_0 = pcall(function()
            return l_AvatarEditorService_0:GetBatchItemDetails(v3, Enum.AvatarItemType.Asset);
        end);
        if not l_status_0 then
            v5();
            return ;
        else
            local v8 = {};
            for _, v10 in ipairs(l_result_0) do
                v8[v10.Id] = v10.Name;
            end;
            v4(v8);
            return ;
        end;
    end);
end;
