local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v4 = require(l_script_FirstAncestor_0.constants);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactRoblox);
local v7 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v7.Core.Style.useStyle;
local l_DarkTheme_0 = v7.App.Style.Themes.DarkTheme;
local l_components_0 = l_script_FirstAncestor_0.components;
local v11 = require(l_components_0.StreamNotificationsHeader);
local v12 = require(l_components_0.StreamNotificationsContent);
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local l_NotificationHelper_0 = require(l_Parent_0.NotificationsCommon).NotificationHelper;
local v15 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
return function(v16)
    local v17 = l_useStyle_0();
    local v18, v19 = v5.useState(l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit);
    v5.useEffect(function()
        local v20 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function()
            if l_CurrentCamera_0.ViewportSize.X < v4.Modal.WidthLimit then
                v19(true);
                return ;
            else
                v19(false);
                return ;
            end;
        end);
        return function()
            v20:Disconnect();
        end;
    end, {});
    local v21, v22 = v5.useState(true);
    local v24 = v5.useCallback(function(v23)
        v22(v23);
    end);
    local v25, v26 = v5.useState(true);
    return v6.createPortal({
        ScreenGui = v5.createElement("ScreenGui", {
            Enabled = v25, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = 10, 
            IgnoreGuiInset = true
        }, {
            TextButtonOverlayBackground = v5.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = not v21 and 1 or v17.Theme.BackgroundOnPress.Transparency, 
                BackgroundColor3 = v17.Theme.BackgroundOnPress.Color, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                Text = "", 
                [v5.Event.Activated] = function()
                    v16.displayStream(false);
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v15.Context.click, v15.EventNames.closeContent, {
                        closeMethod = v15.CloseMethod.backgroundOverlay
                    });
                end
            }, {
                StreamNotificationsFrame = v5.createElement("TextButton", {
                    Size = if not v18 then UDim2.new(0, v4.Modal.Width, 0, v4.Modal.Height) else UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundColor3 = if v17.theme == l_DarkTheme_0 then v17.Theme.Overlay.Color else v17.Theme.BackgroundMuted.Color, 
                    AutoButtonColor = false, 
                    BorderSizePixel = 0, 
                    Text = ""
                }, {
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = if v18 then UDim.new(0, 0) else UDim.new(0, v4.Modal.CornerRadius)
                    }), 
                    Header = v5.createElement(v11, {
                        isSmallScreen = v18, 
                        displayStream = v16.displayStream
                    }), 
                    StreamNotificationsContent = v5.createElement(v12, {
                        showOverlay = v24, 
                        isSmallScreen = v18, 
                        displayStream = v16.displayStream, 
                        setDisplayScreenGuiEnabled = v26
                    })
                })
            })
        })
    }, l_CoreGui_0);
end;
