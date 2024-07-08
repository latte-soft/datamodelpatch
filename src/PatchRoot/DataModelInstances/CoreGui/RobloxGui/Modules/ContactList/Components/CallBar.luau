local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v8 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v12 = require(l_ContactList_0.dependencies);
local v13 = require(l_ContactList_0.Analytics.useAnalytics);
local v14 = require(l_ContactList_0.Analytics.EventNamesEnum);
local l_UIBlox_0 = v12.UIBlox;
local l_RoduxCall_0 = v12.RoduxCall;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v12.getStandardSizeAvatarHeadShotRbxthumb;
local l_teleportToRootPlace_0 = v12.teleportToRootPlace;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useSelector_0 = v12.Hooks.useSelector;
local v23 = nil;
local v24 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v24 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v23 = v12.Hooks.useLocalization;
end;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v28 = not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
local v29 = {
    callProtocol = v4.CallProtocol.default
};
local function v38(v30)
    local v31 = math.floor(v30 / 3600);
    local v32 = math.floor((v30 % 3600) / 60);
    local v33 = v30 % 60;
    local v34 = string.format("%02d", v31);
    local v35 = string.format("%02d", v32);
    local v36 = string.format("%02d", v33);
    local _ = "";
    if v31 > 0 then
        return v34 .. ":" .. v35 .. ":" .. v36;
    else
        return v35 .. ":" .. v36;
    end;
end;
local function v41(v39, _)
    if v39 == l_RoduxCall_0.Enums.Status.Connecting then
        return "Feature.Call.Label.Calling";
    elseif v39 == l_RoduxCall_0.Enums.Status.Teleporting then
        return "Feature.Call.Label.Teleporting";
    elseif v39 == l_RoduxCall_0.Enums.Status.Active then
        return "Feature.Call.Label.RobloxCall";
    elseif v39 == l_RoduxCall_0.Enums.Status.Idle then
        return "Feature.Call.Label.CallEnded";
    else
        error("Invalid status for call bar: " .. v39 .. ".");
        return ;
    end;
