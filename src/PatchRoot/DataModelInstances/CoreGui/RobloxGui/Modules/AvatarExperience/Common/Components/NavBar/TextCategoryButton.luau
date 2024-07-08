local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Cryo);
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v8 = require(l_CorePackages_0.Packages.t);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v5.Style.withStyle;
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.CategorySubButton);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NewItemNotification);
local v16 = v2.PureComponent:extend("TextCategoryButton");
local l_NavButtonElementPadding_0 = v13.NavButtonElementPadding;
local l_NavButtonElementMargin_0 = v13.NavButtonElementMargin;
local l_NavInnerPadding_0 = v13.NavInnerPadding;
local l_NavCornerSize_0 = v13.NavCornerSize;
local l_NavButtonBorderSize_0 = v13.NavButtonBorderSize;
local l_NavSubButtonInnerPadding_0 = v13.NavSubButtonInnerPadding;
v16.validateProps = v8.strictInterface({
    categoryTitle = v8.string, 
    layoutOrder = v8.number, 
    isSelected = v8.boolean, 
    hasNewItemNotification = v8.optional(v8.boolean), 
    frameRef = v8.table, 
    onActivate = v8.callback, 
    subButtons = v8.optional(v8.table), 
    onSubButtonSelected = v8.optional(v8.callback), 
    subcatIndex = v8.optional(v8.number), 
    forwardRef = v8.table, 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    inputBindings = v8.optional(v8.table)
});
v16.init = function(v23)
    if v23.props.subButtons and #v23.props.subButtons > 0 then
        v23.subButtonRefs = v3.createRefCache();
    end;
end;
v16.getDefaultChild = function(v24)
    if not (v24.props.subButtons ~= nil) or #v24.props.subButtons == 0 then
        return nil;
    else
        return v24.subButtonRefs[1];
    end;
end;
v16.getSubButtonNextSelectionLeft = function(v25, v26)
    if v26 > 1 then
        return v25.subButtonRefs[v26 - 1];
    else
        return nil;
    end;
end;
v16.getSubButtonNextSelectionRight = function(v27, v28)
    if v28 < #v27.props.subButtons then
        return v27.subButtonRefs[v28 + 1];
    else
        return nil;
    end;
end;
v16.getInnerFrameChildren = function(v29, v30, v31, v32, v33, v34, v35)
    local v36 = {};
    local l_isSelected_0 = v29.props.isSelected;
    local v38 = if not l_isSelected_0 then l_NavCornerSize_0 else l_NavCornerSize_0 - l_NavButtonBorderSize_0;
    local l_Theme_0 = v31.Theme;
    local v40 = not not l_isSelected_0 and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
    local l_Font_0 = v31.Font.Header2.Font;
    v36.UICorner = v2.createElement("UICorner", {
        CornerRadius = UDim.new(0, v38)
    });
    v36.UIPadding = v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 0), 
        PaddingTop = UDim.new(0, 0), 
        PaddingLeft = UDim.new(0, l_NavButtonElementMargin_0), 
        PaddingRight = UDim.new(0, l_NavButtonElementMargin_0)
    });
    v36.UIListLayout = v2.createElement("UIListLayout", {
        Padding = UDim.new(0, l_NavButtonElementPadding_0), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    });
    v36.TextLabel = v2.createElement("TextLabel", {
        Size = UDim2.new(0, v32, 1, 0), 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Text = v30.title, 
        TextSize = v35, 
        TextColor3 = v34, 
        TextTransparency = v40, 
        Font = l_Font_0, 
        BorderSizePixel = 0
    });
    local l_subButtons_0 = v29.props.subButtons;
    if l_subButtons_0 then
        for v43, v44 in l_subButtons_0, nil, nil do
            v36[v44.Name] = v2.createElement(v14, {
                title = v30[v44.Name], 
                width = v33[v43], 
                layoutOrder = v43 + 1, 
                index = v43, 
                onSubButtonSelected = function(v45)
                    if not l_isSelected_0 then
                        v29.props.onActivate();
                    end;
                    v29.props.onSubButtonSelected(v45);
                end, 
                parentButtonSelected = l_isSelected_0, 
                buttonRef = v29.subButtonRefs[v43], 
                NextSelectionLeft = v29:getSubButtonNextSelectionLeft(v43), 
                NextSelectionRight = v29:getSubButtonNextSelectionRight(v43)
            });
        end;
    end;
    return v36;
