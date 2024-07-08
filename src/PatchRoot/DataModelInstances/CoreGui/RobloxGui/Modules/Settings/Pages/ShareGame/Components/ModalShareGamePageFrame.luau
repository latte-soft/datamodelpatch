local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v7 = require(l_ShareGame_0.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local v9 = require(l_ShareGame_0.Components.Header);
local v10 = require(l_ShareGame_0.Components.ConversationList);
local v11 = require(l_ShareGame_0.Components.ErrorToaster);
local v12 = require(l_ShareGame_0.Components.BackButton);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v14 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v15 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenu);
local v16 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local v17 = UDim.new(0.8, 320);
local v18 = UDim.new(0.7, 500);
local v19 = UDim.new(0.8, 440);
local v20 = Color3.fromRGB(41, 41, 41);
local v21 = v4.PureComponent:extend("ModalShareGamePageFrame");
v21.defaultProps = {
    isVisible = true
};
v21.init = function(v22)
    v22.state = {
        promptMessageFitsFrame = true
    };
    v22.onCustomTextAreaSizeChange = function(v23)
        local v24 = v7.LayoutSpecific[v22.props.deviceLayout];
        local l_promptMessage_0 = v22.props.promptMessage;
        v22:setState({
            promptMessageFitsFrame = l_promptMessage_0 and l_Text_0.GetTextWidth(l_promptMessage_0, v14.font(Enum.Font.SourceSans), (v14.textSize(v24.PAGE_TITLE_TEXT_SIZE))) < v23.AbsoluteSize.X
        });
    end;
    v22.customTextAreaRef = v4.createRef();
    v22.onClosePage = function()
        v22.props.closePage();
        if v22.props.onAfterClosePage then
            v22.props.onAfterClosePage();
        end;
    end;
end;
v21.didMount = function(v26)
    if not (not v15() or not v26.customTextAreaRef.current) then
        v26.onCustomTextAreaSizeChange(v26.customTextAreaRef.current);
    end;
    if not ((not v16() or not v26.props.promptMessage) or not v26.props.analytics) then
        v26.props.analytics:sendEvent(v7.Triggers.DeveloperMultiple, l_GameInviteEvents_0.CustomTextShown);
    end;
end;
v21.render = function(v27)
    local l_analytics_0 = v27.props.analytics;
    local l_deviceLayout_0 = v27.props.deviceLayout;
    local l_zIndex_0 = v27.props.zIndex;
    local l_searchAreaActive_0 = v27.props.searchAreaActive;
    local l_searchText_0 = v27.props.searchText;
    local l_isVisible_0 = v27.props.isVisible;
    local v34 = v15();
    local v35 = if not v34 then v17 else v19;
    local v36 = (v34 and v27.props.deviceInfo) and v27.props.deviceInfo.DeviceLayout == v7.DeviceLayout.PHONE_LANDSCAPE;
    local v37 = Vector2.new(0.5, 0.5);
    local v38 = UDim2.new(v35.Scale, 0, v18.Scale, 0);
    local v39 = Vector2.new(v35.Offset, v18.Offset);
    local v40 = UDim2.new(0.5, 0, 0.425, 0);
    if v36 then
        v37 = Vector2.new(0.5, 1);
        v38 = UDim2.new(v35.Scale, 0, 1, 0);
        v39 = Vector2.new(v35.Offset, math.huge);
        v40 = UDim2.new(0.5, 0, 1, 4);
    end;
    local v41 = v7.LayoutSpecific[l_deviceLayout_0];
    local l_promptMessage_1 = v27.props.promptMessage;
    local v43 = v14.textSize(v41.PAGE_TITLE_TEXT_SIZE);
    local v44 = (v34 and l_promptMessage_1) and v27.state.promptMessageFitsFrame;
    local v45 = not v44 and 10 or v43 + 10;
    return v4.createElement("ImageButton", {
        AnchorPoint = v37, 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/LuaChat/9-slice/btn-control-sm.png", 
        ImageColor3 = v20, 
        ImageTransparency = 0.1, 
        Modal = l_isVisible_0, 
        Position = v40, 
        Size = v38, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(3, 3), Vector2.new(3, 3))
    }, {
        sizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = v39
        }), 
        uiPadding2 = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 15), 
            PaddingRight = UDim.new(0, 15), 
            PaddingBottom = UDim.new(0, 15)
        }), 
        content = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            ZIndex = l_zIndex_0
        }, {
            toasterPortal = v4.createElement(v4.Portal, {
                target = l_CoreGui_0
            }, {
                Toaster = v4.createElement(v11)
            }), 
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = if not v34 then nil else v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10)
            }), 
            Header = v4.createElement(v9, {
                deviceLayout = l_deviceLayout_0, 
                size = UDim2.new(1, 0, 0, not v34 and 60 or 40), 
                layoutOrder = 0, 
                zIndex = l_zIndex_0, 
                closePage = v27.onClosePage, 
                searchAreaActive = l_searchAreaActive_0, 
                toggleSearchIcon = true, 
                iconType = v12.IconType.Cross
            }), 
            CustomText = v34 and v4.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v45), 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextSize = v43, 
                TextColor3 = v7.Color.WHITE, 
                Font = v14.font(Enum.Font.SourceSans), 
                BackgroundTransparency = 1, 
                Text = not v44 and "" or l_promptMessage_1, 
                [v4.Change.AbsoluteSize] = v27.onCustomTextAreaSizeChange, 
                [v4.Ref] = v27.customTextAreaRef
            }), 
            ConversationList = v4.createElement(v10, {
                analytics = l_analytics_0, 
                size = UDim2.new(1, 0, 1, -(not v34 and 60 or 40 + v45)), 
                topPadding = 10, 
                layoutOrder = 1, 
                zIndex = l_zIndex_0, 
                searchText = l_searchText_0, 
                entryHeight = 62, 
                entryPadding = 18, 
                isVisible = l_isVisible_0, 
                trigger = v7.Triggers.DeveloperMultiple, 
                inviteMessageId = v27.props.inviteMessageId, 
                launchData = v27.props.launchData
            })
        })
    });
end;
return (v5.connect(function(v46)
    return {
        deviceInfo = v46.DeviceInfo
    };
end)(v21));
