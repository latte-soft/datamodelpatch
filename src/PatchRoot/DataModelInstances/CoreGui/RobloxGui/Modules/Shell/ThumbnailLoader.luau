local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Players_0 = game:GetService("Players");
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v5 = {};
local l_Decal_0 = Instance.new("Decal");
local function _(v7)
    l_Decal_0.Texture = v7;
    l_ContentProvider_0:PreloadAsync({
        l_Decal_0
    });
end;
v5.Sizes = {
    Small = Vector2.new(100, 100), 
    Medium = Vector2.new(420, 420), 
    Large = Vector2.new(768, 432)
};
v5.GameIconSizes = {
    Small = Vector2.new(128, 128), 
    Medium = Vector2.new(256, 256), 
    Large = Vector2.new(512, 512)
};
v5.AvatarSizes = {
    Size48x48 = Vector2.new(48, 48), 
    Size150x150 = Vector2.new(150, 150), 
    Size352x352 = Vector2.new(352, 352), 
    Size420x420 = Vector2.new(420, 420)
};
v5.SubstitutionTypeResult = {
    None = 0, 
    Unapproved = 1, 
    PendingReview = 2, 
    Broken = 3, 
    Unavailable = 4, 
    Unknown = 5
};
v5.AssetType = {
    Icon = {
        SetImageUrl = "rbxthumb://type=Asset&w=%d&h=%d&id=%d"
    }, 
    SquareIcon = {
        SetImageUrl = "rbxthumb://type=GameIcon&w=%d&h=%d&id=%d"
    }, 
    Avatar = {
        SetImageUrl = "rbxthumb://type=Avatar&w=%d&h=%d&id=%d"
    }, 
    Outfit = {
        SetImageUrl = "rbxthumb://type=Outfit&w=%d&h=%d&id=%d"
    }
};
v5.Create = function(_, v10, v11, v12, v13, v14)
    local v15 = {};
    local v16 = false;
    local v17 = false;
    local v18 = false;
    local v19 = string.format(v13.SetImageUrl, v12.x, v12.y, v11 or -1);
    if v14 then
        v19 = v19 .. "&filters=" .. tostring(tick());
    end;
    local v20 = nil;
    local v21 = nil;
    v20 = function()
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        delay(0.5, function()
            l_BindableEvent_0:Fire(false);
        end);
        coroutine.wrap(function()
            l_ContentProvider_0:PreloadAsync({
                v19
            }, function(_, v24)
                v18 = v24 == Enum.AssetFetchStatus.Success;
                l_BindableEvent_0:Fire(v24 == Enum.AssetFetchStatus.Success);
            end);
        end)();
        return l_BindableEvent_0.Event:Wait();
    end;
    v21 = function()
        v16 = true;
        v18 = false;
        l_ContentProvider_0:PreloadAsync({
            v19
        }, function(_, v26)
            v16 = false;
            v18 = v26 == Enum.AssetFetchStatus.Success;
        end);
    end;
    local v27 = nil;
    v15.LoadAsync = function(_, v29, v30, v31)
        v31 = v31 or {};
        if v11 then
            if v29 == nil then
                v29 = true;
            end;
            if v30 == nil then
                v30 = true;
            end;
            v10.Image = "";
            if v30 then
                local _ = l_Utility_0.PropertyTweener(v10, "ImageTransparency", 1, 1, 0, l_Utility_0.EaseInOutQuad, true, nil);
            end;
            if not v20() then
                if not v29 then
                    v21();
                else
                    v31.Parent = v31.Parent or v10;
                    v27 = l_LoadingWidget_0(v31, {
                        v21
                    });
                    v27:AwaitFinished();
                    v27:Cleanup();
                end;
            end;
            if not v17 then
                v10.Image = not not v18 and v19 or "";
                if v30 then
                    local _ = l_Utility_0.PropertyTweener(v10, "ImageTransparency", 1, 0, 0.25, l_Utility_0.EaseInOutQuad, true, nil);
                end;
            end;
            return v18;
        else
            return ;
        end;
    end;
    v15.Cancel = function(_)
        v16 = false;
        v17 = true;
    end;
    v15.SetTransparency = function(_, v36)
        if v27 then
            v27:SetTransparency(v36);
        end;
    end;
    return v15;
end;
v5.LoadAvatarThumbnailAsync = function(_, v38, v39, v40, v41, v42)
    local v43 = {};
    local v44 = false;
    local v45 = false;
    local v46 = false;
    local v47 = nil;
    local v48 = false;
    local function v53()
        local l_status_0, _ = pcall(function()
            local l_l_Players_0_UserThumbnailAsync_0, v50 = l_Players_0:GetUserThumbnailAsync(v39, v40, v41);
            v47 = l_l_Players_0_UserThumbnailAsync_0;
            v48 = v50;
        end);
        if (not l_status_0 or not v47) or not v48 then
            return false;
        else
            v46 = true;
            if v42 then
                v47 = v47 .. "&cb=" .. tostring(tick());
            end;
            l_Decal_0.Texture = v47;
            l_ContentProvider_0:PreloadAsync({
                l_Decal_0
            });
            return true;
        end;
    end;
    local function v55()
        local v54 = 0;
        v44 = true;
        v46 = false;
        while not (((not (v54 <= 6) or not v44) or v45) or v53()) do
            v54 = v54 + 1;
            wait(v54 ^ 2);
        end;
        v44 = false;
    end;
    local v56 = nil;
    v43.LoadAsync = function(_, v58, v59, v60)
        v60 = v60 or {};
        if v39 then
            if v58 == nil then
                v58 = true;
            end;
            if v59 == nil then
                v59 = true;
            end;
            v38.Image = "";
            if v59 then
                local _ = l_Utility_0.PropertyTweener(v38, "ImageTransparency", 1, 1, 0, l_Utility_0.EaseInOutQuad, true, nil);
            end;
            if not v53() then
                if not v58 then
                    v55();
                else
                    v60.Parent = v60.Parent or v38;
                    v56 = l_LoadingWidget_0(v60, {
                        v55
                    });
                    v56:AwaitFinished();
                    v56:Cleanup();
                end;
            end;
            if not v45 then
                v38.Image = not not v46 and v47 or "";
                if v59 then
                    local _ = l_Utility_0.PropertyTweener(v38, "ImageTransparency", 1, 0, 0.25, l_Utility_0.EaseInOutQuad, true, nil);
                end;
            end;
            return v46;
        else
            return ;
        end;
    end;
    v43.Cancel = function(_)
        v44 = false;
        v45 = true;
    end;
    v43.SetTransparency = function(_, v65)
        if v56 then
            v56:SetTransparency(v65);
        end;
    end;
    return v43;
end;
return v5;
