local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.UserAgreementUtils);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.Localization.withLocalization;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Checkbox_0 = l_UIBlox_0.App.InputButton.Checkbox;
local l_t_0 = v1.t;
local l_FitFrame_0 = v1.FitFrame;
local v10 = require(script.Parent.UserAgreementsListItem);
local l_FFlagEnableModularizedUserAgreementsList_0 = v1.SharedFlags.FFlagEnableModularizedUserAgreementsList;
local v12 = {
    REQUIRED = "REQUIRED", 
    OPTIONAL = "OPTIONAL"
};
local v13 = l_Roact_0.PureComponent:extend("UserAgreementsList");
v13.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    agreements = l_t_0.array(l_t_0.strictInterface({
        id = l_t_0.string, 
        agreementType = l_t_0.string, 
        clientType = l_t_0.string, 
        displayUrl = l_t_0.string, 
        regulationType = l_t_0.string
    })), 
    checkBoxStates = l_t_0.optional(l_t_0.map(l_t_0.string, l_t_0.boolean)), 
    setCheckBoxStates = l_t_0.optional(l_t_0.callback), 
    separateRequiredOptional = l_t_0.optional(l_t_0.boolean), 
    margin = l_t_0.optional(l_t_0.strictInterface({
        top = l_t_0.integer, 
        right = l_t_0.integer, 
        bottom = l_t_0.integer, 
        left = l_t_0.integer
    })), 
    verticalSpaceOffset = l_t_0.optional(l_t_0.integer), 
    isAgreeAllChecked = l_t_0.optional(l_t_0.boolean), 
    useScrollableFrame = l_t_0.optional(l_t_0.boolean)
});
v13.defaultProps = {
    margin = l_FitFrame_0.Rect.square(0)
};
shouldCreateRowsForAgreementType = function(v14, v15)
    local v16 = string.find(v14.agreementType:lower(), "optional");
    if not (tostring(v15) == tostring(v12.REQUIRED) and not v16) and (not (tostring(v15) == tostring(v12.OPTIONAL)) or not v16) then
        return false;
    else
        return true;
    end;
end;
updateTable = function(v17, v18, v19)
    local v20 = table.clone(v17);
    v20[v18] = v19;
    return v20;
end;
v13.getListItemsWithCheckBoxes = function(v21, _, v23, v24, v25, v26, v27)
    local l_agreements_0 = v21.props.agreements;
    local v29 = {};
    local v30 = {};
    for _, v32 in pairs(l_agreements_0) do
        if not v2.CheckAgreementTypeExists(v32.agreementType) then
            table.insert(v30, v32);
        else
            table.insert(v29, v32);
        end;
    end;
    local v33 = {
        v29, 
        v30
    };
    local v34 = {
        true, 
        false
    };
    local v35 = {};
    for v36, v37 in ipairs(v33) do
        for _, v39 in pairs(v37) do
            local v40 = v34[v36];
            local v41 = v26[v39.id];
            if shouldCreateRowsForAgreementType(v39, v24) then
                v23 = v23 + 1;
                v35["Item." .. v39.id] = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = v23
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    CheckboxFrame = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v25.Global.Size_600, 1, 0), 
                        LayoutOrder = 1
                    }, {
                        Padding = l_Roact_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v25.Global.Size_300), 
                            PaddingTop = UDim.new(0, v25.Global.Size_150)
                        }), 
                        Checkbox = l_Roact_0.createElement(l_Checkbox_0, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            text = "", 
                            isSelected = v41, 
                            onActivated = function()
                                v27((updateTable(v26, v39.id, not v41)));
                            end
                        })
                    }), 
                    AgreementRow = l_Roact_0.createElement(v10, {
                        LayoutOrder = v23, 
                        Size = UDim2.new(1, 0, 0, 55), 
                        agreement = v39, 
                        agreementTypeExists = v40, 
                        margin = l_FitFrame_0.Rect.quad(0, v25.Global.Size_300, 0, v25.Global.Size_200), 
                        hideLink = true, 
                        checkBoxPresent = true
                    })
                });
            end;
        end;
    end;
    return v35;
end;
getTableCount = function(v42)
    local v43 = 0;
    for _ in pairs(v42) do
        v43 = v43 + 1;
    end;
    return v43;
end;
setLayoutOrder = function(v45, v46)
    assert(type(v46) == "number", "Expected 'start' to be a number");
    local v47 = 0;
    local v48 = {};
    for _, v50 in pairs(v45) do
        for v51, _ in pairs(v50.props) do
            if v51 == "LayoutOrder" then
                v47 = v47 + 1;
                v50.props.LayoutOrder = v46 + v47;
                table.insert(v48, v50);
            end;
        end;
    end;
    return v48;
