local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local v8 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local function v9()
end;
local v10 = {
    onClose = v9, 
    isButtonDisabled = false, 
    onExtraButtonClick = v9, 
    isExtraButtonDisabled = false
};
local function v18(v11, v12, v13, v14, v15, v16)
    local v17 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v12, 
                text = v11, 
                isDisabled = v13
            }
        }
    };
    if v14 and v14 ~= "" then
        table.insert(v17, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v15, 
                text = v14, 
                isDisabled = v16
            }
        });
    end;
    return {
        buttonHeight = 48, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = v17
    };
end;
return function(v19)
    local v20 = v8(v10, v19);
    local v21 = l_PartialPageModal_0:getMiddleContentWidth(v20.screenSize.X);
    local v22 = {
        titleKey = v20.titleKey, 
        descriptionKey = v20.descriptionKey, 
        buttonKey = v20.buttonKey
    };
    if v20.extraButtonKey and v20.extraButtonKey ~= "" then
        v22.extraButtonKey = v20.extraButtonKey;
    end;
    local v23 = l_useStyle_0();
    local v24 = l_useLocalization_0(v22);
    v24 = {
        titleKey = "Before you leave", 
        descriptionKey = "This experience would be even more exciting with Voice Chat turned on. Unlock now before your next session.", 
        buttonKey = "Unlock voice chat", 
        extraButtonKey = "Leave experience"
    };
    return v2.createElement(l_PartialPageModal_0, {
        title = v24.titleKey, 
        screenSize = v20.screenSize, 
        buttonStackProps = v18(v24.buttonKey, v20.onButtonClick, v20.isButtonDisabled, v24.extraButtonKey, v20.onExtraButtonClick, v20.isExtraButtonDisabled), 
        onCloseClicked = v20.onClose
    }, {
        Middle = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ContentPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 6)
            }), 
            BodyText = v2.createElement("TextLabel", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Text = v24.descriptionKey, 
                TextSize = v23.Font.BaseSize, 
                TextColor3 = v23.Theme.TextDefault.Color, 
                TextTransparency = v23.Theme.TextDefault.Transparency, 
                Font = v23.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Size = UDim2.new(0, v21, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                RichText = true
            })
        })
    });
end;
