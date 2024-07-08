local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useSelector_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.useNavigation;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.dependencyArray;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local v11 = UDim.new(0, 24);
local v12 = UDim.new(0, 12);
local function v14(v13)
    return v13.ScreenSize;
end;
return function(v15)
    local v16 = l_useStyle_0();
    local v17 = l_useNavigation_0();
    local v18 = l_useSelector_0(v14);
    local v19 = l_useLocalization_0({
        title = "Feature.VirtualEvents.EnableNotificationsModalTitle", 
        body = "Feature.VirtualEvents.EnableNotificationsModalBody", 
        notNow = "Feature.VirtualEvents.NotNowButton", 
        getNotified = "Feature.VirtualEvents.GetNotifiedButton"
    });
    local v20 = v1.useCallback(function()
        if v15.onClose then
            v15.onClose();
        end;
        v17.goBack();
    end, l_dependencyArray_0(v15.onClose, v17));
    return v1.createElement(l_PartialPageModal_0, {
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5), 
        title = v19.title, 
        screenSize = v18, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v20, 
                        text = v19.notNow
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v1.useCallback(function()
                            if v15.onConfirm then
                                v15.onConfirm();
                            end;
                            v20();
                        end, l_dependencyArray_0(v15.onConfirm, v20)), 
                        text = v19.getNotified
                    }
                }
            }
        }, 
        contentPadding = v11, 
        onCloseClicked = v20
    }, {
        Wrapper = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = v12
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingTop = v12 + v12, 
                PaddingBottom = v12
            }), 
            Body = v1.createElement(l_StyledTextLabel_0, {
                text = v19.body, 
                textXAlignment = Enum.TextXAlignment.Center, 
                fontStyle = v16.Font.Body, 
                colorStyle = v16.Theme.TextMuted, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                fluidSizing = false
            })
        })
    });
end;