end;
v13.getListItems = function(v53, _)
    local l_margin_0 = v53.props.margin;
    local l_agreements_1 = v53.props.agreements;
    local v57 = {};
    local v58 = {};
    for _, v60 in ipairs(l_agreements_1) do
        if not v2.CheckAgreementTypeExists(v60.agreementType) then
            table.insert(v58, v60);
        else
            table.insert(v57, v60);
        end;
    end;
    local v61 = {
        v57, 
        v58
    };
    local v62 = {
        true, 
        false
    };
    local v63 = 0;
    local v64 = {};
    for v65, v66 in ipairs(v61) do
        for _, v68 in ipairs(v66) do
            local v69 = v62[v65];
            v63 = v63 + 1;
            v64["Item." .. v68.id] = l_Roact_0.createElement(v10, {
                LayoutOrder = v63, 
                Size = UDim2.new(1, 0, 0, 55), 
                agreement = v68, 
                agreementTypeExists = v69, 
                margin = l_FitFrame_0.Rect.quad(0, l_margin_0.right, 0, l_margin_0.left)
            });
        end;
    end;
    return v64;
end;
v13.checkBoxPropsExist = function(v70)
    local v71 = false;
    if v70.props.checkBoxStates ~= nil then
        v71 = false;
        if v70.props.setCheckBoxStates ~= nil then
            v71 = v70.props.isAgreeAllChecked ~= nil;
        end;
    end;
    return v71;
end;
v13.shouldReturnScrollableFrame = function(v72)
    return l_FFlagEnableModularizedUserAgreementsList_0 and (v72.props.useScrollableFrame or false);
end;
v13.render = function(v73)
    return l_withStyle_0(function(v74)
        local l_Theme_0 = v74.Theme;
        local l_Font_0 = v74.Font;
        local l_LayoutOrder_0 = v73.props.LayoutOrder;
        local l_margin_1 = v73.props.margin;
        local v79 = v73:getListItems(l_Theme_0);
        if v73:shouldReturnScrollableFrame() then
            local v80 = v73.props.separateRequiredOptional or false;
            local v81 = v73.props.verticalSpaceOffset or 0;
            local l_Tokens_0 = v74.Tokens;
            local v83 = {
                required = "CommonUI.UserAgreements.Popup.Agreement.Required", 
                optional = "CommonUI.UserAgreements.Popup.Agreement.Optional"
            };
            local v84 = {};
            local v85 = {};
            if not v73:checkBoxPropsExist() then
                v84 = v73:getListItems(l_Theme_0);
            else
                v84 = v73:getListItemsWithCheckBoxes(l_Theme_0, 0, v12.REQUIRED, l_Tokens_0, v73.props.checkBoxStates, v73.props.setCheckBoxStates);
                v85 = v73:getListItemsWithCheckBoxes(l_Theme_0, getTableCount(v79), v12.OPTIONAL, l_Tokens_0, v73.props.checkBoxStates, v73.props.setCheckBoxStates);
            end;
            v84 = setLayoutOrder(v84, 1);
            v85 = setLayoutOrder(v85, getTableCount(v79) + 4);
            return l_withLocalization_0(v83)(function(v86)
                return l_Roact_0.createElement("ScrollingFrame", {
                    LayoutOrder = l_LayoutOrder_0, 
                    Size = UDim2.new(1, 0, 1, -v81), 
                    BackgroundTransparency = 1, 
                    ScrollingEnabled = true, 
                    BorderSizePixel = 0, 
                    CanvasSize = UDim2.new(1, 0, 1, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarThickness = 2
                }, {
                    UIListLayout = l_Roact_0.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    RequiredTitleText = v80 and l_Roact_0.createElement("Frame", {
                        LayoutOrder = 0, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = l_Roact_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_Tokens_0.Global.Size_300), 
                            PaddingTop = UDim.new(0, l_Tokens_0.Global.Size_100), 
                            PaddingBottom = UDim.new(0, l_Tokens_0.Global.Size_100)
                        }), 
                        TextLabel = l_Roact_0.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Text = v86.required, 
                            TextSize = l_Tokens_0.Global.FontSize_200, 
                            TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
                            TextTransparency = v74.Theme.TextDefault.Transparency, 
                            Font = l_Font_0.Header1.Font, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true, 
                            Size = UDim2.new(1, 0, 0, 0)
                        })
                    }), 
                    ItemsRequired = l_Roact_0.createFragment(v84), 
                    OptionalTitleText = v80 and l_Roact_0.createElement("Frame", {
                        LayoutOrder = getTableCount(v79) + 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, {
                        Padding = l_Roact_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_Tokens_0.Global.Size_300), 
                            PaddingTop = UDim.new(0, l_Tokens_0.Global.Size_100), 
                            PaddingBottom = UDim.new(0, l_Tokens_0.Global.Size_100)
                        }), 
                        TextLabel = l_Roact_0.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Text = v86.optional, 
                            TextSize = l_Tokens_0.Global.FontSize_200, 
                            TextColor3 = l_Tokens_0.Semantic.Color.Text.Emphasis.Color3, 
                            TextTransparency = v74.Theme.TextDefault.Transparency, 
                            Font = l_Font_0.Header1.Font, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true, 
                            Size = UDim2.new(1, 0, 0, 0)
                        })
                    }), 
                    OptionalItems = v80 and l_Roact_0.createFragment(v85)
                });
            end);
        else
            return l_Roact_0.createElement(l_FitFrame_0.FitFrameVertical, {
                LayoutOrder = l_LayoutOrder_0, 
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                margin = l_FitFrame_0.Rect.quad(l_margin_1.top, 0, l_margin_1.bottom, 0)
            }, v79);
        end;
    end);
end;
return v13;
