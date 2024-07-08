local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.React);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v8 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v11 = require(l_ContactList_0.dependencies);
local l_useDispatch_0 = v11.Hooks.useDispatch;
local l_UIBlox_0 = v11.UIBlox;
local l_dependencyArray_0 = v11.Hooks.dependencyArray;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v11.getStandardSizeAvatarHeadShotRbxthumb;
local v16 = nil;
local v17 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v17 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v16 = v11.Hooks.useLocalization;
end;
local l_useSelector_0 = v11.Hooks.useSelector;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v23 = require(l_ContactList_0.Enums.CallState);
local v24 = Random.new();
local v25 = require(l_ContactList_0.Actions.OpenOrUpdateCFM);
local v26 = require(l_ContactList_0.Analytics.useAnalytics);
local v27 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v28 = require(l_ContactList_0.Enums.Pages);
local v29 = require(l_ContactList_0.Hooks.useStartCallCallback);
local v30 = Vector2.new(24, 12);
local function _(v31, v32)
    local v33 = false;
    if v31.callerId ~= v32 then
        v33 = v31.status ~= v23.Finished;
    end;
    return v33;
end;
local function _(v35, v36)
    local v37 = false;
    if v35.callerId ~= v36 then
        v37 = v35.status ~= v23.Finished;
    end;
    if not v37 then
        if v35.callerId == v36 then
            return "Feature.Call.Label.Outgoing";
        else
            return "Feature.Call.Label.Incoming";
        end;
    else
        return "Feature.Call.Label.Missed";
    end;
end;
local function _(v39, v40)
    local v41 = false;
    if v39.callerId ~= v40 then
        v41 = v39.status ~= v23.Finished;
    end;
    if not v41 then
        if v39.callerId == v40 then
            return "rbxassetid://15239341275";
        else
            return "rbxassetid://15239341959";
        end;
    else
        return "rbxassetid://15239344406";
    end;
end;
local function v53(v43, v44, v45)
    local v46 = tonumber(v43:FormatLocalTime("YYYY", v45));
    local v47 = tonumber(v44:FormatLocalTime("YYYY", v45));
    local v48 = tonumber(v43:FormatLocalTime("DDD", v45));
    local v49 = tonumber(v44:FormatLocalTime("DDD", v45));
    local v50 = 0;
    for v51 = v47, v46 - 1 do
        local v52 = 365;
        if v51 % 4 == 0 and (not (v51 % 100 == 0) or v51 % 400 == 0) then
            v52 = 366;
        end;
        v50 = v50 + v52;
    end;
    return (v50 + v48) - v49;
end;
local function v60(v54, v55)
    local v56 = DateTime.now();
    local v57 = DateTime.fromUnixTimestampMillis(v54);
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v59 = v53(v56, v57, l_RobloxLocaleId_0);
    if v59 == 0 then
        return v57:FormatLocalTime("LT", l_RobloxLocaleId_0);
    elseif v59 == 1 then
        return v55;
    elseif v59 < 7 then
        return v57:FormatLocalTime("dddd", l_RobloxLocaleId_0);
    else
        return v57:FormatLocalTime("L", l_RobloxLocaleId_0);
    end;
