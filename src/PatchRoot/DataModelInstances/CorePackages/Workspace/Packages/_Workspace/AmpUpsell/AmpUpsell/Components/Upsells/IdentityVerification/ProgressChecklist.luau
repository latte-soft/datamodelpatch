local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.ProgressTile);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_IDVStep_0 = require(l_script_FirstAncestor_0.Common.Enums).IDVStep;
return function(v6)
    local v7 = l_useLocalization_0({
        connectedMobile = "Verification.Identity.Label.ConnectingToMobile", 
        verifyingYou = "Verification.Identity.Label.VerifyingYou", 
        waitingForResults = "Verification.Identity.Label.VerificationWaitingForResults", 
        updatingRbxProfile = "Verification.Identity.Label.UpdatingRoblox"
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 4 * v6.entryHeight), 
        BackgroundTransparency = 1, 
        LayoutOrder = v6.layoutOrder
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        MobileCheck = v2.createElement(v3, {
            frameHeight = v6.entryHeight, 
            layoutOrder = 1, 
            finished = l_IDVStep_0.ConnectedMobile <= v6.latestStepCompleted, 
            progressText = v7.connectedMobile
        }), 
        VerifiedCheck = v2.createElement(v3, {
            frameHeight = v6.entryHeight, 
            layoutOrder = 2, 
            finished = l_IDVStep_0.Verified <= v6.latestStepCompleted, 
            progressText = v7.verifyingYou
        }), 
        GotResultsCheck = v2.createElement(v3, {
            frameHeight = v6.entryHeight, 
            layoutOrder = 3, 
            finished = l_IDVStep_0.GotResults <= v6.latestStepCompleted, 
            progressText = v7.waitingForResults
        }), 
        UpdateProfileCheck = v2.createElement(v3, {
            frameHeight = v6.entryHeight, 
            layoutOrder = 4, 
            finished = l_IDVStep_0.UpdatedRobloxProfile <= v6.latestStepCompleted, 
            progressText = v7.updatingRbxProfile
        })
    });
end;
