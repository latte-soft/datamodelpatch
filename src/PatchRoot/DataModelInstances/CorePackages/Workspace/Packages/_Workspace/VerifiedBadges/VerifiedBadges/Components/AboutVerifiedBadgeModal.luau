local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedBadges");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.constants);
local v7 = UDim.new(0, 24);
local v8 = UDim.new(0, 12);
local function v10(v9)
    return v9.ScreenSize;
end;
return function(v11)
    local v12 = v3.Core.Style.useStyle();
    local v13 = l_useSelector_0(v10);
    local v14 = l_useLocalization_0({
        titleText = "Feature.ProfileBadges.VerifiedBadgeInfoTitle", 
        bodyText = "Feature.ProfileBadges.VerifiedBadgeInfo", 
        learnMoreText = "Feature.ProfileBadges.VerifiedBadgeInfoLink"
    });
    return v2.createElement(v3.App.Dialog.Modal.PartialPageModal, {
        title = v14.titleText, 
        screenSize = v13, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = v3.App.Button.Enum.ButtonType.PrimarySystem, 
                    props = {
                        onActivated = v2.useCallback(function()
                            if v11.onConfirm then
                                v11.onConfirm();
                            end;
                        end, {
                            v11
                        }), 
                        text = v14.learnMoreText
                    }
                }
            }
        }, 
        contentPadding = v7, 
        onCloseClicked = v2.useCallback(function()
            if v11.onClose then
                v11.onClose();
            end;
        end, {
            v11
        })
    }, {
        Wrapper = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = v8
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingTop = v8, 
                PaddingBottom = v8
            }), 
            Icon = v2.createElement(v3.App.Text.StyledTextLabel, {
                layoutOrder = 1, 
                text = v6.VERIFIED_EMOJI, 
                fontStyle = v12.Font.Title, 
                colorStyle = v12.Theme.TextEmphasis, 
                automaticSize = Enum.AutomaticSize.XY, 
                fluidSizing = false
            }), 
            Body = v2.createElement(v3.App.Text.StyledTextLabel, {
                layoutOrder = 2, 
                text = v14.bodyText, 
                fontStyle = v12.Font.Body, 
                colorStyle = v12.Theme.TextMuted, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                fluidSizing = false
            })
        })
    });
end;