end;
return function(v61)
    local l_callRecord_0 = v61.callRecord;
    local l_localUserId_0 = v61.localUserId;
    assert(#l_callRecord_0.participants == 2, "Expect a local user and single other participant in call.");
    local l_userId_0 = l_callRecord_0.participants[1].userId;
    if l_userId_0 == l_localUserId_0 then
        l_userId_0 = l_callRecord_0.participants[2].userId;
    end;
    local v65 = "";
    local v66 = "";
    local v67 = nil;
    local v68 = v8.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(l_userId_0))
        }, 
        query = v8.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    if v68.data then
        v65 = v8.Selectors.getCombinedNameFromId(v68.data, l_userId_0);
        v66 = v8.Selectors.getUsernameFromId(v68.data, l_userId_0);
        v67 = {
            userId = l_userId_0, 
            userName = v66, 
            combinedName = v65
        };
        v66 = v8.Formatters.formatUsername(v66);
    end;
    local v69 = nil;
    local v70 = nil;
    if not l_GetFFlagIrisUseLocalizationProvider_0() then
        local l_v17_0 = v17;
        local v72 = false;
        if l_callRecord_0.callerId ~= l_localUserId_0 then
            v72 = l_callRecord_0.status ~= v23.Finished;
        end;
        v69 = l_v17_0:FormatByKey(if not v72 then l_callRecord_0.callerId == l_localUserId_0 and "Feature.Call.Label.Outgoing" or "Feature.Call.Label.Incoming" else "Feature.Call.Label.Missed");
        v70 = v17:FormatByKey("Feature.Call.Label.Yesterday");
    else
        local l_v16_0 = v16;
        local v74 = {};
        local v75 = false;
        if l_callRecord_0.callerId ~= l_localUserId_0 then
            v75 = l_callRecord_0.status ~= v23.Finished;
        end;
        v74.callStatusLabel = if not v75 then l_callRecord_0.callerId == l_localUserId_0 and "Feature.Call.Label.Outgoing" or "Feature.Call.Label.Incoming" else "Feature.Call.Label.Missed";
        v74.yesterdayLabel = "Feature.Call.Label.Yesterday";
        l_v16_0 = l_v16_0(v74);
        v69 = l_v16_0.callStatusLabel;
        v70 = l_v16_0.yesterdayLabel;
    end;
    local v76 = v26();
    local v77 = l_useStyle_0();
    local l_Theme_0 = v77.Theme;
    local l_Font_0 = v77.Font;
    local v80 = l_useDispatch_0();
    local v81, v82 = v4.useState("BackgroundDefault");
    local v85 = v4.useCallback(function(_, v84)
        if v84 == l_ControlState_0.Pressed then
            v82("BackgroundOnPress");
            return ;
        elseif v84 == l_ControlState_0.Hover then
            v82("BackgroundOnHover");
            return ;
        else
            v82("BackgroundDefault");
            return ;
        end;
    end, {});
    local v88 = v29(l_useSelector_0((v4.useCallback(function(v86)
        return v86.Navigation.currentTag;
    end, {}))), l_userId_0, v65, v61.dismissCallback, {
        searchQueryString = "", 
        itemListIndex = v61.layoutOrder, 
        isSuggestedUser = false, 
        page = l_useSelector_0((v4.useCallback(function(v87)
            return v87.Navigation.currentPage;
        end, {})))
    });
    local v91 = v4.useCallback(function(_, v90)
        if v90 and v90.UserInputType == Enum.UserInputType.MouseMovement then
            l_SoundManager_0:PlaySound(l_Sounds_0.Hover.Name, {
                Volume = 0.5 + v24:NextNumber(-0.25, 0.25), 
                PlaybackSpeed = 1 + v24:NextNumber(-0.5, 0.5)
            }, l_SoundGroups_0.Iris);
        end;
    end, {});
    local v92 = v4.useCallback(function()
        v76.fireEvent(v27.PhoneBookPlayerMenuOpened, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = l_userId_0, 
            searchQueryString = nil, 
            itemListIndex = v61.layoutOrder, 
            isSuggestedUser = false, 
            page = v28.CallHistory
        });
        v80(v25(v67));
    end, l_dependencyArray_0(l_userId_0, v61.layoutOrder));
    local v93 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(l_userId_0)));
    local v94 = false;
    if l_callRecord_0.callerId ~= l_localUserId_0 then
        v94 = l_callRecord_0.status ~= v23.Finished;
    end;
    local l_createElement_0 = v4.createElement;
    local l_l_Interactable_0_0 = l_Interactable_0;
    local v97 = {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, 68 + v30.Y * 2), 
        BackgroundColor3 = l_Theme_0[v81].Color, 
        BackgroundTransparency = l_Theme_0[v81].Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v61.layoutOrder, 
        onStateChanged = v85, 
        AutoButtonColor = false, 
        [v4.Event.Activated] = v88, 
        [v4.Event.InputBegan] = v91
    };
    local v98 = {
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v30.X), 
            PaddingTop = UDim.new(0, v30.Y)
        }), 
        ProfileImage = v4.createElement("ImageButton", {
            Size = UDim2.fromOffset(68, 68), 
            Image = v93, 
            [v4.Event.MouseButton2Up] = v92, 
            [v4.Event.TouchTap] = v92, 
            AutoButtonColor = false
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    };
    local l_createElement_1 = v4.createElement;
    local v100 = "Frame";
    local v101 = {
        Position = UDim2.new(0, 80, 0, 0), 
        Size = UDim2.new(1, -(104 + v30.X), 1, -v30.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    };
    local v102 = {
        NameContent = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            DisplayName = v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Header2.Font, 
                LayoutOrder = 1, 
                Text = v65, 
                TextColor3 = if not v94 then l_Theme_0.TextEmphasis.Color else l_Theme_0.Alert.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                TextTransparency = if not v94 then l_Theme_0.TextEmphasis.Transparency else l_Theme_0.Alert.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Username = v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.CaptionBody.Font, 
                LayoutOrder = 2, 
                Text = v66, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    };
    local l_createElement_2 = v4.createElement;
    local v104 = "Frame";
    local v105 = {
        Position = UDim2.new(0, 0, 1, -16), 
        Size = UDim2.new(1, 0, 0, 16), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2
    };
    local v106 = {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 4)
        })
    };
    local l_createElement_3 = v4.createElement;
    local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
    local v109 = {
        Size = UDim2.fromOffset(16, 16), 
        BackgroundTransparency = 1, 
        ImageColor3 = l_Theme_0.TextDefault.Color, 
        ImageTransparency = l_Theme_0.TextDefault.Transparency
    };
    local v110 = false;
    if l_callRecord_0.callerId ~= l_localUserId_0 then
        v110 = l_callRecord_0.status ~= v23.Finished;
    end;
    v109.Image = if not v110 then l_callRecord_0.callerId == l_localUserId_0 and "rbxassetid://15239341275" or "rbxassetid://15239341959" else "rbxassetid://15239344406";
    v106.CallContextImage = l_createElement_3(l_l_ImageSetLabel_0_0, v109);
    v106.DetailsText = v4.createElement("TextLabel", {
        Size = UDim2.fromOffset(0, 14), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Font = l_Font_0.CaptionBody.Font, 
        Text = v69 .. " \226\128\162 " .. v60(l_callRecord_0.endUtc, v70), 
        TextColor3 = l_Theme_0.TextDefault.Color, 
        TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
        TextTransparency = l_Theme_0.TextDefault.Transparency, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextYAlignment = Enum.TextYAlignment.Center
    });
    v102.Details = l_createElement_2(v104, v105, v106);
    v98.Content = l_createElement_1(v100, v101, v102);
    v98.CallIcon = if not game:GetEngineFeature("EnableSocialServiceIrisInvite") then nil else v4.createElement(l_ImageSetLabel_0, {
        Position = UDim2.new(1, -v30.X - 4, 0.5, -v30.Y / 2), 
        Size = UDim2.fromOffset(24, 24), 
        AnchorPoint = Vector2.new(1, 0.5), 
        BackgroundTransparency = 1, 
        Image = "rbxassetid://15239343417", 
        ImageColor3 = l_Theme_0.ContextualPrimaryDefault.Color, 
        ImageTransparency = l_Theme_0.ContextualPrimaryDefault.Transparency
    });
    v98.Divider = not not v61.showDivider and v4.createElement("Frame", {
        Position = UDim2.new(0, 0, 1, -1), 
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundColor3 = l_Theme_0.Divider.Color, 
        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
        BorderSizePixel = 0
    }) or nil;
    return l_createElement_0(l_l_Interactable_0_0, v97, v98);
end;
