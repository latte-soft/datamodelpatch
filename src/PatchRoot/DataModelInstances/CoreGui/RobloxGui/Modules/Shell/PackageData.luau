local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("MarketplaceService");
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local v4 = nil;
pcall(function()
    v4 = game:GetService("ThirdPartyUserService");
end);
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_ReloaderManager_0 = require(l_Shell_0:FindFirstChild("ReloaderManager"));
local l_CachedData_0 = require(l_Shell_0:FindFirstChild("CachedData"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local v14 = require(l_Shell_0.Models.Bundle);
local v15 = require(l_Shell_0.BundleItem);
local function v18()
    local v16 = nil;
    local v17 = pcall(function()
        v16 = game.Players:GetCharacterAppearanceAsync(l_UserData_0.GetLocalUserIdAsync());
    end);
    if v16 then
        l_ContentProvider_0:PreloadAsync({
            v16
        });
    end;
    return v17;
end;
local v19 = {
    UpdateCachedDataAsync = nil, 
    UpdatePurchasedConsumablesAsync = nil
};
local v20 = false;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = 0;
local v26 = false;
do
    local l_v20_0, l_v21_0, l_v22_0, l_v23_0, l_v24_0, l_v25_0, l_v26_0 = v20, v21, v22, v23, v24, v25, v26;
    local function _()
        l_v21_0 = nil;
        l_v22_0 = nil;
        l_v23_0 = nil;
        l_v24_0 = nil;
        l_v25_0 = 0;
        l_v26_0 = false;
    end;
    local function v35(v36, v37)
        if type(v36) ~= "table" then
            return v36;
        elseif not v37 or not v37[v36] then
            local v38 = v37 or {};
            local v39 = setmetatable({}, (getmetatable(v36)));
            v38[v36] = v39;
            for v40, v41 in pairs(v36) do
                v39[v35(v40, v38)] = v35(v41, v38);
            end;
            return v39;
        else
            return v37[v36];
        end;
    end;
    local function v44()
        local v42 = 0;
        local v43 = 0;
        if not ((not l_v21_0 or not l_v21_0.Packages) or not l_v21_0.Packages.Data) then
            v42 = #l_v21_0.Packages.Data;
        end;
        l_Utility_0.ExponentialRepeat(function()
            return v43 <= v42;
        end, function()
            v19.UpdateCachedDataAsync();
            if not ((not l_v21_0 or not l_v21_0.Packages) or not l_v21_0.Packages.Data) then
                v43 = #l_v21_0.Packages.Data;
            end;
        end, 6);
        return v42 < v43;
    end;
    local v45 = 0;
    local v46 = nil;
    local v47 = nil;
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AuthenticationSuccess, "PackageData", function()
        local l_v45_0 = v45;
        l_v21_0 = nil;
        l_v22_0 = nil;
        l_v23_0 = nil;
        l_v24_0 = nil;
        l_v25_0 = 0;
        l_v26_0 = false;
        spawn(function()
            if l_v45_0 == v45 then
                spawn(v18);
                local l_AvatarPaneRefreshInterval_0 = l_GlobalSettings_0.AvatarPaneRefreshInterval;
                l_ReloaderManager_0:removeReloader("PackageData");
                l_v24_0 = l_ReloaderManager_0:addReloaderFunc("PackageData", v19.UpdateCachedDataAsync, l_AvatarPaneRefreshInterval_0);
                l_ReloaderManager_0:callReloaderFunc("PackageData", l_v24_0);
                l_Utility_0.DisconnectEvent(v46);
                if v3 then
                    v46 = v3.ConsumePurchased:connect(function(v50, v51)
                        if v50 == 3 then
                            spawn(function()
                                v19:UpdatePurchasedConsumablesAsync(v51);
                            end);
                        end;
                    end);
                end;
                if l_v20_0 then
                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.HardwareBundleGranted, (v44()));
                    l_v20_0 = false;
                end;
            end;
        end);
    end);
    l_Utility_0.DisconnectEvent(v47);
    if v3 then
        v47 = v3.ConsumePurchased:connect(function(v52, v53)
            if v52 == 3 then
                for _, v55 in pairs(v53) do
                    if v55.Type == "HardwareBundle" then
                        l_v20_0 = true;
                        return ;
                    end;
                end;
            end;
        end);
    end;
    local function v56()
        v45 = v45 + 1;
        l_ReloaderManager_0:removeReloader("PackageData");
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.AvatarEquipBegin, "VisiblePackageDataCache");
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.AvatarPurchaseBegin, "VisiblePackageDataCache");
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.AvatarEquipSuccess, "VisiblePackageDataCache");
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.AvatarPurchaseSuccess, "VisiblePackageDataCache");
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.CharacterUpdated, "VisiblePackageDataCache");
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.CharacterEquipped, "VisiblePackageDataCache");
        l_Utility_0.DisconnectEvent(v46);
        l_Utility_0.DisconnectEvent(v47);
    end;
    if v4 then
        v4.ActiveUserSignedOut:connect(v56);
    end;
    local function v61(v57)
        local v58 = nil;
        local function v59()
            return v58 == nil;
        end;
        local function v60()
            v58 = l_Http_0.MultiGetBundleDetailsAsync(v57);
        end;
        if #v57 > 0 then
            l_Utility_0.ExponentialRepeat(v59, v60, 2);
        end;
        return v58;
    end;
    local function v68(v62)
        local v63 = {};
        for _, v65 in ipairs(v62) do
            if v65.product then
                v65.productId = v65.product.id;
                v65.priceInRobux = v65.product.priceInRobux;
                v65.isPublicDomain = v65.product.isPublicDomain;
            end;
            if v65.creator then
                v65.creatorId = v65.creator.id;
            end;
            v65.partIds = {};
            if v65.items then
                for _, v67 in ipairs(v65.items) do
                    if v67.type == "Asset" then
                        table.insert(v65.partIds, v67.id);
                    end;
                end;
                table.sort(v65.partIds);
            end;
            table.insert(v63, v14.fromData(v65));
        end;
        return v63;
    end;
    local function v78()
        local v69 = {};
        local v70 = nil;
        do
            while true do
                local v71 = nil;
                l_Utility_0.ExponentialRepeat(function()
                    return v71 == nil;
                end, function()
                    v71 = l_Http_0.GetUserOwnedBundlesAsync(l_AppState_0.store:getState().RobloxUser.rbxuid, v70);
                end, 2);
                if not v71 then
                    v70 = nil;
                else
                    if v71.data then
                        local v72 = {};
                        for _, v74 in pairs(v71.data) do
                            if v74.bundleType == "BodyParts" then
                                table.insert(v72, v74.id);
                            end;
                        end;
                        local v75 = v61(v72);
                        if v75 then
                            for _, v77 in ipairs((v68(v75))) do
                                table.insert(v69, v77);
                            end;
                        end;
                    end;
                    v70 = v71.nextPageCursor;
                end;
                if v70 ~= nil then
                    --[[ close >= 2 ]]
                else
                    break;
                end;
            end;
        end;
        return v69;
    end;
    local function v87()
        local v79 = v78();
        local v80 = {
            Packages = {}, 
            OwnedInfo = {}
        };
        local v81 = {};
        if v79 then
            for _, v83 in ipairs(v79) do
                v81[v83.bundleId] = true;
                v80.OwnedInfo[v83.bundleId] = true;
                local v84 = v15.new(v83);
                v84:SetOwned(true);
                table.insert(v80.Packages, v84);
            end;
        end;
        table.sort(v80.Packages, function(v85, v86)
            if not v85:IsXboxAddOn() or not v86:IsXboxAddOn() then
                if not v85:IsXboxAddOn() then
                    if not v86:IsXboxAddOn() then
                        return v85:GetRobuxPrice() < v86:GetRobuxPrice();
                    else
                        return false;
                    end;
                else
                    return true;
                end;
            else
                return v85:GetBundleId() < v86:GetBundleId();
            end;
        end);
        return v80;
    end;
    v19.GetPackagesAndOwnedInfoAsync = function(_)
        local l_v45_1 = v45;
        local v90 = nil;
        l_Utility_0.ExponentialRepeat(function()
            local v91 = false;
            if v90 == nil then
                v91 = l_v45_1 == v45;
            end;
            return v91;
        end, function()
            v90 = v87();
        end, 3);
        if l_v45_1 ~= v45 then
            v90 = nil;
        end;
        return v90;
    end;
    local function v95(v92, v93)
        if (type(v92) == "table" and type(v93) == "table") and #v92 == #v93 then
            for v94 = 1, #v92 do
                if tonumber(v92[v94]) ~= tonumber(v93[v94]) then
                    return false;
                end;
            end;
            return true;
        else
            return false;
        end;
    end;
    v19.GetWearingPackageAssetIdAsync = function(_, v97)
        local l_v45_2 = v45;
        local v99 = nil;
        local l_rbxuid_0 = l_AppState_0.store:getState().RobloxUser.rbxuid;
        if not (not l_rbxuid_0 or not v97) then
            local v101 = l_Http_0.GetCurrentlyWearingAsync(l_rbxuid_0);
            if v101 then
                local l_assetIds_0 = v101.assetIds;
                for _, v104 in pairs(v97) do
                    if v95(v104:GetPartIds(), l_assetIds_0) then
                        v99 = tonumber(v104:GetBundleId());
                        break;
                    end;
                end;
            else
                return ;
            end;
        end;
        if l_v45_2 ~= v45 then
            v99 = nil;
        end;
        return v99;
    end;
    v19.GetProfileImageAsync = function(_)
        local l_v45_3 = v45;
        local v107 = {};
        if l_v23_0 then
            l_v23_0:Cancel();
        end;
        l_v23_0 = l_ThumbnailLoader_0:Create(v107, l_AppState_0.store:getState().RobloxUser.rbxuid, l_ThumbnailLoader_0.AvatarSizes.Size352x352, l_ThumbnailLoader_0.AssetType.Avatar, true);
        l_v23_0:LoadAsync(false, false);
        if not (v107.Image ~= "") or l_v45_3 ~= v45 then
            v107 = nil;
        end;
        return v107;
    end;
    local v108 = false;
    v19.UpdateCachedDataAsync = function()
        if v108 then
            while v108 do
                wait();
            end;
        end;
        v108 = true;
        local l_v45_4 = v45;
        local v110 = false;
        l_Utility_0.ExponentialRepeat(function()
            local v111 = false;
            if v110 == false then
                v111 = l_v45_4 == v45;
            end;
            return v111;
        end, function()
            v110 = v19:UpdateCachedData();
        end, 2);
        v108 = false;
    end;
    local function _(v112, v113)
        if v112 then
            v112.ProfileImage:Update(l_CachedData_0(v113, tick()));
            return ;
        else
            return ;
        end;
    end;
    local function v120(v115, v116)
        if v115 then
            local l_Data_0 = v115.Packages.Data;
            v115.WearingAssetId:Update(l_CachedData_0(v116, tick()));
            for _, v119 in pairs(l_Data_0) do
                if v119 then
                    if not v119:IsOwned() then
                        v119:SetWearing(false);
                    else
                        v119:SetWearing(v116 == v119:GetBundleId());
                    end;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    local function v127(v121, v122, v123)
        if v121 then
            local l_Data_1 = v121.Packages.Data;
            if v121.OwnedInfo then
                if not v121.OwnedInfo[v122] then
                    v121.OwnedInfo[v122] = l_CachedData_0(v123, tick());
                else
                    v121.OwnedInfo[v122]:Update(l_CachedData_0(v123, tick()));
                end;
            end;
            for _, v126 in pairs(l_Data_1) do
                if v126 and v126:GetBundleId() == v122 then
                    v126:SetOwned(v123);
                    if v123 then
                        break;
                    else
                        v126:SetWearing(false);
                        return ;
                    end;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v19.UpdateCachedData = function(_)
        local v129 = false;
        local l_v45_5 = v45;
        l_v26_0 = false;
        local l_v19_PackagesAndOwnedInfoAsync_0 = v19:GetPackagesAndOwnedInfoAsync();
        local v132 = l_v19_PackagesAndOwnedInfoAsync_0 and l_v19_PackagesAndOwnedInfoAsync_0.Packages;
        local v133 = l_v19_PackagesAndOwnedInfoAsync_0 and l_v19_PackagesAndOwnedInfoAsync_0.OwnedInfo;
        if not ((not l_v19_PackagesAndOwnedInfoAsync_0 or not v132) or not v133) then
            local v134 = {
                Packages = l_CachedData_0(v132, tick()), 
                OwnedInfo = {}
            };
            if v133 then
                for v135, v136 in pairs(v133) do
                    v134.OwnedInfo[v135] = l_CachedData_0(v136, tick());
                end;
            end;
            v134.WearingAssetId = l_CachedData_0(v19:GetWearingPackageAssetIdAsync(v132), tick());
            v134.ProfileImage = l_CachedData_0(v19:GetProfileImageAsync(), tick());
            if not (not (l_v45_5 == v45) or l_v26_0) then
                l_v21_0 = v134;
                l_v21_0.Version = tick();
                if not l_v22_0 then
                    l_v22_0 = v35(l_v21_0);
                    l_v22_0.OnProfileImageUpdateBegin = l_Utility_0.Signal();
                    l_v22_0.OnProfileImageUpdateEnd = l_Utility_0.Signal();
                    l_v22_0.OnDifferentWearing = l_Utility_0.Signal();
                    l_v22_0.OnDifferentOwned = l_Utility_0.Signal();
                    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.AvatarEquipBegin, "VisiblePackageDataCache");
                    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.AvatarPurchaseBegin, "VisiblePackageDataCache");
                    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.AvatarEquipSuccess, "VisiblePackageDataCache");
                    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.AvatarPurchaseSuccess, "VisiblePackageDataCache");
                    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.CharacterUpdated, "VisiblePackageDataCache");
                    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.CharacterEquipped, "VisiblePackageDataCache");
                    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AvatarEquipBegin, "VisiblePackageDataCache", function(_)
                        l_v26_0 = true;
                    end);
                    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AvatarPurchaseBegin, "VisiblePackageDataCache", function(_)
                        l_v26_0 = true;
                    end);
                    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AvatarEquipSuccess, "VisiblePackageDataCache", function(v139, v140)
                        local l_v45_6 = v45;
                        v120(l_v22_0, v139);
                        l_v22_0.OnDifferentWearing:fire(v139);
                        spawn(v18);
                        if not v140 then
                            l_v25_0 = l_v25_0 + 1;
                            local l_l_v25_0_0 = l_v25_0;
                            l_v22_0.OnProfileImageUpdateBegin:fire();
                            l_v26_0 = true;
                            local l_v19_ProfileImageAsync_0 = v19:GetProfileImageAsync();
                            if not (not (l_v45_6 == v45) or not l_v22_0) then
                                if not (l_l_v25_0_0 == l_v25_0) or not l_v19_ProfileImageAsync_0 then
                                    l_v22_0.OnProfileImageUpdateEnd:fire();
                                else
                                    local l_l_v22_0_0 = l_v22_0;
                                    if l_l_v22_0_0 then
                                        l_l_v22_0_0.ProfileImage:Update(l_CachedData_0(l_v19_ProfileImageAsync_0, tick()));
                                    end;
                                    l_v22_0.OnProfileImageUpdateEnd:fire(l_v19_ProfileImageAsync_0);
                                    return ;
                                end;
                            end;
                        end;
                    end);
                    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.AvatarPurchaseSuccess, "VisiblePackageDataCache", function(v145, v146)
                        v127(l_v22_0, v145, v146);
                        l_v22_0.OnDifferentOwned:fire(v145, v146);
                    end);
                    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.CharacterUpdated, "VisiblePackageDataCache", function()
                        local l_v45_7 = v45;
                        l_v25_0 = l_v25_0 + 1;
                        local l_l_v25_0_1 = l_v25_0;
                        l_v22_0.OnProfileImageUpdateBegin:fire();
                        l_v26_0 = true;
                        local l_v19_ProfileImageAsync_1 = v19:GetProfileImageAsync();
                        if not (not (l_v45_7 == v45) or not l_v22_0) then
                            if not (l_l_v25_0_1 == l_v25_0) or not l_v19_ProfileImageAsync_1 then
                                l_v22_0.OnProfileImageUpdateEnd:fire();
                            else
                                local l_l_v22_0_1 = l_v22_0;
                                if l_l_v22_0_1 then
                                    l_l_v22_0_1.ProfileImage:Update(l_CachedData_0(l_v19_ProfileImageAsync_1, tick()));
                                end;
                                l_v22_0.OnProfileImageUpdateEnd:fire(l_v19_ProfileImageAsync_1);
                                return ;
                            end;
                        end;
                    end);
                    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.CharacterEquipped, "VisiblePackageDataCache", function(v151, v152)
                        local v153 = {};
                        for _, v155 in pairs(v151) do
                            for _, v157 in pairs(v155) do
                                table.insert(v153, (tonumber(v157)));
                            end;
                        end;
                        table.sort(v153);
                        local v158 = nil;
                        local v159 = nil;
                        local l_Data_2 = l_v22_0.Packages.Data;
                        for _, v162 in pairs(l_Data_2) do
                            if v162:IsWearing() then
                                v159 = tonumber(v162:GetAssetId());
                            end;
                        end;
                        for _, v164 in pairs(l_Data_2) do
                            if v95(v164:GetPartIds(), v153) then
                                v158 = tonumber(v164:GetAssetId());
                                break;
                            end;
                        end;
                        if v159 ~= v158 then
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.AvatarEquipSuccess, v158, v152);
                        end;
                    end);
                end;
                v129 = true;
            end;
        end;
        return v129;
    end;
    v19.GetCachedData = function(_)
        if l_v22_0 then
            if l_v21_0 and l_v22_0.Version < l_v21_0.Version then
                l_v22_0.Packages:Update(l_v21_0.Packages);
                l_v22_0.WearingAssetId:Update(l_v21_0.WearingAssetId);
                l_v22_0.ProfileImage:Update(l_v21_0.ProfileImage);
                for v166, _ in pairs(l_v21_0.OwnedInfo) do
                    if not l_v22_0.OwnedInfo[v166] then
                        l_v22_0.OwnedInfo[v166] = l_v21_0.OwnedInfo[v166];
                    else
                        l_v22_0.OwnedInfo[v166]:Update(l_v21_0.OwnedInfo[v166]);
                    end;
                end;
                l_v22_0.Version = l_v21_0.Version;
            end;
        else
            while v108 do
                wait();
            end;
            if not l_v22_0 then
                l_ReloaderManager_0:callReloaderFunc("PackageData", l_v24_0);
            end;
        end;
        if l_v22_0 then
            for _, v169 in pairs(l_v22_0.Packages.Data) do
                local l_v169_BundleId_0 = v169:GetBundleId();
                local l_Data_3 = l_v22_0.WearingAssetId.Data;
                if not l_v22_0.OwnedInfo[l_v169_BundleId_0] or not l_v22_0.OwnedInfo[l_v169_BundleId_0].Data then
                    v169:SetOwned(false);
                    v169:SetWearing(false);
                else
                    v169:SetOwned(true);
                    v169:SetWearing(l_Data_3 == l_v169_BundleId_0);
                end;
            end;
        end;
        return l_v22_0;
    end;
    v19.HasCachedData = function(_)
        return l_v22_0 ~= nil;
    end;
    local v173 = false;
    v19.UpdatePurchasedConsumablesAsync = function(_, v175)
        local l_v45_8 = v45;
        if not l_v22_0 then
            while v108 do
                wait();
            end;
        end;
        while v173 do
            wait();
        end;
        v173 = true;
        if not (not (not (not (l_v45_8 == v45) or not v175) and #v175 > 0) or not l_v22_0) then
            local v177 = {};
            local v178 = false;
            for _, v180 in pairs(v175) do
                if v180 and tostring(v180.Type) == "Avatar" then
                    v177[tostring(v180.Roblox_BundleId)] = true;
                    v178 = true;
                elseif v180.Type == "HardwareBundle" then
                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.HardwareBundleGranted, (v44()));
                end;
            end;
            if v178 then
                local v181 = {};
                for _, v183 in pairs(l_v22_0.Packages.Data) do
                    local l_v183_AssetId_0 = v183:GetAssetId();
                    if v177[tostring(l_v183_AssetId_0)] then
                        table.insert(v181, l_v183_AssetId_0);
                    end;
                end;
                if not (not (l_v45_8 == v45) or not l_v22_0) then
                    l_v26_0 = true;
                    for v185 = 1, #v181 do
                        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.AvatarPurchaseSuccess, v181[v185], true);
                    end;
                end;
            end;
        end;
        v173 = false;
    end;
end;
return v19;
