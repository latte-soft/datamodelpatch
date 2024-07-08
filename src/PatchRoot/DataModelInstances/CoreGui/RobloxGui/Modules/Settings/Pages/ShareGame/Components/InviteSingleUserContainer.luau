local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v8 = require(l_Modules_0.Common.renderWithCoreScriptsStyleProvider);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local l_COLORS_0 = require(l_Modules_0.Common.Constants).COLORS;
local v11 = require(l_ShareGame_0.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local l_InviteStatus_0 = v11.InviteStatus;
local v14 = require(l_ShareGame_0.getTranslator)();
local v15 = require(l_Modules_0.Common.httpRequest);
local v16 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceId);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v18 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceIdCustomized);
local v19 = require(l_ShareGame_0.ThrottleFunctionCall);
local v20 = require(l_ShareGame_0.Components.SingleUserThumbnail);
local v21 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v22 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local v23 = require(l_Modules_0.Flags.GetFFlagInviteListStyleFixes);
local v24 = require(l_Modules_0.Flags.GetFFlagThrottleInviteSendEndpoint);
local v25 = require(l_Modules_0.Flags.GetFIntThrottleInviteSendEndpointDelay);
local v26 = require(l_Modules_0.Settings.Flags.GetFFlagSingleUserInvitePageKeybind);
local v27 = require(l_CorePackages_0.UIBlox);
local l_Button_0 = v27.App.Button.Button;
local l_ButtonType_0 = v27.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v27.App.Text.StyledTextLabel;
local l_useStyle_0 = v27.Core.Style.useStyle;
local v32 = Color3.fromRGB(41, 41, 41);
local function v56(v33)
    local v34 = v33.friends[tostring(v33.inviteUserId)];
    local v35 = v34 and v33.invites[v34.id];
    local v36 = l_useStyle_0();
    local v37, v38 = v5.useState(false);
    v5.useEffect(function()
        if not (not v33.promptMessage or not v33.analytics) then
            v33.analytics:sendEvent(v11.Triggers.DeveloperSingle, l_GameInviteEvents_0.CustomTextShown);
        end;
    end, {});
    local v39 = v5.useCallback(function()
        v33.closePage();
        if v33.onAfterClosePage then
            v33.onAfterClosePage();
        end;
    end, {
        v33.closePage, 
        v33.onAfterClosePage
    });
    local v40 = v5.useCallback(function()
        v33.analytics:sendEvent(v11.Triggers.DeveloperSingle, l_GameInviteEvents_0.CancelInvite);
        v39();
    end, {
        v39
    });
    local v46 = v5.useCallback(function()
        v38(true);
        local l_inviteUser_0 = v33.inviteUser;
        local l_analytics_0 = v33.analytics;
        if v35 and v35 ~= l_InviteStatus_0.Failed then
            return ;
        else
            local v43 = false;
            if v33.launchData ~= nil then
                v43 = v33.launchData ~= "";
            end;
            l_analytics_0:sendEvent(v11.Triggers.DeveloperSingle, l_GameInviteEvents_0.SendInvite, {
                recipient = v34.id, 
                isLaunchDataProvided = if not v21() then nil else v43
            });
            l_inviteUser_0(tostring(v34.id), l_analytics_0, v33.inviteMessageId, v33.launchData):andThen(function(v44)
                v38(false);
                if v44 then
                    local v45 = {
                        v34.id
                    };
                    if not (not l_Players_0.LocalPlayer or not v44.conversationId) then
                        l_analytics_0:onActivatedInviteSent(l_Players_0.LocalPlayer.UserId, v44.conversationId, v45);
                    end;
                    v39();
                    return ;
                else
                    return ;
                end;
            end, v39);
            return ;
        end;
    end, {
        v33.inviteUser, 
        v33.inviteMessageId, 
        v33.launchData, 
        v33.analytics, 
        v38, 
        v35, 
        v34, 
        v39
    });
    if v26() then
        v5.useEffect(function()
            if not v33.isVisible then
                return nil;
            else
                l_ContextActionService_0:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, v48, _)
                    if v48 == Enum.UserInputState.Begin then
                        v46();
                    end;
                end, false, Enum.KeyCode.ButtonA);
                l_ContextActionService_0:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, v51, _)
                    if v51 == Enum.UserInputState.Begin then
                        v40();
                    end;
                end, false, Enum.KeyCode.ButtonB);
                return function()
                    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseConfirmButtonBind");
                    l_ContextActionService_0:UnbindCoreAction("ProductPurchaseCancelButtonBind");
                end;
            end;
        end, {
            v33.isVisible, 
            v46, 
            v40
        });
    end;
    if v24() then
        v46 = v5.useCallback(v19(v25(), v46), {
            v46
        });
    end;
    if v34 then
        local v53 = v35 and v35 ~= l_InviteStatus_0.Failed;
        local v54 = not v53 and "Feature.SettingsHub.Action.InviteFriend" or "Feature.SettingsHub.Label.Invited";
        local v55 = v23();
        return v5.createElement("Frame", {
            Size = if not v55 then UDim2.new(0, 442, 0, 0) else UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0, 
            BackgroundColor3 = if not v55 then l_COLORS_0.FLINT else v32, 
            BackgroundTransparency = not v55 and 0 or 0.1
        }, {
            SizeConstraint = if not v55 then nil else v5.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(442, math.huge), 
                MinSize = Vector2.new(0, 0)
            }), 
            Corner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            Padding = v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            Header = v5.createElement(l_StyledTextLabel_0, {
                fontStyle = v36.Font.Header1, 
                colorStyle = v36.Theme.TextEmphasis, 
                text = v14:FormatByKey("Feature.SettingsHub.Heading.InviteUser", {
                    DisplayName = v34.displayName
                }), 
                size = UDim2.new(1, 0, 0, 48), 
                textXAlignment = Enum.TextXAlignment.Center
            }), 
            Divider = v5.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 48), 
                Size = UDim2.new(1, 0, 0, 1), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_COLORS_0.GRAPHITE
            }), 
            Wrapper = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, 0, 0, 56), 
                BackgroundTransparency = 1
            }, {
                ListLayout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 24)
                }), 
                Thumbnail = v5.createElement(v20, {
                    user = v34, 
                    size = UDim2.new(0, 95, 0, 95), 
                    layoutOrder = 1, 
                    square = true, 
                    backgroundTransparency = if not v55 then nil else 1
                }), 
                TextBody = v5.createElement(l_StyledTextLabel_0, {
                    fontStyle = v36.Font.Header2, 
                    colorStyle = v36.Theme.TextEmphasis, 
                    text = v33.promptMessage or v14:FormatByKey("Feature.SettingsHub.Label.DefaultInviteMessage", {
                        DisplayName = v34.displayName
                    }), 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    automaticSize = Enum.AutomaticSize.Y, 
                    size = UDim2.new(1, 0, 0, 0), 
                    layoutOrder = 2
                }), 
                ButtonWrapper = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 48), 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1
                }, {
                    CancelButton = v5.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.Secondary, 
                        size = UDim2.new(0.5, -12, 1, 0), 
                        text = v14:FormatByKey("Feature.SettingsHub.Action.Cancel"), 
                        onActivated = v40, 
                        isDisabled = v37
                    }), 
                    InviteButton = v5.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(0.5, -12, 1, 0), 
                        position = UDim2.new(0.5, 12, 0, 0), 
                        text = v14:FormatByKey(v54), 
                        onActivated = v46, 
                        isLoading = v37, 
                        isDisabled = v53
                    })
                })
            })
        });
    else
        if not (v33.friendsRetrievalStatus ~= l_RetrievalStatus_0.Done) or v33.friendsRetrievalStatus == l_RetrievalStatus_0.Failed then
            v39();
        end;
        return ;
    end;
end;
return v6.connect(function(v57)
    return {
        friends = v57.Users, 
        friendsRetrievalStatus = l_Players_0.LocalPlayer and v57.Friends.retrievalStatus[tostring(l_Players_0.LocalPlayer.UserId)], 
        invites = v57.Invites
    };
end, function(v58)
    return {
        inviteUser = function(v59, v60, v61, v62)
            local v63 = v15(l_HttpRbxApiService_0);
            local v64 = tostring(game.PlaceId);
            if not v22() then
                return v58(v16(v63, v59, v64));
            else
                return v58(v18(v63, v59, v64, v60, v11.Triggers.DeveloperSingle, v61, v62));
            end;
        end
    };
end)(function(v65)
    return v8({
        SingleUserInvite = v5.createElement(v56, v65)
    });
end);
