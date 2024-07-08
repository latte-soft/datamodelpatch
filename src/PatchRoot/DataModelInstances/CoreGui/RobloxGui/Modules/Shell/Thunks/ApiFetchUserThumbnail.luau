local l_Shell_0 = game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("Shell");
local l_SafeAsyncRodux_0 = require(l_Shell_0:FindFirstChild("SafeAsyncRodux"));
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Shell_0.Actions.FetchUserThumbnail);
local v4 = require(l_Shell_0.Actions.SetUserThumbnail);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Decal_0 = Instance.new("Decal");
local function _(v7)
    l_Decal_0.Texture = v7;
    l_ContentProvider_0:PreloadAsync({
        l_Decal_0
    });
end;
local function v27(v9, v10, v11, v12, v13)
    l_SafeAsyncRodux_0({
        asyncFunc = function(_, v15, v16, v17)
            local v18 = nil;
            local v19 = nil;
            local v22 = pcall(function()
                local l_l_Players_0_UserThumbnailAsync_0, v21 = l_Players_0:GetUserThumbnailAsync(v15, v16, v17);
                v18 = l_l_Players_0_UserThumbnailAsync_0;
                v19 = v21;
            end);
            if (not v22 or not v19) or not v18 then
                v18 = nil;
            else
                l_Decal_0.Texture = v18;
                l_ContentProvider_0:PreloadAsync({
                    l_Decal_0
                });
            end;
            return {
                success = v22, 
                rbxuid = v15, 
                thumbnailType = v16, 
                thumbnailSize = v17, 
                imageUrl = v18, 
                isFinal = v19, 
                timestamp = tick()
            };
        end, 
        callback = function(v23, v24)
            v23:dispatch(v4(v24));
        end, 
        retries = v13, 
        retryFunc = function(_, v26)
            return not (v26.success and v26.isFinal);
        end, 
        userRelated = true
    })(v9, v10, v11, v12);
end;
return function(v28, v29, v30, v31, v32)
    return function(v33)
        local v34 = v33:getState().UserThumbnails[table.concat({
            v28, 
            v29.Name, 
            v30.Name
        })];
        if v34 then
            if not v34.isFetching then
                if not (not v34.imageUrl or v32) then
                    return ;
                end;
            else
                return ;
            end;
        end;
        v33:dispatch(v3({
            rbxuid = v28, 
            thumbnailType = v29, 
            thumbnailSize = v30
        }));
        spawn(function()
            v27(v33, v28, v29, v30, v31);
        end);
    end;
end;
