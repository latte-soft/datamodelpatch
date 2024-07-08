local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v7 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v10 = require(l_ContactList_0.dependencies);
local l_dependencyArray_0 = v10.Hooks.dependencyArray;
local l_useDispatch_0 = v10.Hooks.useDispatch;
local l_useSelector_0 = v10.Hooks.useSelector;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v10.getStandardSizeAvatarHeadShotRbxthumb;
local l_GetPresencesFromUserIds_0 = v10.NetworkingPresence.GetPresencesFromUserIds;
local v16 = nil;
local v17 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v17 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v16 = v10.Hooks.useLocalization;
end;
local l_PresenceType_0 = v10.RoduxPresence.Enums.PresenceType;
local l_UIBlox_0 = v10.UIBlox;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_PlayerContext_0 = l_UIBlox_0.App.Indicator.PlayerContext;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v26 = require(l_ContactList_0.Actions.OpenOrUpdateCFM);
local v27 = require(l_ContactList_0.Analytics.useAnalytics);
local v28 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v29 = require(l_ContactList_0.Hooks.useStartCallCallback);
local v30 = require(l_ContactList_0.Enums.Pages);
local v31 = Random.new();
local v32 = Vector2.new(24, 12);
return function(v33)
    local v34 = v27();
    local v35 = l_useStyle_0();
    local l_Theme_0 = v35.Theme;
    local l_Font_0 = v35.Font;
    local v38 = l_useDispatch_0();
    local v39 = {
        userId = v33.userId, 
        userName = v33.userName, 
        combinedName = v33.combinedName
    };
    local v40 = nil;
    if l_GetFFlagIrisUseLocalizationProvider_0() then
        v40 = v16({
            offlineStatusLabel = "InGame.Presence.Label.Offline", 
            onlineStatusLabel = "InGame.Presence.Label.Online", 
            studioStatusLabel = "InGame.Presence.Label.RobloxStudio"
        });
    end;
    v3.useEffect(function()
        if v33.userPresenceType == nil then
            v38(l_GetPresencesFromUserIds_0.API({
                v33.userId
            }));
        end;
    end, l_dependencyArray_0(v33.userId, v33.userPresenceType));
    local v42 = l_useSelector_0((v3.useCallback(function(v41)
        return v41.Presence.byUserId[tostring(v33.userId)];
    end, {
        v33.userId
    })));
    local v44 = l_useSelector_0((v3.useCallback(function(v43)
        return v43.Navigation.currentTag;
    end, {})));
    local v46 = l_useSelector_0((v3.useCallback(function(v45)
        return v45.Navigation.currentPage;
    end, {})));
    local v47, v48 = v3.useState("BackgroundDefault");
    local v51 = v3.useCallback(function(_, v50)
        if v50 == l_ControlState_0.Pressed then
            v48("BackgroundOnPress");
            return ;
        elseif v50 == l_ControlState_0.Hover then
            v48("BackgroundOnHover");
            return ;
        else
            v48("BackgroundDefault");
            return ;
        end;
    end, {});
    local v52 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v33.userId)));
    local v53 = v29(v44, v33.userId, v33.combinedName, v33.dismissCallback, {
        searchQueryString = v33.searchQueryString, 
        itemListIndex = v33.itemListIndex, 
        isSuggestedUser = v33.isSuggestedUser, 
        page = v46
    });
    local v62 = v3.useMemo(function()
        local v54 = l_Images_0["component_assets/circle_26_stroke_3"];
        local l_Color_0 = v35.Theme.OfflineStatus.Color;
        local l_Transparency_0 = v35.Theme.OfflineStatus.Transparency;
        local v57 = 12;
        local v58 = if not l_GetFFlagIrisUseLocalizationProvider_0() then v17:FormatByKey("InGame.Presence.Label.Offline") else v40.offlineStatusLabel;
        local l_TextMuted_0 = v35.Theme.TextMuted;
        local v60 = nil;
        local v61 = nil;
        if not v42 then
            v60 = if not v33.userPresenceType then l_PresenceType_0.Offline else l_PresenceType_0[v33.userPresenceType];
            v61 = v33.lastLocation or "";
        else
            v60 = v42.userPresenceType;
            v61 = v42.lastLocation;
        end;
        if v60 == l_PresenceType_0.Online then
            v54 = l_Images_0["component_assets/circle_16"];
            l_Color_0 = v35.Theme.OnlineStatus.Color;
            l_Transparency_0 = v35.Theme.OnlineStatus.Transparency;
            v58 = if not l_GetFFlagIrisUseLocalizationProvider_0() then v17:FormatByKey("InGame.Presence.Label.Online") else v40.onlineStatusLabel;
            l_TextMuted_0 = v35.Theme.TextMuted;
            v57 = 12;
        elseif v60 == l_PresenceType_0.InGame then
            v54 = l_Images_0["icons/menu/games_small"];
            l_Color_0 = v35.Theme.IconEmphasis.Color;
            l_Transparency_0 = v35.Theme.IconEmphasis.Transparency;
            v58 = v61;
            l_TextMuted_0 = l_Theme_0.TextEmphasis;
            v57 = 16;
        elseif v60 == l_PresenceType_0.InStudio then
            v54 = l_Images_0["icons/logo/studiologo_small"];
            l_Color_0 = v35.Theme.TextDefault.Color;
            l_Transparency_0 = v35.Theme.TextDefault.Transparency;
            v58 = if not l_GetFFlagIrisUseLocalizationProvider_0() then v17:FormatByKey("InGame.Presence.Label.RobloxStudio") else v40.studioStatusLabel;
            l_TextMuted_0 = v35.Theme.TextMuted;
            v57 = 16;
        end;
        return v3.createElement(l_PlayerContext_0, {
            fontStyle = v35.Font.CaptionBody, 
            icon = v54, 
            iconColor = l_Color_0, 
            iconSize = UDim2.fromOffset(v57, v57), 
            iconTransparency = l_Transparency_0, 
            layoutOrder = 2, 
            onActivated = v53, 
            text = v58, 
            textColorStyle = l_TextMuted_0, 
            textHeight = 24
        });
    end, {
        v42, 
        v35
    });
    local v65 = v3.useCallback(function(_, v64)
        if v64 and v64.UserInputType == Enum.UserInputType.MouseMovement then
            l_SoundManager_0:PlaySound(l_Sounds_0.Hover.Name, {
                Volume = 0.5 + v31:NextNumber(-0.25, 0.25), 
                PlaybackSpeed = 1 + v31:NextNumber(-0.5, 0.5)
            }, l_SoundGroups_0.Iris);
        end;
    end, {});
    local v66 = v3.useCallback(function()
        v34.fireEvent(v28.PhoneBookPlayerMenuOpened, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = v39.userId, 
            searchQueryString = v33.searchQueryString, 
            itemListIndex = v33.itemListIndex, 
            isSuggestedUser = v33.isSuggestedUser, 
            page = v30.FriendList
        });
        v38(v26(v39));
    end, l_dependencyArray_0(v39.userId, v33.searchQueryString, v33.itemListIndex, v33.isSuggestedUser));
    return v3.createElement(l_Interactable_0, {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, 68 + v32.Y * 2), 
        BackgroundColor3 = l_Theme_0[v47].Color, 
        BackgroundTransparency = l_Theme_0[v47].Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v33.layoutOrder, 
        onStateChanged = v51, 
        AutoButtonColor = false, 
        [v3.Event.Activated] = v53, 
        [v3.Event.InputBegan] = v65
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v32.X), 
            PaddingTop = UDim.new(0, v32.Y)
        }), 
        ProfileImage = v3.createElement("ImageButton", {
            Size = UDim2.fromOffset(68, 68), 
            Image = v52, 
            [v3.Event.MouseButton2Up] = v66, 
            [v3.Event.TouchTap] = v66, 
            AutoButtonColor = false
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        Content = v3.createElement("Frame", {
            Position = UDim2.new(0, 80, 0, 0), 
            Size = UDim2.new(1, -(116 + v32.X), 1, -v32.Y), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            NameContent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 4), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 6)
                }), 
                CombinedName = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 20), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = l_Font_0.Header2.Font, 
                    LayoutOrder = 1, 
                    Text = v33.combinedName, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Username = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 14), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = l_Font_0.CaptionBody.Font, 
                    LayoutOrder = 2, 
                    Text = v7.Formatters.formatUsername(v33.userName), 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            PlayerContext = v62
        }), 
        CallIcon = if not game:GetEngineFeature("EnableSocialServiceIrisInvite") then nil else v3.createElement(l_ImageSetLabel_0, {
            Position = UDim2.new(1, -v32.X - 4, 0.5, -v32.Y / 2), 
            Size = UDim2.fromOffset(24, 24), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Image = "rbxassetid://15239343417", 
            ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
            ImageTransparency = l_Theme_0.ContextualPrimaryDefault.Transparency
        }), 
        Divider = not not v33.showDivider and v3.createElement("Frame", {
            Position = UDim2.new(0, 0, 1, -1), 
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BorderSizePixel = 0
        }) or nil
    });
end;
