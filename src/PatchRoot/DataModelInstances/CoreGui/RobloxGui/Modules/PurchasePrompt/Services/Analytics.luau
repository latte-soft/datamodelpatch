local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_Parent_0.Utils.getPaymentPlatform);
local v8 = require(l_Parent_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local v9 = require(l_Parent_0.Flags.GetFFlagUsePlatformNameForUnknown);
local v10 = require(l_Parent_0.Flags.GetFFlagEnableQuestIAPAnalytics);
return {
    new = function()
        local v11 = {};
        setmetatable(v11, {
            __tostring = function()
                return "Service(Analytics)";
            end, 
            __index = function(v12, v13)
                return v12[v13];
            end
        });
        local function v17()
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v15 = "UNKNOWN";
            if v9() then
                v15 = tostring(l_l_UserInputService_0_Platform_0);
            end;
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
                v15 = "Windows";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                v15 = "OSX";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
                v15 = "IOS";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
                local l_l_HttpService_0_UserAgent_0 = l_HttpService_0:GetUserAgent();
                v15 = not string.find(l_l_HttpService_0_UserAgent_0, "AmazonAppStore") and "Android" or "Amazon";
                if not (not v10() or not string.find(l_l_HttpService_0_UserAgent_0, "OculusQuest3Store")) then
                    v15 = "Quest";
                end;
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
                v15 = "XBoxOne";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
                v15 = "UWP";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 then
                v15 = "PlayStation";
            end;
            if v8() then
                v15 = v15 + "-Luobu";
            end;
            return v15;
        end;
        local function _(v18)
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter(v18 .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.sendCounter = function(v20)
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter(v20);
                return ;
            else
                return ;
            end;
        end;
        local function _(v21, v22)
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", v21, v22 or {});
                return ;
            else
                return ;
            end;
        end;
        v11.signalEvent = function(v24, v25)
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", v24, v25 or {});
                return ;
            else
                return ;
            end;
        end;
        v11.reportRobuxUpsellStarted = function()
            return l_MarketplaceService_0:ReportRobuxUpsellStarted();
        end;
        v11.signalPurchaseSuccess = function(v26, v27, v28, v29)
            if v27 == Enum.InfoType.Product then
                l_MarketplaceService_0:SignalClientPurchaseSuccess(v29.receipt, l_Players_0.LocalPlayer.UserId, v26);
                return ;
            else
                l_MarketplaceService_0:ReportAssetSale(v26, v28);
                return ;
            end;
        end;
        v11.signalPremiumUpsellShownPremium = function()
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellShownPremium", {
                gameID = game.GameId
            });
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellShownPremium" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalPremiumUpsellShownNonPremium = function()
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellShownNonPremium", {
                gameID = game.GameId
            });
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellShownNonPremium" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalPremiumUpsellConfirmed = function()
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellConfirmed", {
                gameID = game.GameId
            });
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellConfirmed" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalPremiumUpsellPrecheckFail = function()
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellPrecheckFail", {
                gameID = game.GameId
            });
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellPrecheckFail" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalPremiumUpsellInvalidProducts = function()
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellInvalidProducts", {
                gameID = game.GameId
            });
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellInvalidProducts" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalPremiumUpsellInvalidPlatform = function()
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "PremiumUpsellInvalidPlatform", {
                gameID = game.GameId
            });
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("PremiumUpsellInvalidPlatform" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalAdultLegalTextShown = function()
            l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "AdultLegalTextShown", {
                gameID = game.GameId
            });
        end;
        v11.signalFailedPurchasePostUpsell = function()
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("FailedBalanceCheckPostUpsell" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalProductPurchaseShown = function(v30, v31)
            local v32 = {
                gameID = game.GameId, 
                productId = v30, 
                requestType = tostring(v31)
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseShown", v32 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("ProductPurchaseShown" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalProductPurchaseUpsellShown = function(v33, v34, v35)
            local v36 = {
                gameID = game.GameId, 
                productId = v33, 
                requestType = tostring(v34), 
                iapProductId = v35
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellShown", v36 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("ProductPurchaseUpsellShown" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalProductPurchaseConfirmed = function(v37, v38)
            local v39 = {
                gameID = game.GameId, 
                productId = v37, 
                requestType = tostring(v38)
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseConfirmed", v39 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("ProductPurchaseConfirmed" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalProductPurchaseUpsellConfirmed = function(v40, v41, v42)
            local v43 = {
                gameID = game.GameId, 
                productId = v40, 
                requestType = tostring(v41), 
                iapProductId = v42
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ProductPurchaseUpsellConfirmed", v43 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("ProductPurchaseUpsellConfirmed" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalScaryModalShown = function(v44, v45, v46)
            local v47 = {
                gameID = game.GameId, 
                productId = v44, 
                requestType = v45, 
                iapProductId = v46 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ScaryModalShown", v47 or {});
            end;
            v47 = "ScaryModalShown" .. v45;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter(v47 .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalScaryModalConfirmed = function(v48, v49, v50)
            local v51 = {
                gameID = game.GameId, 
                productId = v48, 
                requestType = v49, 
                iapProductId = v50 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ScaryModalConfirmed", v51 or {});
            end;
            v51 = "ScaryModalConfirmed" .. v49;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter(v51 .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalScaryModalCanceled = function(v52, v53, v54)
            local v55 = {
                gameID = game.GameId, 
                productId = v52, 
                requestType = v53, 
                iapProductId = v54 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "ScaryModalCanceled", v55 or {});
            end;
            v55 = "ScaryModalCanceled" .. v53;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter(v55 .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalXboxInGamePurchaseCanceled = function(v56, v57, v58)
            local v59 = {
                gameID = game.GameId, 
                productId = v56, 
                requestType = v57, 
                iapProductId = v58 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseCanceled", v59 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("XboxPaymentsInGamePurchaseCanceled");
            end;
        end;
        v11.signalXboxInGamePurchaseSuccess = function(v60, v61, v62)
            local v63 = {
                gameID = game.GameId, 
                productId = v60, 
                requestType = v61, 
                iapProductId = v62 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseSuccess", v63 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("XboxPaymentsInGamePurchaseSuccess");
            end;
        end;
        v11.signalXboxInGamePurchaseFailure = function(v64, v65, v66)
            local v67 = {
                gameID = game.GameId, 
                productId = v64, 
                requestType = v65, 
                iapProductId = v66 or ""
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "XboxPaymentsInGamePurchaseFailure", v67 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("XboxPaymentsInGamePurchaseFailure");
            end;
        end;
        v11.signalTwoSVSettingsErrorShown = function(v68, v69)
            local v70 = {
                gameID = game.GameId, 
                productId = v68, 
                requestType = v69
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorShown", v70 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("2SVSettingsErrorShown" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalTwoSVSettingsErrorConfirmed = function(v71, v72)
            local v73 = {
                gameID = game.GameId, 
                productId = v71, 
                requestType = v72
            };
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "2SVSettingsErrorConfirmed", v73 or {});
            end;
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("2SVSettingsErrorConfirmed" .. v17());
                return ;
            else
                return ;
            end;
        end;
        v11.signalRobuxUpsellInGameIXP = function(v74)
            local v75 = {};
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:SetRBXEvent("client", "InGamePrompt", "RobuxUpsellInGameIXP", v75 or {});
            end;
            if v74 then
                if not l_RunService_0:IsStudio() then
                    l_RbxAnalyticsService_0:ReportCounter("RobuxUpsellInGameIXP" .. v17());
                else
                    return ;
                end;
            end;
        end;
        return v11;
    end
};
