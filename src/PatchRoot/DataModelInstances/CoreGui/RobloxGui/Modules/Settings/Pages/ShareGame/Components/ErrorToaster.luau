local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v6 = require(l_ShareGame_0.Constants);
local v7 = require(l_ShareGame_0.Actions.StoppedToastTimer);
local v8 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_InviteStatus_0 = v6.InviteStatus;
local v10 = require(l_ShareGame_0.getTranslator)();
local v11 = v2.PureComponent:extend("ErrorToaster");
v11.restartTimer = function(v12)
    if not v12.timerConnection then
        v12.timerConnection = l_RunService_0.RenderStepped:Connect(function()
            local l_failedInvites_0 = v12.props.failedInvites;
            if #l_failedInvites_0 == 0 then
                v12:stopTimer();
                return ;
            else
                if l_failedInvites_0[#l_failedInvites_0].timeStamp + 4 < tick() then
                    v12:stopTimer();
                end;
                return ;
            end;
        end);
    end;
end;
v11.stopTimer = function(v14)
    if v14.timerConnection then
        v14.timerConnection:Disconnect();
        v14.timerConnection = nil;
    end;
    v14.props.stoppedTimerDispatch();
end;
v11.didUpdate = function(v15)
    if #v15.props.failedInvites ~= 0 then
        v15:restartTimer();
    end;
end;
v11.render = function(v16)
    local l_deviceLayout_0 = v16.props.deviceLayout;
    local l_failedInvites_1 = v16.props.failedInvites;
    local l_TOAST_HEIGHT_0 = v6.LayoutSpecific[l_deviceLayout_0].TOAST_HEIGHT;
    if #l_failedInvites_1 == 0 then
        return ;
    else
        local v20 = nil;
        local l_status_0 = l_failedInvites_1[#l_failedInvites_1].status;
        if l_status_0 == l_InviteStatus_0.Moderated then
            v20 = "Feature.SettingsHub.Label.ModeratedInviteError";
        elseif l_status_0 == l_InviteStatus_0.Failed then
            v20 = "Feature.SettingsHub.Label.GameInviteError";
        else
            return ;
        end;
        return v2.createElement("ScreenGui", {
            DisplayOrder = 2, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            ToastFrame = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundColor3 = v6.Color.RED, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Size = UDim2.new(0.5, 0, 0, l_TOAST_HEIGHT_0)
            }, {
                InnerTextPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 6), 
                    PaddingRight = UDim.new(0, 6)
                }), 
                ToastText = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v8.font(Enum.Font.SourceSansSemibold, "Semibold"), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v10:FormatByKey(v20), 
                    TextColor3 = v6.Color.WHITE, 
                    TextSize = v8.textSize(16), 
                    TextWrapped = true
                })
            })
        });
    end;
end;
return v3.UNSTABLE_connect2(function(v22)
    return {
        deviceLayout = v22.DeviceInfo.DeviceLayout, 
        failedInvites = v22.Toasts.failedInvites
    };
end, function(v23)
    return {
        stoppedTimerDispatch = function()
            v23(v7());
        end
    };
end)(v11);