end;
return function(v42)
    local v43 = v3.Dictionary.join(v29, v42);
    local v44 = l_useStyle_0();
    local v45 = v13();
    local l_Theme_0 = v44.Theme;
    local l_Font_0 = v44.Font;
    local v48, v49 = v2.useState("00:00");
    local v51 = l_useSelector_0((v2.useCallback(function(v50)
        if not v50.Call.currentCall then
            return "";
        else
            return v50.Call.currentCall.callId;
        end;
    end)));
    local v53 = l_useSelector_0((v2.useCallback(function(v52)
        if not v52.Call.currentCall then
            return "";
        else
            return v52.Call.currentCall.callerId;
        end;
    end)));
    local v55 = l_useSelector_0((v2.useCallback(function(v54)
        if not v54.Call.currentCall then
            return "";
        else
            return v54.Call.currentCall.calleeId;
        end;
    end)));
    local v57 = l_useSelector_0((v2.useCallback(function(v56)
        if not v56.Call.currentCall then
            return "";
        else
            return v56.Call.currentCall.status;
        end;
    end)));
    local v59 = l_useSelector_0((v2.useCallback(function(v58)
        if v58.Call.currentCall ~= nil then
            return v58.Call.currentCall.instanceId;
        else
            return "";
        end;
    end)));
    local v62 = l_useSelector_0((v2.useCallback(function(v60)
        local l_currentCall_0 = v60.Call.currentCall;
        if not l_currentCall_0 then
            return nil;
        elseif v28 == l_currentCall_0.callerId then
            return l_currentCall_0.calleeId;
        else
            return l_currentCall_0.callerId;
        end;
    end)));
    local v63 = nil;
    if v62 then
        v63 = l_getStandardSizeAvatarHeadShotRbxthumb_0(v62);
    end;
    local v64 = nil;
    if not l_GetFFlagIrisUseLocalizationProvider_0() then
        v64 = v24:FormatByKey(v41(v57, v59));
    else
        local l_v23_0 = v23;
        local v66 = {};
        local v67;
        if v57 == l_RoduxCall_0.Enums.Status.Connecting then
            v67 = "Feature.Call.Label.Calling";
        elseif v57 == l_RoduxCall_0.Enums.Status.Teleporting then
            v67 = "Feature.Call.Label.Teleporting";
        elseif v57 == l_RoduxCall_0.Enums.Status.Active then
            v67 = "Feature.Call.Label.RobloxCall";
        elseif v57 == l_RoduxCall_0.Enums.Status.Idle then
            v67 = "Feature.Call.Label.CallEnded";
        else
            error("Invalid status for call bar: " .. v57 .. ".");
            v67 = nil;
        end;
        v66.callStatusLabel = v67;
        v64 = l_v23_0(v66).callStatusLabel;
    end;
    local v68 = false;
    if v57 == l_RoduxCall_0.Enums.Status.Idle then
        v68 = game.JobId == v59;
    end;
    local v69 = true;
    if v57 ~= l_RoduxCall_0.Enums.Status.Active then
        v69 = true;
        if v57 ~= l_RoduxCall_0.Enums.Status.Connecting then
            v69 = v68;
        end;
    end;
    local v71 = v2.useCallback(function()
        local v70 = false;
        if not v68 then
            if v57 == l_RoduxCall_0.Enums.Status.Active then
                l_SoundManager_0:PlaySound(l_Sounds_0.HangUp.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
                v43.callProtocol:finishCall(v51);
            elseif v57 == l_RoduxCall_0.Enums.Status.Connecting then
                v43.callProtocol:cancelCall(v51);
            end;
        else
            l_teleportToRootPlace_0();
            v70 = true;
        end;
        v45.fireEvent(v14.CallBarHangUpClicked, {
            eventTimestampMs = os.time() * 1000, 
            callerUserId = v53, 
            calleeUserId = v55, 
            callId = v51, 
            callStatus = v57, 
            isRetry = v70
        });
    end, {
        v57, 
        v43.callProtocol, 
        v68
    });
    local v72 = if not v68 then v44.Theme.Alert else v44.Theme.SystemPrimaryDefault;
    local v73 = not v68 and "rbxassetid://15239778319" or "rbxassetid://15123605982";
    local v74 = if not v68 then l_Colors_0.White else l_Colors_0.Slate;
    v2.useEffect(function()
        local v75 = l_RunService_0.Heartbeat:Connect(function()
            if v43.activeUtc == 0 then
                return ;
            else
                v49((v38((math.max(0, os.time() - v43.activeUtc / 1000)))));
                return ;
            end;
        end);
        return function()
            v75:Disconnect();
        end;
    end, {
        v43.activeUtc
    });
    local v76 = v8.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v62))
        }, 
        query = v8.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v79 = l_useSelector_0((v2.useCallback(function(v77)
        local l_currentCall_1 = v77.Call.currentCall;
        if not l_currentCall_1 then
            return "";
        elseif v28 == l_currentCall_1.callerId then
            return l_currentCall_1.calleeCombinedName or "";
        else
            return l_currentCall_1.callerCombinedName or "";
        end;
    end)));
    local v80 = "";
    if not v76.data then
        if v76.error then
            v80 = v79;
        end;
    else
        v80 = v8.Selectors.getCombinedNameFromId(v76.data, v62);
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(v43.size.X, v43.size.Y), 
        Position = v43.position, 
        AnchorPoint = Vector2.new(0, 0), 
        BackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
        BorderSizePixel = 0
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 4), 
            PaddingTop = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 4), 
            PaddingBottom = UDim.new(0, 4)
        }), 
        ProfileImage = v2.createElement(l_ImageSetLabel_0, {
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromOffset(36, 36), 
            Image = v63, 
            LayoutOrder = 1
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        Content = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -88, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            DisplayName = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 22), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.CaptionHeader.Font, 
                LayoutOrder = 1, 
                Text = v80, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            DetailsText = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = l_Font_0.Footer.Font, 
                LayoutOrder = 2, 
                Text = if v57 == l_RoduxCall_0.Enums.Status.Active then v48 else v64, 
                TextColor3 = l_Colors_0.White, 
                TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                TextTransparency = 0.4, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        ActionButton = if v57 ~= l_RoduxCall_0.Enums.Status.Failed then v2.createElement("ImageButton", {
            Position = UDim2.fromOffset(0, 0), 
            Active = v69, 
            AnchorPoint = Vector2.new(1, 1), 
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(36, 36), 
            BackgroundTransparency = v72.Transparency, 
            BackgroundColor3 = v72.Color, 
            BorderSizePixel = 0, 
            Image = v73, 
            ImageColor3 = v74, 
            [v2.Event.Activated] = v71
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 36)
            })
        }) else nil
    });
end;
