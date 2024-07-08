local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_VRService_0 = game:GetService("VRService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_CorePackages_0.Roact);
local v7 = require(l_CorePackages_0.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = require(l_RobloxGui_0.Modules.TenFootInterface);
local _ = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local _ = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v15 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v18 = v6.PureComponent:extend("MenuIcon");
local v19 = require(l_RobloxGui_0.Modules.Flags.GetFStringVoiceBetaBadgeLearnMore);
local v20 = require(l_RobloxGui_0.Modules.Flags.GetFFlagBetaBadgeLearnMoreLinkFormview);
local l_Parent_0 = script.Parent.Parent.Parent;
local v22 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v23 = require(l_Parent_0.Actions.SetKeepOutArea);
local v24 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local v25 = require(l_Parent_0.Constants);
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local v27 = if not require(l_Chrome_0.Enabled) then nil else require(l_Chrome_0.Service);
v18.validateProps = v8.strictInterface({
    layoutOrder = v8.integer, 
    Analytics = v8.table, 
    setKeepOutArea = v8.optional(v8.callback), 
    removeKeepOutArea = v8.optional(v8.callback)
});
local v28 = {
    FullScreen = 0, 
    FormSheet = 2
};
local v29 = UDim2.fromOffset(31, 11);
local v30 = UDim.new(0, 12);
local v31 = UDim2.fromOffset(330, 185);
local v32 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local function v33()
end;
openWebview = function(v34)
    local v35 = l_HttpService_0:JSONEncode({
        title = if not game:GetEngineFeature("SetWebViewTitle") then nil else "Help Center", 
        presentationStyle = if not v20() then nil else v28.FormSheet, 
        visible = true, 
        url = v34
    });
    v15:debug("Opening Webview with payload {}", v35);
    l_GuiService_0:BroadcastNotification(v35, 20);
end;
v18.init = function(v36)
    v36.buttonRef = v6.createRef();
    v36:setState({
        chromeMenuOpen = v27 and v27:status():get() == v27.MenuStatus.Open, 
        vrShowMenuIcon = l_VRService_0.VREnabled and l_GamepadService_0.GamepadCursorEnabled, 
        voiceChatServiceConnected = false, 
        showPopup = false
    });
    if game:GetEngineFeature("VoiceChatSupported") then
        l_default_0:asyncInit():andThen(function()
            v36:setState({
                voiceChatServiceConnected = true
            });
        end):catch(v33);
    end;
    v36.menuIconActivated = function()
        v36:setState({
            showPopup = not v36.state.showPopup
        });
        v36.props.Analytics.EventStream:setRBXEvent("voiceChat", v36.state.showPopup and "closeBetaBadge" or "openBetaBadge");
    end;
    v36.learnMore = function()
        openWebview((v19()));
        v36.props.Analytics.EventStream:setRBXEvent("voiceChat", "clickBetaBadgeLearnMore");
    end;
end;
v18.didMount = function(v37)
    if v27 then
        v37.chromeMenuStatusConn = v27:status():connect(function()
            v37:setState({
                chromeMenuOpen = v27:status():get() == v27.MenuStatus.Open
            });
        end);
    end;
end;
v18.onUnmount = function(v38)
    if v38.chromeMenuStatusConn then
        v38.chromeMenuStatusConn:Disconnect();
        v38.chromeMenuStatusConn = nil;
    end;
end;
v18.render = function(v39)
    local v40 = (not l_VRService_0.VREnabled or v39.state.vrShowMenuIcon) and v39.state.voiceChatServiceConnected;
    if v39.state.chromeMenuOpen then
        v40 = false;
    end;
    local function v42(v41)
        if not v40 or not v41 then
            v39.props.removeKeepOutArea(v25.VoiceBetaBadgeKeepOutAreaId);
            return ;
        else
            v39.props.setKeepOutArea(v25.VoiceBetaBadgeKeepOutAreaId, Vector2.new(v41.AbsolutePosition.X - 2, v41.AbsolutePosition.Y - 2), (Vector2.new(v41.AbsoluteSize.X + 4, v41.AbsoluteSize.Y + 4)));
            return ;
        end;
    end;
    if not (not v22 or not v39.buttonRef.current) then
        v42(v39.buttonRef.current);
    end;
    return l_withStyle_0(function(v43)
        local l_Footer_0 = v43.Font.Footer;
        local l_Font_0 = l_Footer_0.Font;
        local v46 = v43.Font.BaseSize * l_Footer_0.RelativeSize;
        local l_BackgroundUIContrast_0 = v43.Theme.BackgroundUIContrast;
        local l_TextEmphasis_0 = v43.Theme.TextEmphasis;
        return v6.createFragment({
            PopupWrapper = v6.createElement("Frame", {
                Visible = v40 and v39.state.showPopup, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v39.props.layoutOrder + 1
            }, {
                Popup = v6.createElement("Frame", {
                    Size = v31, 
                    Position = UDim2.fromOffset(0, 10), 
                    BackgroundTransparency = l_BackgroundUIContrast_0.Transparency, 
                    BackgroundColor3 = l_BackgroundUIContrast_0.Color
                }, {
                    Layout = v6.createElement("UIListLayout", {
                        Padding = UDim.new(0, 8), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Popup = v6.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 0
                    }, {
                        Layout = v6.createElement("UIListLayout", {
                            Padding = UDim.new(0, 0), 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        Starter = v6.createElement("TextLabel", {
                            Text = v32:FormatByKey("InGame.CommonUI.Badge.Popup.HeaderList"), 
                            TextSize = v46, 
                            Font = l_Font_0, 
                            LayoutOrder = 0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextColor3 = l_TextEmphasis_0.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1
                        }), 
                        FirstBullet = v6.createElement("TextLabel", {
                            Text = "\226\128\162 " .. v32:FormatByKey("InGame.CommonUI.Badge.Popup.VoiceChatBullet"), 
                            TextSize = v46, 
                            Font = l_Font_0, 
                            LayoutOrder = 2, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextColor3 = l_TextEmphasis_0.Color, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1
                        })
                    }), 
                    Text = v6.createElement("TextLabel", {
                        Text = v32:FormatByKey("InGame.CommonUI.Badge.Popup.DisclaimerText2"), 
                        TextSize = v46, 
                        Font = l_Font_0, 
                        LayoutOrder = 0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = l_TextEmphasis_0.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1
                    }), 
                    LearnMoreLink = v6.createElement("TextButton", {
                        Text = v32:FormatByKey("InGame.CommonUI.Badge.Popup.LearnMoreLink"), 
                        TextSize = v46, 
                        Font = l_Font_0, 
                        LayoutOrder = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v43.Theme.TextLink.Color, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        [v6.Event.Activated] = v39.learnMore
                    }), 
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    UIPadding = v6.createElement("UIPadding", {
                        PaddingLeft = v30, 
                        PaddingRight = v30, 
                        PaddingBottom = v30, 
                        PaddingTop = v30
                    })
                })
            }), 
            Button = v6.createElement("Frame", {
                Visible = v40, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v39.props.layoutOrder, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0, 1), 
                [v6.Change.AbsoluteSize] = if not v22 then nil else v42, 
                [v6.Change.AbsolutePosition] = if not v22 then nil else v42, 
                [v6.Ref] = v39.buttonRef
            }, {
                Layout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ActualButton = v6.createElement("Frame", {
                    Visible = v40, 
                    BackgroundTransparency = 0, 
                    Size = v29, 
                    BackgroundColor3 = Color3.fromRGB(238, 206, 83)
                }, {
                    Button = v6.createElement("TextButton", {
                        Text = v32:FormatByKey("InGame.CommonUI.Badge.BadgeText"), 
                        Font = l_AppFonts_0.default:getBold(), 
                        TextSize = 8, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = v29, 
                        TextColor3 = l_BackgroundUIContrast_0.Color, 
                        [v6.Event.Activated] = v39.menuIconActivated
                    }), 
                    UICorner = v6.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 3)
                    }), 
                    UIStroke = v6.createElement("UIStroke", {
                        Thickness = 2, 
                        Color = l_TextEmphasis_0.Color
                    }), 
                    VREnabledListener = l_GamepadService_0 and v6.createElement(l_ExternalEventConnection_0, {
                        event = l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
                        callback = function()
                            v39:setState({
                                vrShowMenuIcon = l_VRService_0.VREnabled and l_GamepadService_0.GamepadCursorEnabled
                            });
                        end or nil
                    })
                })
            })
        });
    end);
end;
if not v22 then
    return v18;
else
    return v7.UNSTABLE_connect2(nil, function(v49)
        return {
            setKeepOutArea = function(v50, v51, v52)
                return v49(v23(v50, v51, v52));
            end, 
            removeKeepOutArea = function(v53)
                return v49(v24(v53));
            end
        };
    end)(v18);
end;
