local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v4 = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellOverlay);
local v5 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local v6 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v10 = require(l_Parent_0.UIBlox);
local l_Images_0 = v10.App.ImageSet.Images;
local l_ImageSetLabel_0 = v10.Core.ImageSet.ImageSetLabel;
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagFixUpsellVerificationToNavigateToOverlays);
local l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0 = require(l_Parent_0.SharedFlags).GetFFlagAbstractPhoneUpsellFromCentralOverlay;
local v15 = {
    onSuccess = function()
    end, 
    closeUpsell = function()
    end
};
return function(v16)
    local v17 = v9(v15, v16);
    local v18 = l_useDispatch_0();
    local v19 = not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() and function()
        return v18(l_CloseCentralOverlay_0());
    end or nil;
    local v20, v21 = v2.useState(false);
    return v2.createElement(v2.Fragment, nil, {
        PhoneVerificationUpsellOverlay = v2.createElement(v4, v6.Dictionary.join(v17, {
            onSuccess = function()
                v21(true);
                task.delay(3, function()
                    if not v13 then
                        v17.onSuccess();
                        if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
                            if v19 then
                                v19();
                            end;
                            return ;
                        else
                            v17.closeUpsell();
                            return ;
                        end;
                    else
                        if not l_GetFFlagAbstractPhoneUpsellFromCentralOverlay_0() then
                            if v19 then
                                v19();
                            end;
                        else
                            v17.closeUpsell();
                        end;
                        v17.onSuccess();
                        return ;
                    end;
                end);
            end
        })), 
        SuccessOverlay = v20 and v2.createElement(v5, {
            image = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(40, 40), 
                Image = l_Images_0["icons/status/success_large"], 
                BackgroundTransparency = 1
            }), 
            text = l_useLocalization_0({
                verifySuccessKey = "Feature.VerificationUpsell.Heading.VerifiedSuccessfully.V2"
            }).verifySuccessKey
        })
    });
end;
