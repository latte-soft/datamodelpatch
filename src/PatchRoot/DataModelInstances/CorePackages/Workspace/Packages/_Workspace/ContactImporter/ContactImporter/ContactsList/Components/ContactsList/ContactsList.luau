local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useLocalization_0 = v1.useLocalization;
local l_useStyle_0 = v1.useStyle;
local l_useSelector_0 = v1.useSelector;
local l_FullPageModal_0 = l_UIBlox_0.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_FlatList_0 = v1.FlatList;
local l_SectionList_0 = v1.SectionList;
local v14 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v15 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListEntry);
local v16 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListInviteEntry);
local v17 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsEmptyList);
local v18 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsUploadErrorModal);
local v19 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsGlimmer);
local l_EventNames_0 = require(l_script_FirstAncestor_0.Analytics).EventNames;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v22 = require(l_script_FirstAncestor_0.ContactsList.Components.FindFriendsBanner);
local v23 = require(l_script_FirstAncestor_0.ContactsList.Components.ContactsListSearchBar);
local l_Dash_0 = v1.Dash;
local v25 = require(l_script_FirstAncestor_0.Flags.ContactImportButtonsIXP);
local v26 = require(l_script_FirstAncestor_0.Flags.OffPlatformFriendRequestsIXP);
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagCIAmpUpsellEnabledForAll);
local l_IXPVariants_0 = v26.IXPVariants;
local v29 = game:DefineFastFlag("ContactImportButtonsExperimentEnabled", false);
local v30 = require(l_script_FirstAncestor_0.Utils.getContactImporterParams);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagDisablePhoneVerificationForCI);
local v32 = require(l_script_FirstAncestor_0.Flags.DisablePhoneVerificationForCIIXP);
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagContactImporterUIRefactor);
local l_UserInputService_0 = v1.UserInputService;
return function(v35)
    local v36 = l_useStyle_0();
    local v37 = v33 and v35.showNewUI;
    local v38 = v32.useShouldShowPVUpsell({
        isExposureEnabled = true
    });
    local v39 = v32.useIsPVRequired({
        isExposureEnabled = true
    });
    local l_isPhoneVerified_0 = l_useSelector_0(v30).isPhoneVerified;
    local v41 = if v35.variant ~= l_IXPVariants_0.INVITES_ONLY and v35.showMatchedContacts then v14.CONTACTS_LIST_BLURB_MIXED else v14.CONTACTS_LIST_BLURB_INVITES;
    if not (not v31 or v39) then
        v41 = v14.CONTACTS_LIST_BLURB_MIXED;
    end;
    local v42 = l_useLocalization_0({
        fromContactsText = v14.ON_ROBLOX, 
        inviteToRobloxText = v14.INVITE_TO_ROBLOX, 
        contactsListBlurb = v41, 
        connectWithFriends = v14.CONTACTS_LIST_TITLE, 
        closeModal = v14.CLOSE_MODAL, 
        goToAddFriends = v14.GO_TO_ADD_FRIENDS, 
        searchContacts = v14.SEARCH_CONTACTS
    });
    local v43 = not not v29 and v25.useIsRemoveCloseButtonExperimentEnabled({
        isExposureEnabled = true
    });
    local v44 = not not v29 and v25.useIsGreenFindFriendsButtonExperimentEnabled({
        isExposureEnabled = true
    });
    local function v48(v45, v46, v47)
        l_Dash_0.append(v45, v46, if #v46 ~= 0 then {
            {
                isSectionDivider = true
            }
        } else nil, v47);
    end;
    local function v49()
        v35.closeModal(l_EventNames_0.CloseContactListButton);
    end;
    local function v50()
        v35.closeModal(l_EventNames_0.CloseContactListCross);
    end;
    local v51, v52 = l_React_0.useState("");
    local function _(v53)
        return l_Dash_0.filter(v53, function(v54)
            if v54.contactName ~= nil then
                if v54.contactName:match("^%s*$") then
                    return nil;
                else
                    return (string.find(string.lower(v54.contactName or ""), string.lower(v51)));
                end;
            else
                return string.find(string.lower(v54.contactName or ""), string.lower(v51));
            end;
        end);
    end;
    local v56 = not (v27() or v35.showFindFriendsBannerVariant);
    if not v56 then
        v56 = true;
        if #v35.matchedContacts <= 0 then
            v56 = v35.isFetching or v35.openAmpUpsell == nil;
        end;
    end;
    local v57 = not v56 or (v31 and v38) and not l_isPhoneVerified_0;
    if not (not v31 or v38) then
        v57 = false;
    end;
    local v58 = not v57 and 0.5 or 1;
    local v59 = not v57 and 0 or 48;
    local v60 = {};
    local v61 = {};
    v60 = l_Dash_0.filter(v35.matchedContacts, function(v62)
        if v62.contactName ~= nil then
            if v62.contactName:match("^%s*$") then
                return nil;
            else
                return (string.find(string.lower(v62.contactName or ""), string.lower(v51)));
            end;
        else
            return string.find(string.lower(v62.contactName or ""), string.lower(v51));
        end;
    end);
    v61 = l_Dash_0.filter(v35.deviceContacts, function(v63)
        if v63.contactName ~= nil then
            if v63.contactName:match("^%s*$") then
                return nil;
            else
                return (string.find(string.lower(v63.contactName or ""), string.lower(v51)));
            end;
        else
            return string.find(string.lower(v63.contactName or ""), string.lower(v51));
        end;
    end);
    local v64 = if not not v57 and #v61 > 0 then {
        {
            isSectionDivider = true
        }
    } else {};
    v48(v64, v60, v61);
    local v65 = #v60;
    local v66 = {};
    if v37 then
        if #v60 > 0 then
            table.insert(v66, {
                data = v60, 
                title = v42.fromContactsText, 
                sectionNumber = #v66 + 1
            });
        end;
        if #v61 > 0 then
            table.insert(v66, {
                data = v61, 
                title = v42.inviteToRobloxText, 
                sectionNumber = #v66 + 1
            });
        end;
    end;
    if not ((not (v31 and v65 > 0) or not v38) or l_isPhoneVerified_0) then
        v65 = v65 + 1;
    end;
    local function _()
        return #v35.matchedContacts + #v35.deviceContacts == 0;
    end;
    local function v71(v68)
        local l_item_0 = v68.item;
        local v70 = false;
        if v68.index ~= #v64 then
            v70 = v68.index ~= v65;
        end;
        if not l_item_0.isSectionDivider then
            if not l_item_0.isMatchedContact then
                return l_Roact_0.createElement(v16, {
                    contactName = l_item_0.contactName, 
                    deviceContactId = l_item_0.deviceContactId, 
                    hasDivider = not not v37 or v70, 
                    phoneNumber = l_item_0.phoneNumber, 
                    hasSentRequest = l_item_0.hasSentRequest
                });
            else
                return l_Roact_0.createElement(v15, {
                    contactName = l_item_0.contactName, 
                    contactId = l_item_0.contactId, 
                    contextualInfo = v42.fromContactsText, 
                    hasDivider = not not v37 or v70, 
                    hasSentRequest = l_item_0.hasSentRequest, 
                    requestFriendship = v35.requestFriendship, 
                    openProfilePeekView = v35.openProfilePeekView, 
                    headshotThumbnailUrl = if not v37 then nil else l_item_0.headshotThumbnailUrl, 
                    avatarThumbnailUrl = if not v37 then nil else l_item_0.avatarThumbnailUrl, 
                    showNewUI = if not v33 then nil else v37
                });
            end;
        else
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, (not not v31 and v68.index ~= 1) and 0.5 or v58, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v36.Theme.Divider.Color, 
                    BackgroundTransparency = v36.Theme.Divider.Transparency
                })
            });
        end;
    end;
    local function v73(v72)
        if not v72.section then
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                divider = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v36.Theme.Divider.Color, 
                    BackgroundTransparency = v36.Theme.Divider.Transparency
                })
            });
        else
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                padding = if not (v72.section.sectionNumber == 1) or v57 then l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }) else nil; 
                l_Roact_0.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1
                }, {
                    sectionHeaderTextLabel = l_Roact_0.createElement(l_StyledTextLabel_0, {
                        fontStyle = v36.Font.Header2, 
                        colorStyle = v36.Theme.TextDefault, 
                        text = v72.section.title or ""
                    })
                })
            });
        end;
    end;
    local function v75(v74)
        if not v35.isFetching then
            if not v35.showAddFriendsButton or not (#v35.matchedContacts + #v35.deviceContacts == 0) then
                if not v43 then
                    return {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v49, 
                                text = v74.closeModal
                            }
                        }
                    };
                else
                    return {};
                end;
            elseif not v43 then
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v35.onAddFriendsActivated, 
                            text = v74.goToAddFriends
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v49, 
                            text = v74.closeModal
                        }
                    }
                };
            else
                return {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v35.onAddFriendsActivated, 
                            text = v74.goToAddFriends
                        }
                    }
                };
            end;
        else
            return {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isLoading = true, 
                        onActivated = l_Dash_0.noop
                    }
                }
            };
        end;
    end;
    local l_Y_0 = l_UserInputService_0.StatusBarSize.Y;
    local v77 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        })
    };
    local v78 = l_React_0.createRef();
    local v80 = {
        layout = l_Roact_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        spacer1 = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        descriptionFrame = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 80), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            textLayout = l_Roact_0.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            descriptionText = l_Roact_0.createElement(l_StyledTextLabel_0, {
                text = v42.contactsListBlurb, 
                automaticSize = Enum.AutomaticSize.Y, 
                colorStyle = v36.Theme.TextDefault, 
                fontStyle = v36.Font.Body, 
                lineHeight = 1, 
                size = UDim2.new(1, 0, 0, 0), 
                maxSize = Vector2.new(0, 80), 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 1
            })
        }), 
        spacer2 = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        searchBarContainer = l_Roact_0.createElement(v23, {
            height = 36, 
            layoutOrder = 4, 
            textChangeCallback = function(v79)
                v52(v79);
                if not ((v37 or not v78) or not v78.current) then
                    v78.current:scrollToIndex({
                        index = 1
                    });
                end;
            end
        }), 
        spacer3 = if not v57 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 24), 
            BackgroundTransparency = 1, 
            LayoutOrder = 5
        }), 
        findFriendsBanner = if not v57 then nil else l_Roact_0.createElement(v22, {
            layoutOrder = 6, 
            showMatchedContacts = v35.showMatchedContacts, 
            openAmpUpsell = v35.openAmpUpsell, 
            isUserInGreenFindFriendsButtonExperiment = v44
        }), 
        spacer4 = if v57 then nil else l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 16), 
            BackgroundTransparency = 1, 
            LayoutOrder = 7
        }), 
        contactsList = if #v64 ~= 0 then l_Roact_0.createElement(if not v37 then l_FlatList_0 else l_SectionList_0, {
            ref = v78, 
            data = if not v37 then v64 else nil, 
            sections = if not v37 then nil else v66, 
            renderSectionHeader = if not not v37 and #v60 > 0 then v73 else nil, 
            renderItem = v71, 
            initialNumToRender = 15, 
            CanvasSize = UDim2.new(1, 0, 0, 73 * #v64), 
            contentContainerStyle = {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, 
            style = {
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                LayoutOrder = 8, 
                Size = UDim2.new(1, 0, 1, (((-80 - (not v43 and 48 or 0)) - 36) - 16) - v59), 
                ElasticBehavior = Enum.ElasticBehavior.Always
            }
        }) else l_Roact_0.createElement(v17, {
            errorTextKey = v14.NO_RESULTS, 
            layoutOrder = 8
        })
    };
    if not v35.isFetching then
        if not v35.hasUploadError or not (#v35.matchedContacts + #v35.deviceContacts == 0) then
            if not (#v35.matchedContacts + #v35.deviceContacts == 0) then
                v77 = v80;
            else
                v77.emptyList = l_Roact_0.createElement(v17);
            end;
        else
            v77.errorModal = l_Roact_0.createElement(v18);
        end;
    else
        for _, v82 in {
            1, 
            2, 
            3
        }, nil, nil do
            v77["glimmer" .. v82] = l_Roact_0.createElement(v19, {
                layoutOrder = v82
            });
        end;
    end;
    return l_Roact_0.createElement(l_FullPageModal_0, {
        title = v42.connectWithFriends, 
        screenSize = v35.screenSize, 
        marginSize = 0, 
        distanceFromTop = l_Y_0, 
        onCloseClicked = v50, 
        buttonStackProps = {
            buttons = v75(v42), 
            buttonHeight = not v43 and 48 or 0, 
            forcedFillDirection = Enum.FillDirection.Vertical
        }
    }, {
        hpm = l_Roact_0.createElement(l_HorizontalPageMargin_0, {
            size = UDim2.new(1, 0, 1, 0), 
            position = UDim2.new(0, 0, 0, 0), 
            backgroundTransparency = 1
        }, {
            contentFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, v77), 
            gradientFrame = l_Roact_0.createElement("Frame", {
                Position = UDim2.new(0, 0, 1, not v43 and -24 or 0), 
                Size = UDim2.new(1, 0, 0, 24), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                gradient = l_Roact_0.createElement("UIGradient", {
                    Rotation = 270, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v36.Theme.BackgroundUIDefault.Color), 
                        ColorSequenceKeypoint.new(1, v36.Theme.BackgroundUIDefault.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            })
        })
    });
end;
