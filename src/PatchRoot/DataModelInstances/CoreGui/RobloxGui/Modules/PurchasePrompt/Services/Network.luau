local l_Parent_0 = script.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_InsertService_0 = game:GetService("InsertService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_UrlBuilder_0 = require(game:GetService("CorePackages").PurchasePromptDeps).UrlBuilder.UrlBuilder;
local v8 = require(l_Parent_0.Promise);
local v9 = require(l_Parent_0.Models.PremiumProduct);
local v10 = require(l_Parent_0.Utils.debugLog);
local v11 = require(l_Parent_0.Utils.serializeTable);
local v12 = require(l_Parent_0.Utils.isGenericChallengeResponse);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnablePlayerOwnsBundleApi");
local v14 = require(l_Parent_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2);
local v15 = require(l_Parent_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2);
local v16 = string.gsub(string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www."), "http:", "https:");
local _ = string.gsub(v16, "https://www", "https://api");
local v18 = string.gsub(v16, "https://www", "https://apis");
local v19 = string.gsub(v16, "https://www", "https://abtesting");
local v20 = string.gsub(v16, "https://www.", "https://catalog.");
local v21 = string.gsub(v16, "https://www.", "https://economy.");
local v22 = string.gsub(v16, "https://www.", "https://premiumfeatures.");
local v23 = string.gsub(v16, "https://www.", "https://economycreatorstats.");
local v24 = string.gsub(v16, "https://www", "https://users");
local function v33(v25, v26, v27)
    v10(function()
        return "Request " .. v25.Url .. "\n" .. v11(v25);
    end);
    return l_HttpService_0:RequestInternal(v25):Start(function(v28, v29)
        v10(function()
            return "Response " .. v25.Url .. "\n" .. v11(v29);
        end);
        if not v28 then
            v27((tostring(v29.StatusMessage)));
            return ;
        else
            local v30 = nil;
            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v29.Body);
            v28 = l_status_0;
            v30 = l_result_0;
            if not v28 then
                v27("Could not parse JSON.");
                return ;
            else
                v26(v30);
                return ;
            end;
        end;
    end);
end;
local function v39(v34, v35)
    local v36 = {
        {
            ExperimentName = v35, 
            SubjectType = 1, 
            SubjectTargetId = v34
        }
    };
    return v8.new(function(v37, v38)
        return v33({
            Url = v19 .. "v1/get-enrollments", 
            Method = "POST", 
            Body = l_HttpService_0:JSONEncode(v36), 
            Headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }, v37, v38);
    end);
end;
local function v42(v40, v41)
    return l_MarketplaceService_0:GetProductInfo(v40, v41);
end;
local function v50()
    return v8.new(function(v43, v44)
        v33({
            Url = v22 .. "v1/products?typeName=Subscription", 
            Method = "GET"
        }, function(v45)
            local v46 = nil;
            for _, v48 in ipairs(v45.products) do
                local v49 = v9(v48);
                if v49 ~= nil and (not (v46 ~= nil) or v49.robuxAmount < v46.robuxAmount) then
                    v46 = v49;
                end;
            end;
            if (l_UserInputService_0:GetPlatform() == Enum.Platform.Android and v46 ~= nil) and v46.mobileProductId ~= nil then
                v46.mobileProductId = v46.mobileProductId:lower();
            end;
            v43(v46);
        end, v44);
    end);
end;
local function v54(v51, v52, v53)
    if v53 == Enum.InfoType.Asset then
        return l_MarketplaceService_0:PlayerOwnsAsset(v51, v52);
    elseif l_game_EngineFeature_0 and v53 == Enum.InfoType.Bundle then
        return l_MarketplaceService_0:PlayerOwnsBundle(v51, v52);
    elseif v53 == Enum.InfoType.GamePass then
        return l_MarketplaceService_0:UserOwnsGamePassAsync(v51.UserId, v52);
    elseif v53 == Enum.InfoType.Subscription then
        return l_MarketplaceService_0:IsPlayerSubscribed(v51, v52);
    else
        return false;
    end;
end;
local function v66(v55, v56, v57, v58, v59, v60, v61, v62, v63)
    local l_status_1, l_result_1 = pcall(function()
        if not v14() and not v15() then
            return l_MarketplaceService_0:PerformPurchase(v55, v56, v57, v58, v59, v60, v61, v62);
        else
            return l_MarketplaceService_0:PerformPurchase(v55, v56, v57, v58, v59, v60, v61, v62, v63);
        end;
    end);
    if not l_status_1 then
        if not v12(l_result_1) then
            error((tostring(l_result_1)));
            return ;
        else
            return l_result_1;
        end;
    else
        return l_result_1;
    end;
end;
local function v79(v67, v68, v69, v70, v71, v72, v73, v74, v75, v76)
    local l_status_2, l_result_2 = pcall(function()
        return l_MarketplaceService_0:PerformPurchaseV2(v67, v68, v69, v70, v71, {
            CollectibleItemId = v72, 
            CollectibleProductId = v73, 
            IdempotencyKey = v74, 
            PurchaseAuthToken = v75, 
            CollectibleItemInstanceId = v76
        });
    end);
    if not l_status_2 then
        if not v12(l_result_2) then
            error((tostring(l_result_2)));
            return ;
        else
            return l_result_2;
        end;
    else
        return l_result_2;
    end;
end;
local function v81(v80)
    return l_InsertService_0:LoadAsset(v80);
end;
local function v84()
    return v8.new(function(v82, v83)
        v33({
            Url = v24 .. "v1/users/authenticated/app-launch-info", 
            Method = "GET"
        }, v82, v83);
    end);
end;
local function v87()
    return v8.new(function(v85, v86)
        v33({
            Url = v21 .. "v1/user/currency", 
            Method = "GET"
        }, v85, v86);
    end);
end;
local function v92(v88)
    local v89 = {
        Url = v20 .. "v1/bundles/" .. tostring(v88) .. "/details", 
        Method = "GET"
    };
    return v8.new(function(v90, v91)
        spawn(function()
            v33(v89, v90, v91);
        end);
    end);
end;
local function v97(v93)
    local v94 = {
        Url = v21 .. "v1/products/" .. tostring(v93) .. "?showPurchasable=true", 
        Method = "GET"
    };
    return v8.new(function(v95, v96)
        spawn(function()
            v33(v94, v95, v96);
        end);
    end);
end;
local function v104(v98, v99, v100)
    local v101 = {
        Url = v18 .. "payments-gateway/v1/products/get-upsell-product", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            upsell_platform = v100, 
            user_robux_balance = v99, 
            attempt_robux_amount = v98
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v8.new(function(v102, v103)
        spawn(function()
            v33(v101, v102, v103);
        end);
    end);
end;
local function v110()
    local v105 = {
        Url = v23 .. "v1/universes/" .. tostring(game.GameId) .. "/premium-impressions/increment", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode("{}"), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v8.new(function(_, _)
        spawn(function()
            return l_HttpService_0:RequestInternal(v105):Start(function(_, _)
            end);
        end);
    end);
end;
local function v116()
    local v111 = {
        Url = string.format("%sv1/users/%d/premium-upsell-precheck?universeId=%d&placeId=%d", v22, l_Players_0.LocalPlayer.UserId, game.GameId, game.PlaceId), 
        Method = "GET"
    };
    return v8.new(function(v112, v113)
        spawn(function()
            return l_HttpService_0:RequestInternal(v111):Start(function(v114, v115)
                if v114 and v115.StatusCode == 200 then
                    v112();
                    return ;
                else
                    v113();
                    return ;
                end;
            end);
        end);
    end);
end;
local function v118(v117)
    return l_MarketplaceService_0:GetSubscriptionPurchaseInfoAsync(v117);
end;
local function v120(v119)
    return l_MarketplaceService_0:performSubscriptionPurchase(v119);
end;
local function v123(v121, v122)
    return l_MarketplaceService_0:PerformSubscriptionPurchaseV2(v121, v122);
end;
local function v130(v124, v125, v126)
    local v127 = {
        Url = l_UrlBuilder_0.economy.purchaseWarning.getPurchaseWarning(v124, v125, not v126), 
        Method = "GET"
    };
    return v8.new(function(v128, v129)
        spawn(function()
            v33(v127, v128, v129);
        end);
    end);
end;
local function v137(v131)
    local v132 = {
        Url = l_UrlBuilder_0.economy.purchaseWarning.ackPurchaseWarning(), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            acknowledgement = v131
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v8.new(function(_, _)
        spawn(function()
            return l_HttpService_0:RequestInternal(v132):Start(function(_, _)
            end);
        end);
    end);
end;
return {
    new = function()
        local v138 = {
            getABTestGroup = v8.promisify(v39), 
            getProductInfo = v8.promisify(v42), 
            getPlayerOwns = v8.promisify(v54), 
            performPurchase = v8.promisify(v66), 
            performPurchaseV2 = v8.promisify(v79), 
            loadAssetForEquip = v8.promisify(v81), 
            getAccountInfo = v8.promisify(v84), 
            getBalanceInfo = v8.promisify(v87), 
            getBundleDetails = v92, 
            getProductPurchasableDetails = v97, 
            getRobuxUpsellProduct = v8.promisify(v104), 
            getPremiumProductInfo = v8.promisify(v50), 
            postPremiumImpression = v8.promisify(v110), 
            getPremiumUpsellPrecheck = v8.promisify(v116), 
            getSubscriptionPurchaseInfo = v8.promisify(v118), 
            DEPRECATED_performSubscriptionPurchase = v8.promisify(v120), 
            performSubscriptionPurchase = v8.promisify(v123), 
            getPurchaseWarning = v8.promisify(v130), 
            postPurchaseWarningAcknowledge = v8.promisify(v137)
        };
        setmetatable(v138, {
            __tostring = function()
                return "Service(Network)";
            end
        });
        return v138;
    end
};
