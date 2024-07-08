local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local _ = require(l_script_FirstAncestor_0.Utils);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_script_FirstAncestor_0.Utils).getRbxthumbWithTypeSizeAndOptions;
local l_FFlagFixPreloadingThumbsNilEntries_0 = require(l_Parent_0.SharedFlags).FFlagFixPreloadingThumbsNilEntries;
local function v13(v9, v10)
    local v11 = {};
    for v12 = 1, #v9, v10 do
        table.insert(v11, (v2.List.getRange(v9, v12, (v12 + v10) - 1)));
    end;
    return v11;
end;
local _ = function(_, v15, v16)
    return (v5.new(function(v17, _)
        local v19 = {};
        local v20 = {};
        for _, v22 in v15, nil, nil do
            v20[v22] = {};
            for _, v24 in v16, nil, nil do
                v20[v22][v24.thumbnailType] = v20[v22][v24.thumbnailType] or {};
                local v25 = l_getRbxthumbWithTypeSizeAndOptions_0(v22, v6.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v24.thumbnailType], v6.RbxThumbnailSizeToNumberSize[v24.thumbnailSize]);
                v20[v22][v24.thumbnailType][v24.thumbnailSize] = v25;
                table.insert(v19, v25);
            end;
        end;
        game:GetService("ContentProvider"):PreloadAsync(v19);
        v17();
    end));
end;
return function(v27, v28)
    if l_FFlagFixPreloadingThumbsNilEntries_0 then
        assert(v27 ~= nil, "userIds should not be nil");
    end;
    return function(_)
        local v30 = {};
        for _, v32 in pairs((v13(v27, 100))) do
            local l_v28_0 = v28;
            table.insert(v30, (v5.new(function(v34, _)
                local v36 = {};
                local v37 = {};
                for _, v39 in v32, nil, nil do
                    v37[v39] = {};
                    for _, v41 in l_v28_0, nil, nil do
                        v37[v39][v41.thumbnailType] = v37[v39][v41.thumbnailType] or {};
                        local v42 = l_getRbxthumbWithTypeSizeAndOptions_0(v39, v6.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[v41.thumbnailType], v6.RbxThumbnailSizeToNumberSize[v41.thumbnailSize]);
                        v37[v39][v41.thumbnailType][v41.thumbnailSize] = v42;
                        table.insert(v36, v42);
                    end;
                end;
                game:GetService("ContentProvider"):PreloadAsync(v36);
                v34();
            end)));
        end;
        return l_PromiseUtilities_0.Batch(v30);
    end;
end;
