local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v4.Core.ImageSet.ImageSetButton;
local l_MenuDirection_0 = v4.App.Menu.MenuDirection;
local l_ContextualMenu_0 = v4.App.Menu.ContextualMenu;
local l_AuthStatefulRoundCornerBorder_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Components.AuthStatefulRoundCornerBorder;
return function(v13)
    local v14 = l_useStyle_0();
    local v15 = l_useLocalization_0({
        January = "CommonUI.Controls.Label.January", 
        February = "CommonUI.Controls.Label.February", 
        March = "CommonUI.Controls.Label.March", 
        April = "CommonUI.Controls.Label.April", 
        May = "CommonUI.Controls.Label.May", 
        June = "CommonUI.Controls.Label.June", 
        July = "CommonUI.Controls.Label.July", 
        August = "CommonUI.Controls.Label.August", 
        September = "CommonUI.Controls.Label.September", 
        October = "CommonUI.Controls.Label.October", 
        November = "CommonUI.Controls.Label.November", 
        December = "CommonUI.Controls.Label.December", 
        Month = "Authentication.SignUp.Label.Month"
    });
    local v16 = {
        {
            text = v15.January, 
            key = 1
        }, 
        {
            text = v15.February, 
            key = 2
        }, 
        {
            text = v15.March, 
            key = 3
        }, 
        {
            text = v15.April, 
            key = 4
        }, 
        {
            text = v15.May, 
            key = 5
        }, 
        {
            text = v15.June, 
            key = 6
        }, 
        {
            text = v15.July, 
            key = 7
        }, 
        {
            text = v15.August, 
            key = 8
        }, 
        {
            text = v15.September, 
            key = 9
        }, 
        {
            text = v15.October, 
            key = 10
        }, 
        {
            text = v15.November, 
            key = 11
        }, 
        {
            text = v15.December, 
            key = 12
        }
    };
    local v17, v18 = v2.useState(0);
    local v19, v20 = v2.useState(false);
    local function v21()
        v20(not v19);
    end;
    local function _(v22, v23)
        return {
            text = v22, 
            onActivated = function()
                v18(v23);
                v13.onMonthSelected(v23);
                v20(false);
            end, 
            selected = v17 == v23
        };
    end;
    return v2.createElement("Frame", {
        Size = v13.size, 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.layoutOrder, 
        ZIndex = 2
    }, {
        Button = v2.createElement(l_AuthStatefulRoundCornerBorder_0, {
            layoutOrder = 1, 
            size = UDim2.new(1, 0, 0, v13.textInputHeight), 
            borderState = l_AuthStatefulRoundCornerBorder_0.BorderState.Default
        }, {
            Base = v2.createElement(l_ImageSetButton_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Image = "LuaApp/buttons/buttonFill", 
                BackgroundColor3 = v14.Theme.BackgroundUIContrast.Color, 
                BackgroundTransparency = v14.Theme.BackgroundUIContrast.Transparency, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                [v2.Event.Activated] = v21
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 12)
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0), 
                    PaddingBottom = UDim.new(0, 0), 
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                TextLabel = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, -16, 1, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    Text = if v17 > 0 then v16[v17].text else v15.Month, 
                    Font = v14.Font.Body.Font, 
                    TextSize = v14.Font.BaseSize * v14.Font.Body.RelativeSize, 
                    TextColor3 = if not v17 then v14.Theme.UIDefault.Color else v14.Theme.TextDefault.Color, 
                    TextTransparency = v14.Theme.TextDefault.Transparency
                }), 
                ImageLabel = v2.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(1, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = not not v19 and l_Images_0["truncate_arrows/actions_truncationCollapse"] or l_Images_0["truncate_arrows/actions_truncationExpand"], 
                    ImageColor3 = v14.Theme.UIDefault.Color, 
                    ImageTransparency = v14.Theme.UIDefault.Transparency
                })
            })
        }), 
        DropdownMenu = v19 and (function()
            return v2.createElement("Frame", {
                Size = UDim2.new(1.25, 0, 0, 0), 
                AnchorPoint = if not v13.shouldExpandRight then Vector2.new(1, 0) else Vector2.new(0, 0), 
                Position = if not v13.shouldExpandRight then UDim2.new(1, 0, 0, 0) else UDim2.new(0, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                MonthMenu = v2.createElement(l_ContextualMenu_0, {
                    buttonProps = v3.map(v16, function(v25)
                        local l_text_0 = v25.text;
                        local l_key_0 = v25.key;
                        return {
                            text = l_text_0, 
                            onActivated = function()
                                v18(l_key_0);
                                v13.onMonthSelected(l_key_0);
                                v20(false);
                            end, 
                            selected = v17 == l_key_0
                        };
                    end), 
                    open = v19, 
                    menuDirection = l_MenuDirection_0.Down, 
                    screenSize = v13.screenSize, 
                    openPositionY = UDim.new(0, -1 * v13.textInputHeight), 
                    contextMenuWidthOverride = UDim.new(1, 0), 
                    onDismiss = v21
                })
            });
        end)()
    });
end;
