local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.FitChildren);
local v7 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v10 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v11 = require(l_Modules_0.LuaApp.Enum.UserGender);
local v12 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaLoginGenderSelector);
local v16 = UDim2.new(0.64, 0, 0.64, 0);
local v17 = v2.PureComponent:extend("SignUpGenderSelector");
v17.defaultProps = {
    size = UDim2.new(1, 0, 0, 48)
};
v17.init = function(v18)
    v18.state = {
        gender = v11.Unknown, 
        hoverRight = false, 
        hoverLeft = false
    };
    v18.isMounted = false;
    v18.onGenderSelected = function(v19)
        spawn(function()
            if v19 == v11.Male then
                v18.props.analytics.reportButtonClicked(v12.Context.SinglePageSignUpScreen, v12.Button.GenderMale);
            else
                v18.props.analytics.reportButtonClicked(v12.Context.SinglePageSignUpScreen, v12.Button.GenderFemale);
            end;
            if v18.isMounted then
                if v18.state.gender == v19 then
                    v19 = v11.Unknown;
                end;
                v18:setState({
                    gender = v19
                });
                if v18.props.onGenderChanged then
                    v18.props.onGenderChanged(v19);
                end;
            end;
        end);
    end;
    v18.isSelectedGenderMale = function()
        return v18.state.gender == v11.Male;
    end;
    v18.isSelectedGenderFemale = function()
        return v18.state.gender == v11.Female;
    end;
    v18.onMouseEnterRight = function()
        if v18.isMounted then
            v18:setState({
                hoverRight = true
            });
        end;
    end;
    v18.onMouseLeaveRight = function()
        if v18.isMounted then
            v18:setState({
                hoverRight = false
            });
        end;
    end;
    v18.onMouseEnterLeft = function()
        if v18.isMounted then
            v18:setState({
                hoverLeft = true
            });
        end;
    end;
    v18.onMouseLeaveLeft = function()
        if v18.isMounted then
            v18:setState({
                hoverLeft = false
            });
        end;
    end;
end;
v17.didMount = function(v20)
    v20.isMounted = true;
end;
v17.willUnmount = function(v21)
    v21.isMounted = false;
end;
v17.render = function(v22)
    local l_layoutOrder_0 = v22.props.layoutOrder;
    local l_size_0 = v22.props.size;
    return l_withStyle_0(function(v25)
        local v26 = (not not v22.isSelectedGenderMale() and v25.Theme.UIEmphasis.Color or v22.state.hoverRight and v25.Theme.BackgroundMuted.Color) or v25.Theme.BackgroundContrast.Color;
        local v27 = (not not v22.isSelectedGenderFemale() and v25.Theme.UIEmphasis.Color or v22.state.hoverLeft and v25.Theme.BackgroundMuted.Color) or v25.Theme.BackgroundContrast.Color;
        return v5({
            titleText = v15() == 1 and "Authentication.SignUp.Label.OptionalGender" or "Authentication.SignUp.Label.Gender"
        })(function(v28)
            return v2.createElement(v6.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v6.FitAxis.Height, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 5), 
                    PaddingBottom = UDim.new(0, 5)
                }), 
                Title = v28.titleText and v2.createElement(v7, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v6.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    Text = v28.titleText or "", 
                    TextWrapped = true, 
                    Font = v25.Font.CaptionHeader.Font, 
                    TextSize = v25.Font.BaseSize * v25.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v25.Theme.TextEmphasis.Color, 
                    TextTransparency = v25.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Frame = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    Size = l_size_0, 
                    BackgroundTransparency = 1
                }, {
                    Boundary = v2.createElement(l_ImageSetLabel_0, {
                        ZIndex = 3, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(9, 9, 9, 9), 
                        Image = l_GetImageData_0("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke", 
                        ImageColor3 = v25.Theme.SecondaryDefault.Color
                    }), 
                    BackgroundImage = v2.createElement(l_ImageSetLabel_0, {
                        ZIndex = 1, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(9, 9, 9, 9), 
                        Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
                        ImageColor3 = v25.Theme.SecondaryDefault.Color
                    }, {
                        UIListLayout2 = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 1)
                        }), 
                        Left = v2.createElement(v10, {
                            LayoutOrder = 1, 
                            Size = UDim2.new(0.5, 0, 1, 0), 
                            AutoButtonColor = false, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(7, 8, 7, 8), 
                            ClipsDescendants = true, 
                            Image = "LuaApp/buttons/buttonLeftFill", 
                            ImageColor3 = v27, 
                            ImageTransparency = 0, 
                            [v2.Event.Activated] = function()
                                v22.onGenderSelected(v11.Female);
                            end, 
                            [v2.Event.MouseEnter] = v22.onMouseEnterLeft, 
                            [v2.Event.MouseLeave] = v22.onMouseLeaveLeft
                        }, {
                            LeftIcon = v2.createElement(l_ImageSetLabel_0, {
                                LayoutOrder = 1, 
                                Size = v16, 
                                BorderSizePixel = 0, 
                                ScaleType = Enum.ScaleType.Fit, 
                                Position = UDim2.new(0.5, 0, 0.5, 0), 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                ClipsDescendants = true, 
                                Image = if not v22.isSelectedGenderFemale() then l_GetImageData_0("LuaApp/icons/gender_female") or "LuaApp/icons/gender_female" else l_GetImageData_0("LuaApp/icons/gender_female_selected") or "LuaApp/icons/gender_female_selected", 
                                ImageTransparency = v25.Theme.BackgroundUIDefault.Transparency, 
                                BackgroundTransparency = 1
                            })
                        }), 
                        Right = v2.createElement(v10, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(0.5, -1, 1, 0), 
                            AutoButtonColor = false, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            ScaleType = Enum.ScaleType.Slice, 
                            SliceCenter = Rect.new(1, 8, 1, 8), 
                            ClipsDescendants = true, 
                            Image = "LuaApp/buttons/buttonRightFill", 
                            ImageColor3 = v26, 
                            ImageTransparency = 0, 
                            [v2.Event.Activated] = function()
                                v22.onGenderSelected(v11.Male);
                            end, 
                            [v2.Event.MouseEnter] = v22.onMouseEnterRight, 
                            [v2.Event.MouseLeave] = v22.onMouseLeaveRight
                        }, {
                            RightIcon = v2.createElement(l_ImageSetLabel_0, {
                                LayoutOrder = 1, 
                                Size = v16, 
                                BorderSizePixel = 0, 
                                ScaleType = Enum.ScaleType.Fit, 
                                Position = UDim2.new(0.5, 0, 0.5, 0), 
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                ClipsDescendants = true, 
                                Image = if not v22.isSelectedGenderMale() then l_GetImageData_0("LuaApp/icons/gender_male") or "LuaApp/icons/gender_male" else l_GetImageData_0("LuaApp/icons/gender_male_selected") or "LuaApp/icons/gender_male_selected", 
                                ImageTransparency = v25.Theme.BackgroundUIDefault.Transparency, 
                                BackgroundTransparency = 1
                            })
                        })
                    })
                })
            });
        end);
    end);
end;
return (l_RoactServices_0.connect({
    analytics = v13
})(v17));