end;
v16.renderButtonWithText = function(v46, v47, v48, v49)
    local l_Font_1 = v48.Font;
    local l_Font_2 = l_Font_1.Header2.Font;
    local v52 = l_Font_1.BaseSize * l_Font_1.Header2.RelativeSize;
    local v53 = l_Text_0.GetTextWidth(v47.title, l_Font_2, v52);
    local l_Theme_1 = v48.Theme;
    local l_isSelected_1 = v46.props.isSelected;
    local v56 = not not l_isSelected_1 and l_Theme_1.TextEmphasis.Color or l_Theme_1.TextMuted.Color;
    local v57 = {};
    local v58 = 0;
    if v46.props.subButtons then
        for _, v60 in v46.props.subButtons, nil, nil do
            local v61 = l_Text_0.GetTextWidth(v47[v60.Name], l_Font_2, v52) + 2 * l_NavSubButtonInnerPadding_0;
            table.insert(v57, v61);
            v58 = (v58 + l_NavButtonElementPadding_0) + v61;
        end;
    end;
    local v62 = ((l_NavButtonElementMargin_0 + v53) + v58) + l_NavButtonElementMargin_0;
    local v63 = v46:getDefaultChild();
    if not l_isSelected_1 then
        return v2.createElement(l_Focusable_0.TextButton, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v62, 1, -l_NavInnerPadding_0), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            [v2.Event.Activated] = function()
                v46.props.onActivate();
            end, 
            [v2.Ref] = v46.props.forwardRef, 
            NextSelectionLeft = v46.props.NextSelectionLeft, 
            NextSelectionRight = v46.props.NextSelectionRight, 
            SelectionImageObject = v49(l_CursorKind_0.NavHighlight), 
            defaultChild = v63
        }, v46:getInnerFrameChildren(v47, v48, v53, v57, v56, v52));
    else
        return v2.createElement(l_Focusable_0.TextButton, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(0, v62 + l_NavButtonBorderSize_0 * 2, 1, -l_NavInnerPadding_0), 
            BackgroundTransparency = 0, 
            BackgroundColor3 = v56, 
            [v2.Event.Activated] = function()
                v46.props.onActivate();
            end, 
            [v2.Ref] = v46.props.forwardRef, 
            NextSelectionLeft = v46.props.NextSelectionLeft, 
            NextSelectionRight = v46.props.NextSelectionRight, 
            SelectionImageObject = v49(l_CursorKind_0.NavHighlight), 
            defaultChild = v63
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_NavCornerSize_0)
            }), 
            InnerFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, -l_NavButtonBorderSize_0 * 2, 1, -l_NavButtonBorderSize_0 * 2), 
                Position = UDim2.fromOffset(l_NavButtonBorderSize_0, l_NavButtonBorderSize_0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_1.BackgroundUIDefault.Color, 
                BorderSizePixel = 0
            }, v46:getInnerFrameChildren(v47, v48, v53, v57, v56, v52))
        });
    end;
end;
v16.renderWithProviders = function(v64, v65, v66, v67)
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        LayoutOrder = v64.props.layoutOrder, 
        [v2.Ref] = v64.props.frameRef
    }, {
        Button = v64:renderButtonWithText(v65, v66, v67), 
        NewItemNotification = v64.props.hasNewItemNotification and v2.createElement(v15, {
            isSelected = v64.props.isSelected
        })
    });
end;
v16.render = function(v68)
    local v69 = {
        title = v68.props.categoryTitle
    };
    if v68.props.subButtons then
        for _, v71 in v68.props.subButtons, nil, nil do
            v69[v71.Name] = v71.Title;
        end;
    end;
    return l_withLocalization_0(v69)(function(v72)
        return l_withStyle_0(function(v73)
            return l_withSelectionCursorProvider_0(function(v74)
                return v68:renderWithProviders(v72, v73, v74);
            end);
        end);
    end);
end;
return v2.forwardRef(function(v75, v76)
    return v2.createElement(v16, v6.Dictionary.join(v75, {
        forwardRef = v76
    }));
end);
