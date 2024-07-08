local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Cryo);
local l_Images_0 = v5.App.ImageSet.Images;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v10 = require(l_CorePackages_0.Packages.t);
local v11 = require(l_CorePackages_0.Otter);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v5.Style.withStyle;
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.CategorySubButton);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NewItemNotification);
local l_NavInnerPadding_0 = v16.NavInnerPadding;
local l_NavCornerSize_0 = v16.NavCornerSize;
local l_NavSubButtonInnerPadding_0 = v16.NavSubButtonInnerPadding;
local l_NavButtonElementPadding_0 = v16.NavButtonElementPadding;
local l_NavButtonElementMargin_0 = v16.NavButtonElementMargin;
local v24 = {
    frequency = 3.0303030303030303, 
    dampingRatio = 1
};
local v25 = v2.PureComponent:extend("IconCategoryButton");
v25.validateProps = v10.strictInterface({
    categoryTitle = v10.string, 
    iconOn = v10.string, 
    iconOff = v10.string, 
    navHeight = v10.number, 
    isSubNavigationButton = v10.boolean, 
    layoutOrder = v10.number, 
    isSelected = v10.boolean, 
    hasNewItemNotification = v10.optional(v10.boolean), 
    frameRef = v10.table, 
    forwardRef = v10.table, 
    onActivate = v10.callback, 
    subButtons = v10.optional(v10.table), 
    onSubButtonSelected = v10.optional(v10.callback), 
    subcatIndex = v10.optional(v10.number), 
    NextSelectionUp = v10.optional(v10.table), 
    NextSelectionDown = v10.optional(v10.table), 
    NextSelectionLeft = v10.optional(v10.table), 
    NextSelectionRight = v10.optional(v10.table), 
    inputBindings = v10.optional(v10.table)
});
v25.init = function(v26)
    local v27 = not v26.props.isSelected and 0 or 1;
    local v28, v29 = v2.createBinding(v27);
    v26.nonIconSizeMultiplierBinding = v28;
    v26.nonIconSizeMultiplierBindingUpdate = v29;
    v26.motor = v11.createSingleMotor(v27);
    v26.motor:onStep(v26.nonIconSizeMultiplierBindingUpdate);
    if v26.props.subButtons and #v26.props.subButtons > 0 then
        v26.subButtonRefs = v3.createRefCache();
    end;
end;
v25.didUpdate = function(v30, v31, _)
    if v30.props.isSelected ~= v31.isSelected then
        v30.motor:setGoal(v11.spring(not v30.props.isSelected and 0 or 1, v24));
    end;
end;
v25.willUnmount = function(v33)
    v33.motor:destroy();
end;
v25.getDefaultChild = function(v34)
    if v34.props.isSelected then
        if not (v34.props.subButtons ~= nil) or #v34.props.subButtons == 0 then
            return nil;
        else
            return v34.subButtonRefs[1];
        end;
    else
        return nil;
    end;
end;
v25.getSubButtonNextSelectionLeft = function(v35, v36)
    if v36 > 1 then
        return v35.subButtonRefs[v36 - 1];
    else
        return v35.props.NextSelectionLeft;
    end;
end;
v25.getSubButtonNextSelectionRight = function(v37, v38)
    if v38 < #v37.props.subButtons then
        return v37.subButtonRefs[v38 + 1];
    else
        return v37.props.NextSelectionRight;
    end;
end;
v25.getInnerFrameChildren = function(v39, v40, v41, v42, v43, v44, v45, v46, v47)
    local v48 = {};
    local v49 = {};
    local l_Theme_0 = v41.Theme;
    local l_isSelected_0 = v39.props.isSelected;
    local v52 = not not l_isSelected_0 and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextMuted.Color;
    local v53 = not not l_isSelected_0 and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
    local l_Font_0 = v41.Font.Header2.Font;
    v49.UIPadding = v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 0), 
        PaddingTop = UDim.new(0, 0), 
        PaddingLeft = UDim.new(0, l_NavButtonElementPadding_0), 
        PaddingRight = UDim.new(0, 0)
    });
    v49.UIListLayout = v2.createElement("UIListLayout", {
        Padding = UDim.new(0, l_NavButtonElementPadding_0), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    });
    v49.TextLabel = v2.createElement("TextLabel", {
        Size = UDim2.new(0, v42, 1, 0), 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Text = v40.title, 
        TextSize = v45, 
        TextColor3 = v52, 
        TextTransparency = v53, 
        Font = l_Font_0, 
        BorderSizePixel = 0
    });
    local l_subButtons_0 = v39.props.subButtons;
    if l_subButtons_0 then
        for v56, v57 in l_subButtons_0, nil, nil do
            v49[v57.Name] = v2.createElement(v17, {
                title = v40[v57.Name], 
                width = v43[v56], 
                layoutOrder = v56 + 1, 
                index = v56, 
                onSubButtonSelected = function(v58)
                    if not l_isSelected_0 then
                        v39.props.onActivate();
                    end;
                    v39.props.onSubButtonSelected(v58);
                end, 
                parentButtonSelected = l_isSelected_0, 
                isClippedWhenParentUnselected = true, 
                buttonRef = v39.subButtonRefs[v56], 
                NextSelectionLeft = v39:getSubButtonNextSelectionLeft(v56), 
                NextSelectionRight = v39:getSubButtonNextSelectionRight(v56)
            });
        end;
    end;
    v48.UICorner = v2.createElement("UICorner", {
        CornerRadius = UDim.new(0, l_NavCornerSize_0)
    });
    v48.UIPadding = v2.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 0), 
        PaddingTop = UDim.new(0, 0), 
        PaddingLeft = UDim.new(0, l_NavButtonElementMargin_0), 
        PaddingRight = UDim.new(0, l_NavButtonElementMargin_0)
    });
    v48.Icon = v2.createElement(l_ImageSetLabel_0, {
        LayoutOrder = 2, 
        BackgroundTransparency = 1, 
        Image = if not l_isSelected_0 then l_Images_0[v39.props.iconOff] else l_Images_0[v39.props.iconOn], 
        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
        Size = UDim2.new(0, v44, 1, -v46), 
        ScaleType = Enum.ScaleType.Fit, 
        Position = UDim2.new(0, 0, 0, 0)
    });
    v48.ScaledFrame = v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        Size = v39.nonIconSizeMultiplierBinding:map(function(v59)
            return UDim2.new(0, v59 * v47, 1, -v46);
        end), 
        Position = UDim2.fromOffset(v44, 0)
    }, v49);
    return v48;
