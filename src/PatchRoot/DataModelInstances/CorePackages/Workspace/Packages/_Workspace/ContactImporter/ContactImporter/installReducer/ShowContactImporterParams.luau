local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Actions.SetContactImporterDisplayLogic);
local l_UpdateContactImporterModalLogic_0 = v1.SocialModalsCommon.Actions.UpdateContactImporterModalLogic;
local v4 = require(l_Parent_0.Actions.SetIsPhoneVerified);
local l_UpdateIsDiscoverabilityUnset_0 = v1.SocialModalsCommon.Actions.UpdateIsDiscoverabilityUnset;
local l_Rodux_0 = v1.Rodux;
local l_llama_0 = v1.llama;
local v8 = require(l_Parent_0.Common.Constants);
return l_Rodux_0.createReducer({
    [v8.SHOULD_SHOW_CONTACT_IMPORTER_FEATURE] = false, 
    [v8.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = false, 
    hasOSPermissions = false, 
    isPhoneVerified = false, 
    canUploadContacts = false, 
    isDiscoverabilityUnset = false
}, {
    [v2.name] = function(_, v10)
        local l_hasOSPermissions_0 = v10.hasOSPermissions;
        local l_isPhoneVerified_0 = v10.isPhoneVerified;
        local l_shouldShowContactImporterUpsellAgain_0 = v10.shouldShowContactImporterUpsellAgain;
        local l_canUploadContacts_0 = v10.canUploadContacts;
        return {
            [v8.SHOULD_SHOW_CONTACT_IMPORTER_FEATURE] = l_canUploadContacts_0 ~= false, 
            [v8.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = not (l_hasOSPermissions_0 and v10.isUserOptedInLocalStorage) and l_shouldShowContactImporterUpsellAgain_0, 
            hasOSPermissions = l_hasOSPermissions_0, 
            isPhoneVerified = l_isPhoneVerified_0, 
            canUploadContacts = l_canUploadContacts_0, 
            isDiscoverabilityUnset = v10.phoneNumberDiscoverability == v8.DISCOVERABILITY_UNSET
        };
    end, 
    [l_UpdateContactImporterModalLogic_0.name] = function(v15, v16)
        return (l_llama_0.Dictionary.join(v15, {
            hasOSPermissions = v16.hasOSPermissions, 
            [v8.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL] = v16[v8.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_MODAL]
        }));
    end, 
    [v4.name] = function(v17, v18)
        return l_llama_0.Dictionary.join(v17, {
            isPhoneVerified = v18.isPhoneVerified
        });
    end, 
    [l_UpdateIsDiscoverabilityUnset_0.name] = function(v19, v20)
        return l_llama_0.Dictionary.join(v19, {
            isDiscoverabilityUnset = v20.isDiscoverabilityUnset
        });
    end
});
