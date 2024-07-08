local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.ContactsListContainer);
local v3 = require(l_Parent_0.Flags.OffPlatformFriendRequestsIXP);
local v4 = require(l_Parent_0.Flags.getFFlagCIAmpUpsellExperimentEnabled);
local v5 = require(l_Parent_0.Flags.getFFlagPassNavigationIntoContactsList);
local v6 = require(l_Parent_0.Flags.FFlagDisablePhoneVerificationForCI);
local v7 = require(l_Parent_0.Flags.DisablePhoneVerificationForCIIXP);
local v8 = require(l_Parent_0.Flags.FFlagContactImporterUIRefactor);
local v9 = require(l_Parent_0.Flags.ContactImporterUIImprovementsIXP);
local l_Dash_0 = v1.Dash;
local l_Roact_0 = v1.Roact;
local l_useNavigation_0 = v1.useNavigation;
ContactsList = function(v13)
    local v14 = if not v5() then nil else l_useNavigation_0();
    local v15 = v3.useOffPlatformFriendRequestsVariant();
    local v16 = not not v4() and v3.useFindFriendsBannerVariant();
    local v17 = v7.useIsPVRequired({
        isExposureEnabled = true
    });
    local v18 = v9.useShouldDisplayUIImprovements();
    if not (v15 ~= v3.IXPVariants.BLENDED) or v15 == v3.IXPVariants.INVITES_ONLY then
        return l_Roact_0.createElement(v2, l_Dash_0.join({
            variant = v15, 
            showFindFriendsBannerVariant = v16, 
            navigation = v14, 
            isPVRequired = if not v6 then nil else v17, 
            showNewUI = if not v8 then nil else v18
        }, v13 or {}));
    else
        return nil;
    end;
end;
return ContactsList;
