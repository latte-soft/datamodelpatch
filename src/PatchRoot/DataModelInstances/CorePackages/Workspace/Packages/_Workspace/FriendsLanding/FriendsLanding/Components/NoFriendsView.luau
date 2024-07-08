local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_Dash_0 = v2.Dash;
local l_UIBlox_0 = v2.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = l_UIBlox_0.App.Button.Enum.StandardButtonSize;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local v18 = game:DefineFastFlag("EnableNoFriendsViewPageRenderReport", false);
local v19 = game:DefineFastFlag("FriendsLandingNoFriendsViewUseCustomLabels", false);
local v20 = {
    layoutOrder = 0, 
    pageLoadingTimeReport = nil, 
    pageRenderReport = nil, 
    openAddFriendsPage = l_Dash_0.noop, 
    addFriendsBtnLabelKey = if not v19 then nil else v15.ADD_FRIENDS_BTN, 
    noFriendsTextLabelKey = if not v19 then nil else v15.NO_FRIENDS_TEXT
};
return function(v21)
    local v22 = l_Dash_0.join(v20, v21 or {});
    l_React_0.useEffect(function()
        if v22.pageLoadingTimeReport then
            v22.pageLoadingTimeReport();
        end;
        if not (not v18 or not v22.pageRenderReport) then
            v22.pageRenderReport();
        end;
    end, {});
    local v23 = nil;
    v23 = if not v19 then l_useLocalization_0({
        addFriendsBtn = v15.ADD_FRIENDS_BTN, 
        noFriendsText = v15.NO_FRIENDS_TEXT
    }) else l_useLocalization_0({
        addFriendsBtn = v22.addFriendsBtnLabelKey, 
        noFriendsText = v22.noFriendsTextLabelKey, 
        noFriendsHeader = v22.noFriendsHeaderKey
    });
    local v24 = l_useStyle_0();
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, -(v16.TOP_BAR_HEIGHT + 45)), 
        LayoutOrder = v22.layoutOrder, 
        BackgroundTransparency = 1
    }, {
        IndicatorInner = l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, {
            SidePadding = l_React_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 30), 
                PaddingLeft = UDim.new(0, 30)
            }), 
            UIList = l_React_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 15)
            }), 
            Imagelabel = l_React_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/graphic/findfriends_xlarge"], 
                ImageColor3 = l_Colors_0.White, 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(96, 96)
            }), 
            Headerlabel = if (not not v19 and v22.noFriendsHeaderKey) and v23.noFriendsHeader then l_React_0.createElement(l_StyledTextLabel_0, {
                text = v23.noFriendsHeader, 
                fontStyle = v24.Font.Header1, 
                colorStyle = v24.Theme.TextEmphasis, 
                automaticSize = Enum.AutomaticSize.Y, 
                size = UDim2.new(0, 315, 0, 0), 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 2
            }) else nil, 
            Textlabel = l_React_0.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                Font = l_AppFonts_0.default:getDefault(), 
                LayoutOrder = 2, 
                Size = UDim2.new(0, 315, 0, 0), 
                Text = v23.noFriendsText, 
                TextColor3 = v24.Theme.TextMuted.Color, 
                TextSize = v24.Font.Header2.RelativeSize * v24.Font.BaseSize, 
                TextTransparency = v24.Theme.TextMuted.Transparency
            }), 
            Padding = l_React_0.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 10)
            }), 
            AddFriendsButton = l_React_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                layoutOrder = 4, 
                text = v23.addFriendsBtn, 
                standardSize = l_StandardButtonSize_0.Regular, 
                onActivated = v22.openAddFriendsPage
            })
        })
    });
end;
