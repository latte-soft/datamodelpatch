local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.AvatarExperienceDeps);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local l_RoactFitComponents_0 = v5.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local v13 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v13.Style.withStyle;
local l_InteractiveAlert_0 = v13.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v13.App.Button.Enum.ButtonType;
local l_Checkbox_0 = v13.App.InputButton.Checkbox;
local v18 = v2.PureComponent:extend("PurchasePromptInteractiveAlert");
v18.validateProps = v4.strictInterface({
    priceInRobux = v4.number, 
    showSaveAsCharacter = v4.optional(v4.boolean), 
    showWearAfterPurchase = v4.boolean, 
    isWearAfterPurchaseChecked = v4.boolean, 
    isSaveAsCharacterChecked = v4.optional(v4.boolean), 
    toggleSaveAsCharacter = v4.optional(v4.callback), 
    toggleWearAfterPurchase = v4.callback, 
    titleText = v4.string, 
    bodyText = v4.string, 
    confirmButtonText = v4.string, 
    onConfirm = v4.callback, 
    onCancel = v4.callback, 
    isLoading = v4.boolean, 
    defaultChildRef = v4.optional(v4.table), 
    isPurchasingOutfit = v4.optional(v4.boolean), 
    screenSize = v4.Vector2
});
v18.init = function(v19)
    v19.checkboxRef = v2.createRef();
end;
v18.renderCheckboxContainer = function(v20, v21)
    local l_showSaveAsCharacter_0 = v20.props.showSaveAsCharacter;
    local l_showWearAfterPurchase_0 = v20.props.showWearAfterPurchase;
    return (l_showSaveAsCharacter_0 or l_showWearAfterPurchase_0) and v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 2
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        WearAfterPurchaseCheckbox = l_showWearAfterPurchase_0 and v2.createElement(l_Checkbox_0, {
            text = if not v20.props.isPurchasingOutfit then v21.wearItemLabel else v21.wearOutfitLabel, 
            isSelected = v20.props.isWearAfterPurchaseChecked, 
            onActivated = v20.props.toggleWearAfterPurchase, 
            layoutOrder = 1, 
            [v2.Ref] = v20.checkboxRef
        }), 
        SaveAsCharacterCheckbox = l_showSaveAsCharacter_0 and v2.createElement(l_Checkbox_0, {
            text = v21.saveAsCharacterLabel, 
            isSelected = v20.props.isSaveAsCharacterChecked, 
            onActivated = v20.props.toggleSaveAsCharacter, 
            layoutOrder = 2, 
            [v2.Ref] = v20.checkboxRef
        })
    });
end;
v18.renderMiddle = function(v24, v25, v26)
    local v27 = v24.props.priceInRobux or "";
    local v28 = v27 == 0;
    local v29 = not v28;
    local l_Font_0 = v25.Font;
    local l_Theme_0 = v25.Theme;
    local v32 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    return v2.createElement(l_Focusable_0[l_FitFrameVertical_0], {
        BackgroundTransparency = 1, 
        width = UDim.new(1, 0), 
        defaultChild = v24.checkboxRef
    }, {
        PriceContainer = not v28 and v2.createElement(l_FitFrameVertical_0, {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            contentPadding = UDim.new(0, 6), 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            margin = l_RoactFitComponents_0.Rect.quad(0, 0, 24, 0), 
            width = UDim.new(1, 0)
        }, {
            PriceLabel = v2.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v26.priceLabel, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v32, 
                LayoutOrder = 0
            }), 
            RobuxContainer = v2.createElement(v12, {
                robuxAmountText = tostring(v27), 
                iconSize = not not v29 and v32 or 0, 
                textSize = v32, 
                padding = 4, 
                showRobuxIcon = v29
            })
        }), 
        CheckboxContainer = v24:renderCheckboxContainer(v26)
    });
end;
v18.renderAlertLocalized = function(v33, v34, v35)
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        inputBindings = {
            SaveAsCharacter = if v33.props.toggleSaveAsCharacter ~= nil then v6.Input.onBegin(Enum.KeyCode.ButtonX, v33.props.toggleSaveAsCharacter, {
                key = "Feature.Avatar.Heading.SaveCostume"
            }) else nil, 
            WearAfterPurchase = v6.Input.onBegin(Enum.KeyCode.ButtonY, v33.props.toggleWearAfterPurchase, {
                key = "Feature.Avatar.Heading.WearConfirmation"
            }), 
            Confirm = v6.Input.onBegin(Enum.KeyCode.ButtonA, function()
            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        PurchasePrompt = v2.createElement(l_InteractiveAlert_0, {
            title = v33.props.titleText, 
            bodyText = v33.props.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v33.props.onCancel, 
                            text = v35.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v33.props.isLoading, 
                            onActivated = v33.props.onConfirm, 
                            text = v33.props.confirmButtonText
                        }, 
                        isDefaultChild = false
                    }
                }
            }, 
            middleContent = function()
                return v33:renderMiddle(v34, v35);
            end, 
            screenSize = v33.props.screenSize, 
            defaultChildRef = v33.props.defaultChildRef, 
            isMiddleContentFocusable = true
        })
    });
end;
v18.render = function(v36)
    return l_withStyle_0(function(v37)
        return l_withLocalization_0({
            priceLabel = "Feature.Catalog.Label.PriceColon", 
            cancelButtonText = "Feature.Catalog.Action.Cancel", 
            saveAsCharacterLabel = "Feature.Catalog.Label.SaveAsCharacter", 
            wearItemLabel = "Feature.Catalog.Label.WearAfterPurchase", 
            wearOutfitLabel = "Feature.Catalog.Label.WearOutfitAfterPurchase"
        })(function(v38)
            return v36:renderAlertLocalized(v37, v38);
        end);
    end);
end;
return (v3.connect(function(v39, _)
    return {
        screenSize = v39.ScreenSize
    };
end, nil)(v18));
