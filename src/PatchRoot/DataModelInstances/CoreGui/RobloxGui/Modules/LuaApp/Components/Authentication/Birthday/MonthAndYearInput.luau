local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_TextInputBoxWithBorder_0 = v4.Components.TextInputBoxWithBorder;
local l_AuthStatefulRoundCornerBorder_0 = v4.Components.AuthStatefulRoundCornerBorder;
local v7 = require(l_Modules_0.LuaApp.Components.Authentication.Birthday.MonthDropdown);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
return function(v10)
    local v11 = l_useStyle_0();
    local v12 = l_useLocalization_0({
        Year = "CommonUI.Controls.Label.Year", 
        Birthday = "Authentication.SignUp.Label.Birthday"
    });
    local v13, v14 = v2.useState(0);
    local v15, v16 = v2.useState("");
    local v17, v18 = v2.useState(false);
    local v19, v20 = v2.useState(false);
    local function _()
        if v10.errorText ~= "" then
            return l_AuthStatefulRoundCornerBorder_0.BorderState.Error;
        elseif not v19 then
            return l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
        else
            return l_AuthStatefulRoundCornerBorder_0.BorderState.Focused;
        end;
    end;
    local function v23(v22)
        v14(v22);
        v10.onMonthInputConfirmed();
    end;
    local function v26(_)
        if not v17 then
            v18(true);
        end;
        if not (not v10.textBoxRef or not v10.textBoxRef.current) then
            local l_Text_0 = v10.textBoxRef.current.Text;
            if string.len(l_Text_0) > 2 then
                v10.textBoxRef.current.Text = string.sub(l_Text_0, 1, 2);
            end;
        end;
        v16(v10.textBoxRef.current.Text);
    end;
    local function v27()
        v20(true);
        v10.onFocused();
    end;
    local function v28()
        v20(false);
        v10.onFocusLost();
    end;
    v2.useEffect(function()
        if v17 and v13 > 0 then
            v10.onMonthAndYearChange(v13, (tonumber(v15)));
        end;
    end, {
        v13, 
        v15, 
        v17
    });
    local l_createElement_0 = v2.createElement;
    local v30 = "Frame";
    local v31 = {
        BackgroundTransparency = 1, 
        LayoutOrder = v10.layoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    };
    local v32 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 0)
        }), 
        InputFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, 0)
            }), 
            MonthFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(0.5, -18, 0, v10.textInputHeight + 24), 
                ZIndex = 2
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 2)
                }), 
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 6)
                }), 
                Label = v2.createElement("TextLabel", {
                    Text = v12.Birthday, 
                    Font = v11.Font.CaptionHeader.Font, 
                    TextSize = v11.Font.BaseSize * v11.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v11.Theme.TextEmphasis.Color, 
                    TextTransparency = v11.Theme.TextEmphasis.Transparency, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0
                }), 
                MonthDropdown = v2.createElement(v7, {
                    layoutOrder = 1, 
                    size = UDim2.new(1, 0, 0, v10.textInputHeight), 
                    textInputHeight = v10.textInputHeight, 
                    onMonthSelected = v23, 
                    shouldExpandRight = true, 
                    screenSize = v10.screenSize
                })
            }), 
            Padding = v2.createElement("Frame", {
                Size = UDim2.new(0, 36, 0, v10.textInputHeight + 24), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            YearFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(0.5, -18, 0, v10.textInputHeight + 24)
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 22)
                }), 
                YearInput = v2.createElement(l_TextInputBoxWithBorder_0, {
                    textInputType = Enum.TextInputType.Number, 
                    textInputHeight = v10.textInputHeight, 
                    textInputListPadding = 6, 
                    placeholderText = v12.Year, 
                    borderState = if v10.errorText ~= "" then l_AuthStatefulRoundCornerBorder_0.BorderState.Error else if v19 then l_AuthStatefulRoundCornerBorder_0.BorderState.Focused else l_AuthStatefulRoundCornerBorder_0.BorderState.Default, 
                    onChangeTextCallback = v26, 
                    onFocused = v27, 
                    onFocusLost = v28, 
                    textBoxRef = v10.textBoxRef, 
                    layoutOrder = 2
                })
            })
        })
    };
    local v33 = false;
    if v10.errorText ~= "" then
        v33 = v2.createElement("TextLabel", {
            Text = v10.errorText, 
            Font = v11.Font.CaptionBody.Font, 
            TextSize = v11.Font.BaseSize * v11.Font.CaptionBody.RelativeSize, 
            TextColor3 = v11.Theme.Alert.Color, 
            TextTransparency = v11.Theme.TextDefault.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ZIndex = 0, 
            LayoutOrder = 2
        });
    end;
    v32.ErrorText = v33;
    v32.ValuePropPadding = v2.createElement("Frame", {
        Size = if v10.errorText == "" then UDim2.new(0, 0, 0, 21) else UDim2.new(0, 0, 0, 6), 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    });
    return l_createElement_0(v30, v31, v32);
end;
