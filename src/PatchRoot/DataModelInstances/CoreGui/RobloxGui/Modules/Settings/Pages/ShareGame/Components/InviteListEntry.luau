local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v6 = require(l_Modules_0.Common.Constants);
local v7 = require(l_Modules_0.Settings.Theme);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local v10 = require(l_ShareGame_0.Constants);
local v11 = require(l_ShareGame_0.PresenceUtil);
local v12 = require(l_ShareGame_0.Components.SingleUserThumbnail);
local v13 = require(l_ShareGame_0.Components.InviteButton);
local l_InviteStatus_0 = v10.InviteStatus;
local v15 = require(l_ShareGame_0.ThrottleFunctionCall);
local v16 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v17 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local v18 = require(l_Modules_0.Flags.GetFFlagThrottleInviteSendEndpoint);
local v19 = require(l_Modules_0.Flags.GetFIntThrottleInviteSendEndpointDelay);
local v20 = Rect.new(10, 10, 10, 10);
return function(v21)
    local l_user_0 = v21.user;
    local v30 = v2.useCallback(function()
        local l_inviteUser_0 = v21.inviteUser;
        local l_inviteStatus_0 = v21.inviteStatus;
        local l_analytics_0 = v21.analytics;
        if l_inviteStatus_0 and l_inviteStatus_0 ~= l_InviteStatus_0.Failed then
            return ;
        else
            local function v28(v26)
                if v26 then
                    local v27 = {
                        l_user_0.id
                    };
                    if not (not l_Players_0.LocalPlayer or not v26) then
                        l_analytics_0:onActivatedInviteSent(l_Players_0.LocalPlayer.UserId, v26.conversationId, v27);
                    end;
                    return ;
                else
                    return ;
                end;
            end;
            if not v17() then
                l_inviteUser_0(l_user_0.id):andThen(v28, function()
                end);
                return ;
            else
                local v29 = false;
                if v21.launchData ~= nil then
                    v29 = v21.launchData ~= "";
                end;
                l_analytics_0:sendEvent(v21.trigger, l_GameInviteEvents_0.SendInvite, {
                    recipient = l_user_0.id, 
                    isLaunchDataProvided = if not v16() then nil else v29
                });
                l_inviteUser_0(l_user_0.id, l_analytics_0, v21.trigger, v21.inviteMessageId, v21.launchData):andThen(v28, function()
                end);
                return ;
            end;
        end;
    end, {
        v21.inviteUser, 
        v21.inviteStatus, 
        v21.analytics, 
        l_user_0
    });
    if v18() then
        v30 = v2.useCallback(v15(v19(), v30), {
            v30
        });
    end;
    if v21.visible then
        local l_UIBloxThemeEnabled_0 = v7.UIBloxThemeEnabled;
        return v2.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, 60), 
            Image = if l_UIBloxThemeEnabled_0 then nil else "rbxasset://textures/ui/dialog_white.png", 
            ScaleType = not l_UIBloxThemeEnabled_0 and Enum.ScaleType.Slice or Enum.ScaleType.Stretch, 
            SliceCenter = v20, 
            BackgroundColor3 = v7.color("PlayerRowFrame"), 
            BackgroundTransparency = v7.transparency("PlayerRowFrame", 1), 
            ImageTransparency = 0.85, 
            LayoutOrder = v21.layoutOrder, 
            [v3.Event.Activated] = if not v21.isFullRowActivatable then nil else v30
        }, {
            UICorner = not not l_UIBloxThemeEnabled_0 and v2.createElement("UICorner", {
                CornerRadius = v7.MenuContainerCornerRadius
            }) or nil, 
            Padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 16), 
                PaddingLeft = UDim.new(0, 8)
            }), 
            Thumbnail = v2.createElement(v12, {
                user = l_user_0, 
                size = UDim2.new(0, 44, 0, 44), 
                position = UDim2.new(0, 0, 0.5, 0), 
                anchorPoint = Vector2.new(0, 0.5)
            }), 
            UserInfo = v2.createElement("Frame", {
                Position = UDim2.new(0, 44, 0, 0), 
                Size = UDim2.new(1, -118, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 8)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 4)
                }), 
                DisplayNameWrapper = v2.createElement("Frame", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    BackgroundTransparency = 1
                }, {
                    PresenceIconLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    Icon = v11.GetIcon(l_user_0.presence), 
                    DisplayName = v2.createElement("TextLabel", {
                        Size = UDim2.new(0, 0, 0, 16), 
                        Text = l_user_0.displayName, 
                        TextSize = 16, 
                        TextColor3 = v6.COLORS.WHITE, 
                        Font = l_AppFonts_0.default:getMedium(), 
                        BackgroundTransparency = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 2
                    })
                }), 
                Username = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 0, 0, 16), 
                    Text = "@" .. l_user_0.name, 
                    TextSize = 16, 
                    TextColor3 = v6.COLORS.PUMICE, 
                    Font = l_AppFonts_0.default:getDefault(), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            InviteButton = v2.createElement(v13, {
                size = UDim2.new(0, 66, 0, 36), 
                position = UDim2.new(1, 0, 0.5, 0), 
                anchorPoint = Vector2.new(1, 0.5), 
                onInvite = v30, 
                inviteStatus = v21.inviteStatus
            })
        });
    else
        return ;
    end;
end;
