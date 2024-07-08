local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_CorePackages_0.Packages.Promise);
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v7 = require(script.Parent.Parent.Flags.GetFFlagIBEnableCollectiblePurchaseForUnlimited);
local v8 = string.format("https://develop.%s", l_Url_0.DOMAIN);
local function _(v9, v10, v11, v12)
    return l_HttpService_0:RequestInternal(v9):Start(function(v13, v14)
        if v13 and v14.StatusCode == 200 then
            local v15 = true;
            local v16 = nil;
            if v10 and v14.Body ~= "null" then
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v14.Body);
                v15 = l_status_0;
                v16 = l_result_0;
            else
                v16 = v14.Body;
            end;
            if not v15 then
                v12("Could not parse JSON.");
                return ;
            else
                v11(v16);
                return ;
            end;
        else
            v12(v14);
            return ;
        end;
    end);
end;
local function v35(v20, v21)
    return v4.new(function(v22, v23)
        coroutine.wrap(function()
            local l_v20_0 = v20;
            local l_v21_0 = v21;
            local l_v22_0 = v22;
            local l_v23_0 = v23;
            local _ = l_HttpService_0:RequestInternal(l_v20_0):Start(function(v28, v29)
                if v28 and v29.StatusCode == 200 then
                    local v30 = true;
                    local v31 = nil;
                    if l_v21_0 and v29.Body ~= "null" then
                        local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v29.Body);
                        v30 = l_status_1;
                        v31 = l_result_1;
                    else
                        v31 = v29.Body;
                    end;
                    if not v30 then
                        l_v23_0("Could not parse JSON.");
                        return ;
                    else
                        l_v22_0(v31);
                        return ;
                    end;
                else
                    l_v23_0(v29);
                    return ;
                end;
            end);
        end)();
    end);
end;
local function v41(v36)
    return v4.new(function(v37, v38)
        local l_status_2, l_result_2 = pcall(function()
            return l_MarketplaceService_0:GetProductInfo(v36);
        end);
        if not l_status_2 then
            v38("Failure in getProductInfo: ", (tostring(l_result_2)));
            return ;
        else
            v37(l_result_2);
            return ;
        end;
    end);
end;
local function v48(v42, v43)
    return v4.new(function(v44, v45)
        local l_status_3, l_result_3 = pcall(function()
            return l_AvatarEditorService_0:GetItemDetails(v42, v43);
        end);
        if not l_status_3 then
            v45("Failure in getItemDetails: ", (tostring(l_result_3)));
            return ;
        else
            v44(l_result_3);
            return ;
        end;
    end);
end;
local function v54(v49)
    return v4.new(function(v50, v51)
        local l_status_4, l_result_4 = pcall(function()
            return l_Players_0:GetNameFromUserIdAsync(v49);
        end);
        if not l_status_4 then
            v51("Failure in getPlayerName: ", (tostring(l_result_4)));
            return ;
        else
            v50(l_result_4);
            return ;
        end;
    end);
end;
local function v56(v55)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/assets/" .. tostring(v55) .. "/bundles", 
        Method = "GET"
    }, true);
end;
local function v61(v57)
    return v4.new(function(v58, _)
        spawn(function()
            local l_l_Players_0_HumanoidDescriptionFromOutfitId_0 = l_Players_0:GetHumanoidDescriptionFromOutfitId(v57);
            if l_l_Players_0_HumanoidDescriptionFromOutfitId_0 then
                v58(l_l_Players_0_HumanoidDescriptionFromOutfitId_0);
            end;
        end);
    end);
end;
local function v63(v62)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/assets/" .. tostring(v62) .. "/count", 
        Method = "GET"
    }, false);
end;
local function v65(v64)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/bundles/" .. tostring(v64) .. "/count", 
        Method = "GET"
    }, false);
end;
local function v67(v66)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_Players_0.LocalPlayer.UserId) .. "/assets/" .. tostring(v66) .. "/favorite", 
        Method = "GET"
    }, true);
end;
local function v69(v68)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_Players_0.LocalPlayer.UserId) .. "/bundles/" .. tostring(v68) .. "/favorite", 
        Method = "GET"
    }, true);
end;
local function v71(v70)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_Players_0.LocalPlayer.UserId) .. "/assets/" .. tostring(v70) .. "/favorite", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({})
    }, true);
end;
local function v73(v72)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_Players_0.LocalPlayer.UserId) .. "/assets/" .. tostring(v72) .. "/favorite", 
        Method = "DELETE"
    }, true);
end;
local function v75(v74)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_Players_0.LocalPlayer.UserId) .. "/bundles/" .. tostring(v74) .. "/favorite", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({})
    }, true);
end;
local function v77(v76)
    return v35({
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_Players_0.LocalPlayer.UserId) .. "/bundles/" .. tostring(v76) .. "/favorite", 
        Method = "DELETE"
    }, true);
end;
local function v79(v78)
    return v35({
        Url = l_Url_0.ECONOMY_URL .. "v1/products/" .. tostring(v78) .. "?showPurchasable=true", 
        Method = "GET"
    }, true);
end;
local function v84(v80)
    return v4.new(function(v81, v82)
        spawn(function()
            local l_l_Players_0_HumanoidModelFromUserId_0 = l_Players_0:CreateHumanoidModelFromUserId(v80);
            if not l_l_Players_0_HumanoidModelFromUserId_0 then
                v82("Failure in getModelFromUserId");
                return ;
            else
                v81(l_l_Players_0_HumanoidModelFromUserId_0);
                return ;
            end;
        end);
    end);
end;
local function v87(v85, v86)
    return v35({
        Url = string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", l_Url_0.APIS_URL, v85, (l_Url_0:makeQueryString({
            ownerId = tostring(v86), 
            ownerType = "User", 
            cursor = "", 
            limit = 500
        }))), 
        Method = "GET"
    }, true);
end;
local function v89(v88)
    return v35({
        Url = string.format("%sv1/assets/%s/saved-versions", v8, v88), 
        Method = "GET"
    }, true);
end;
local function v91(v90)
    return v35({
        Url = string.format("%sv1/games/multiget-playability-status?universeIds=%s", l_Url_0.GAME_URL, v90), 
        Method = "GET"
    }, true);
end;
local function v93(v92)
    return v35({
        Url = string.format("%sv1/games?universeIds=%s", l_Url_0.GAME_URL, v92), 
        Method = "GET"
    }, true);
end;
return {
    new = function()
        local v94 = {
            getProductInfo = v41, 
            getEconomyProductInfo = v79, 
            getPlayerName = v54, 
            getAssetBundles = v56, 
            getHumanoidDescriptionFromCostumeId = v61, 
            getAssetFavoriteCount = v63, 
            getBundleFavoriteCount = v65, 
            getFavoriteForAsset = v67, 
            getFavoriteForBundle = v69, 
            createFavoriteForAsset = v71, 
            deleteFavoriteForAsset = v73, 
            createFavoriteForBundle = v75, 
            deleteFavoriteForBundle = v77, 
            getModelFromUserId = v84, 
            getCollectibleResellableInstances = v87, 
            getVersionInfo = v89, 
            getExperiencePlayability = v91, 
            getExperienceInfo = v93, 
            getItemDetails = if not v7() then nil else v48
        };
        setmetatable(v94, {
            __tostring = function()
                return "Service(Network)";
            end
        });
        return v94;
    end
};
