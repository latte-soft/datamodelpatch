local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialOnboardingButtons");
local v2 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v2.EventNames;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_getContactImporterParams_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.getContactImporterParams;
local v11 = require(l_Parent_0.SocialModalsCommon);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_EnumScreens_0 = v11.EnumScreens;
local v14 = require(l_script_FirstAncestor_0.Enums.SocialOnboardingButtonsEnum);
local v15 = require(l_script_FirstAncestor_0.Experiments.SocialOnboardingButtonsIXP);
local v16 = require(l_script_FirstAncestor_0.Hooks.useSocialOnboardingButtonsColors);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v18 = l_Images_0[game:DefineFastString("FindContactsIcon_v2", "icons/menu/contacts_large")];
local v19 = l_Images_0[game:DefineFastString("MyQRCodeIcon_v2", "icons/menu/scanqr_large")];
local v20 = l_Images_0[game:DefineFastString("SearchPeopleIcon_v2", "icons/menu/findfriends_large")];
local v21 = l_Images_0[game:DefineFastString("UnlockVoiceIcon_v2", "icons/controls/microphone")];
local v22 = l_Images_0[game:DefineFastString("MyProfileIcon_v2", "icons/menu/profilepicture_large")];
local v23 = l_Images_0[game:DefineFastString("AddFriendsIcon_v2", "icons/menu/friends_large")];
return function(v24, v25)
    local v26 = l_useLocalUserId_0();
    local v27 = l_useNavigation_0();
    local v28 = l_useLocalization_0({
        addFriends = "Feature.Friends.Feature.Friends.Heading.AddFriends", 
        searchPeople = "Feature.Friends.Label.SearchPeople", 
        findContacts = "Feature.Contacts.Label.FindContacts", 
        unlockVoice = "Feature.Friends.Label.UnlockVoice", 
        myProfile = "Feature.Friends.Label.MyProfile", 
        shareQRCode = "Feature.AddFriends.Label.MyQrCode"
    });
    local v29 = v15.useSocialOnboardingBtnsEnabled();
    local v30, v31, v32 = v16();
    local v33 = v5.useMemo(function()
        return v2.getAnalytics(v24.entryPoint)().fireAnalyticsEvent;
    end, {
        v24, 
        v2
    });
    local v37 = l_useSelector_0(function(v34)
        local l_HomePageUpsellCardVariation_0 = v34.HomePageUpsellCardVariation;
        local v36 = false;
        if l_HomePageUpsellCardVariation_0 ~= nil then
            v36 = false;
            if l_HomePageUpsellCardVariation_0.upsellCardType ~= nil then
                v36 = l_HomePageUpsellCardVariation_0.upsellCardType ~= "";
            end;
        end;
        return v36;
    end);
    local v39 = l_useAppPolicy_0(function(v38)
        return {
            contactImporterEnabled = v38.getContactImporterEnabled(), 
            upsellVoiceForPhoneVerification = v38.getUpsellVoiceForPhoneVerification()
        };
    end);
    local v40 = l_useSelector_0(l_getContactImporterParams_0);
    local v41 = v40.hasOSPermissions or false;
    local v42 = v40.canUploadContacts or false;
    local v43 = v40.isDiscoverabilityUnset or false;
    local v44 = v40.isPhoneVerified or false;
    local l_contactImporterEnabled_0 = v39.contactImporterEnabled;
    local v46 = (v39.upsellVoiceForPhoneVerification and not v44) and not v37;
    local v49 = v5.useCallback(function()
        v33(l_EventNames_0.FindContactsBtn);
        local v47 = not v41 or not v42;
        local v48 = {
            isFromAddFriendsPage = false, 
            openLearnMoreLink = v25.openLearnMoreLink, 
            showToast = v25.showToast, 
            isDiscoverabilityUnset = v43, 
            isPhoneVerified = v44, 
            openAmpUpsell = v25.openAmpUpsell, 
            isFromSocialOnboardingButtons = true
        };
        if not v47 then
            v27.navigate(l_EnumScreens_0.ContactsList, v48);
            return ;
        else
            v27.navigate(l_EnumScreens_0.ContactImporter, v48);
            return ;
        end;
    end, {
        v25, 
        v43, 
        v44, 
        v27, 
        v33
    });
    local v50 = v5.useCallback(function()
        v25.hideUpsellCard();
        v25.openDiscoverabilityModal({
            showToast = v25.showToast, 
            openLearnMoreLink = v25.openLearnMoreLink, 
            isStandaloneDiscoverabilityModal = true, 
            entryPoint = v24.entryPoint, 
            onClose = v25.closeCentralOverlay, 
            navigateOnActivated = v25.closeCentralOverlay
        });
    end, {
        v25, 
        v24
    });
    local v53, v54 = v5.useMemo(function()
        local v51 = {};
        table.insert(v51, {
            id = v14.ShareQRCodeBtn, 
            text = v28.shareQRCode, 
            icon = v19, 
            onActivated = function()
                v33(l_EventNames_0.MyQRCodeBtn);
                v25.navigateToQRCodePage();
            end, 
            backgroundColor = v30.myQRCode, 
            iconColor = v31, 
            extraId = v32
        });
        table.insert(v51, {
            id = v14.SearchFriendsBtn, 
            text = v28.searchPeople, 
            icon = v20, 
            onActivated = function()
                v33(l_EventNames_0.SearchPeopleBtn);
                v25.navigateToSearchFriends();
            end, 
            backgroundColor = v30.searchPeople, 
            iconColor = v31, 
            extraId = v32
        });
        if v46 then
            table.insert(v51, {
                id = v14.UnlockVoiceBtn, 
                text = v28.unlockVoice, 
                icon = v21, 
                onActivated = function()
                    v33(l_EventNames_0.UnlockVoiceBtn);
                    v25.openPhoneVerificationModal(v50);
                end, 
                backgroundColor = v30.unlockVoice, 
                iconColor = v31, 
                extraId = v32
            });
        end;
        local function v52()
            v33(l_EventNames_0.MyProfileBtn);
            v25.openProfilePeekView((tostring(v26)));
        end;
        if v26 then
            table.insert(v51, {
                id = v14.CompleteProfileBtn, 
                text = v28.myProfile, 
                icon = v22, 
                onActivated = v52, 
                backgroundColor = v30.myProfile, 
                iconColor = v31, 
                extraId = v32
            });
        end;
        if l_contactImporterEnabled_0 then
            if not v42 then
                table.insert(v51, 1, {
                    id = v14.FindContactsBtn, 
                    text = v28.findContacts, 
                    icon = v18, 
                    onActivated = v49, 
                    backgroundColor = v30.findContacts, 
                    iconColor = v31, 
                    extraId = v32
                });
            else
                table.insert(v51, {
                    id = v14.FindContactsBtn, 
                    text = v28.findContacts, 
                    icon = v18, 
                    onActivated = v49, 
                    backgroundColor = v30.findContacts, 
                    iconColor = v31, 
                    extraId = v32
                });
            end;
        end;
        return v51, {
            id = v14.AddFriendsBtn, 
            icon = v23, 
            backgroundColor = v30.addFriends, 
            iconColor = v31, 
            extraId = v32
        };
    end, {
        v24, 
        v25, 
        l_contactImporterEnabled_0, 
        v46, 
        v50, 
        v49, 
        v28, 
        v33, 
        v42, 
        v30, 
        v31, 
        v32
    });
    if not v29 then
        return nil, nil;
    else
        return v53, v54;
    end;
end;
