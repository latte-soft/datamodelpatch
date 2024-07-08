local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Common.TextKeys);
local v3 = require(l_Parent_0.dependencies);
local v4 = require(l_Parent_0.Analytics.Enums.EventNames);
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local v8 = require(l_Parent_0.Flags.DiscoverabilityUpsellNonPrefillDiscoverableUserIdsWhitelist);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Checkbox_0 = l_UIBlox_0.App.InputButton.Checkbox;
local l_RadioButtonList_0 = l_UIBlox_0.App.InputButton.RadioButtonList;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local v18 = {
    ["1"] = "Discoverable", 
    ["2"] = "NotDiscoverable", 
    ["nil"] = "Unset"
};
return function(v19)
    local l_prefillDiscoverabilitySetting_0 = v19.prefillDiscoverabilitySetting;
    if not (not l_Players_0.LocalPlayer or not v8.isWhitelistedUserId(l_Players_0.LocalPlayer.UserId)) then
        l_prefillDiscoverabilitySetting_0 = false;
    end;
    local v21, v22 = l_React_0.useState(if not l_prefillDiscoverabilitySetting_0 then nil else 1);
    local v23 = l_useStyle_0();
    local l_Font_0 = v23.Font;
    local l_Theme_0 = v23.Theme;
    local v26 = l_useLocalization_0({
        optInText = v2.DISCOVERABILITY_OPT_IN, 
        infoText = v2.DISCOVERABILITY_INFO, 
        learnMoreText = v2.LEARN_MORE, 
        continueText = v2.CONTINUE, 
        yesText = v2.YES_OPT_IN, 
        noText = v2.NO_OPT_OUT, 
        titleText = v2.DISCOVERABILITY_TITLE, 
        titleTextPrefillDiscoverable = v2.DISCOVERABILITY_TITLE_PREFILL_DISCOVERABLE, 
        optInTextPrefillDiscoverable = v2.DISCOVERABILITY_OPT_IN_PREFILL_DISCOVERABLE, 
        infoTextPrefillDiscoverable = v2.DISCOVERABILITY_INFO_PREFILL_DISCOVERABLE
    });
    local function v28(v27)
        v19.analytics.fireAnalyticsEvent(v4.DiscoverabilityModalRadioButtonClick, {
            selected = v18[tostring(v27)]
        });
        v22(v27);
    end;
    local function v29()
        v19.onActivated(v18[tostring(v21)]);
    end;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    if not l_prefillDiscoverabilitySetting_0 then
        v30 = v26.titleText;
        v31 = 24;
        v32 = l_React_0.createElement(l_StyledTextLabel_0, {
            text = v26.optInText, 
            fontStyle = l_Font_0.Body, 
            colorStyle = l_Theme_0.TextDefault, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Left, 
            textYAlignment = Enum.TextYAlignment.Top, 
            layoutOrder = 1
        });
        v33 = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            RadioButtonList = l_React_0.createElement(l_RadioButtonList_0, {
                radioButtons = {
                    {
                        label = v26.yesText
                    }, 
                    {
                        label = v26.noText
                    }
                }, 
                elementSize = UDim2.new(1, 0, 0, 50), 
                onActivated = v28, 
                initialValue = v21, 
                padding = UDim.new(0, 0), 
                layoutOrder = 1
            })
        });
        v34 = v26.infoText;
        v35 = l_Theme_0.TextEmphasis.Color;
    else
        local function v37()
            local v36 = v21 == 1 and 2 or 1;
            v19.analytics.fireAnalyticsEvent(v4.DiscoverabilityModalRadioButtonClick, {
                selected = v18[tostring(v36)]
            });
            v22(v36);
        end;
        v30 = v26.titleTextPrefillDiscoverable;
        v31 = 12;
        v32 = l_React_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/graphic/findfriends_xlarge"], 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            Size = UDim2.fromOffset(l_IconSize_0.XLarge, l_IconSize_0.XLarge), 
            Position = UDim2.fromScale(0.5, 0.5), 
            LayoutOrder = 1
        });
        v33 = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, 8), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 24)
            }), 
            Checkbox = l_React_0.createElement(l_Checkbox_0, {
                text = "", 
                onActivated = v37, 
                isSelected = v21 == 1, 
                layoutOrder = 1
            }), 
            CheckboxLabel = l_React_0.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Size = UDim2.fromScale(1, 0), 
                Text = v26.optInTextPrefillDiscoverable, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 2, 
                [l_React_0.Event.Activated] = v37
            })
        });
        v34 = v26.infoTextPrefillDiscoverable;
        v35 = l_Theme_0.TextLink.Color;
    end;
    return l_React_0.createElement(l_PartialPageModal_0, {
        title = v30, 
        screenSize = v19.screenSize, 
        onCloseClicked = function()
            v19.onCloseClicked(v18[tostring(v21)]);
        end, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v29, 
                        text = v26.continueText
                    }
                }
            }, 
            buttonHeight = 48, 
            marginBetween = 6, 
            forcedFillDirection = Enum.FillDirection.Vertical
        }
    }, {
        ViewContainer = l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v31), 
                PaddingBottom = UDim.new(0, 36)
            }), 
            Header = v32, 
            Selector = v33, 
            Description = l_React_0.createElement(l_StyledTextLabel_0, {
                text = v34, 
                fontStyle = l_Font_0.CaptionBody, 
                colorStyle = l_Theme_0.TextDefault, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Top, 
                layoutOrder = 3
            }), 
            LearnMore = l_React_0.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.CaptionBody.Font, 
                Size = UDim2.fromScale(1, 0), 
                Text = v26.learnMoreText, 
                TextColor3 = v35, 
                TextSize = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 4, 
                [l_React_0.Event.Activated] = v19.onLearnMoreClick
            })
        })
    });
end;