end;
v25.renderButtonWithTextAndIcon = function(v60, v61, v62, v63, v64, v65, v66, v67, v68)
    local l_Font_1 = v62.Font;
    local v70 = l_Font_1.BaseSize * l_Font_1.Header2.RelativeSize;
    local l_Theme_1 = v62.Theme;
    local l_forwardRef_0 = v60.props.forwardRef;
    local l_isSubNavigationButton_0 = v60.props.isSubNavigationButton;
    return v2.createElement(l_Focusable_0.ImageButton, {
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, l_NavInnerPadding_0), 
        Size = UDim2.new(1, 0, 1, -l_NavInnerPadding_0 + v64), 
        BackgroundTransparency = if not l_isSubNavigationButton_0 then l_Theme_1.BackgroundDefault.Transparency else l_Theme_1.BackgroundUIDefault.Transparency, 
        BackgroundColor3 = if not l_isSubNavigationButton_0 then l_Theme_1.BackgroundDefault.Color else l_Theme_1.BackgroundUIDefault.Color, 
        [v2.Event.Activated] = v60.props.onActivate, 
        [v2.Ref] = l_forwardRef_0, 
        NextSelectionLeft = v60.props.NextSelectionLeft, 
        NextSelectionRight = v60.props.NextSelectionRight, 
        SelectionImageObject = v63(l_CursorKind_0.NavHighlight), 
        restorePreviousChildFocus = true, 
        defaultChild = v60:getDefaultChild()
    }, v60:getInnerFrameChildren(v61, v62, v65, v66, v67, v70, v64, v68));
end;
v25.renderWithProviders = function(v74, v75, v76, v77)
    local l_isSelected_1 = v74.props.isSelected;
    local l_hasNewItemNotification_0 = v74.props.hasNewItemNotification;
    local l_frameRef_0 = v74.props.frameRef;
    local l_Font_2 = v76.Font;
    local l_Font_3 = l_Font_2.Header2.Font;
    local v83 = l_Font_2.BaseSize * l_Font_2.Header2.RelativeSize;
    local v84 = l_Text_0.GetTextWidth(v75.title, l_Font_3, v83);
    local v85 = {};
    local v86 = 0;
    if v74.props.subButtons then
        for _, v88 in v74.props.subButtons, nil, nil do
            local v89 = l_Text_0.GetTextWidth(v75[v88.Name], l_Font_3, v83) + 2 * l_NavSubButtonInnerPadding_0;
            table.insert(v85, v89);
            v86 = (v86 + l_NavButtonElementPadding_0) + v89;
        end;
    end;
    local v90 = if not v74.props.isSubNavigationButton then l_NavCornerSize_0 else 0;
    local v91 = (v74.props.navHeight - l_NavInnerPadding_0) - 2 * l_NavButtonElementPadding_0;
    local v92 = (l_NavButtonElementPadding_0 + v84) + v86;
    local v93 = (l_NavButtonElementMargin_0 + v91) + l_NavButtonElementMargin_0;
    return v2.createElement("Frame", {
        Size = v74.nonIconSizeMultiplierBinding:map(function(v94)
            return UDim2.new(0, v93 + v94 * v92, 1, -l_NavInnerPadding_0 + v90);
        end), 
        BackgroundTransparency = 1, 
        LayoutOrder = v74.props.layoutOrder, 
        [v2.Ref] = l_frameRef_0
    }, {
        Button = v74:renderButtonWithTextAndIcon(v75, v76, v77, v90, v84, v85, v91, v92), 
        NewItemNotification = l_hasNewItemNotification_0 and v2.createElement(v18, {
            isSelected = l_isSelected_1
        })
    });
end;
v25.render = function(v95)
    local v96 = {
        title = v95.props.categoryTitle
    };
    if v95.props.subButtons then
        for _, v98 in v95.props.subButtons, nil, nil do
            v96[v98.Name] = v98.Title;
        end;
    end;
    return l_withLocalization_0(v96)(function(v99)
        return l_withStyle_0(function(v100)
            return l_withSelectionCursorProvider_0(function(v101)
                return v95:renderWithProviders(v99, v100, v101);
            end);
        end);
    end);
end;
return v2.forwardRef(function(v102, v103)
    return v2.createElement(v25, v6.Dictionary.join(v102, {
        forwardRef = v103
    }));
end);
