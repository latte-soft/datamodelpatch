local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_DateTime_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateTime;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v7 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v8 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v4.Style.withStyle;
local v10 = require(l_Modules_0.LuaApp.Enum.DevSubStatus);
local v11 = require(l_Modules_0.LuaApp.Enum.DevSubPlanStatus);
local v12 = v3.PureComponent:extend("DevSubListItem");
local v13 = {
    TOP = 15, 
    LEFT = 24, 
    RIGHT = 25
};
v12.defaultProps = {
    layoutOrder = 0
};
v12.getRenewalText = function(_, v15, v16)
    if not v15.isAutoRenewing then
        return v16.expirationDate;
    else
        return v16.renewalDate;
    end;
end;
v12.render = function(v17)
    local l_devSub_0 = v17.props.devSub;
    local l_Values_0 = l_DateTime_0.fromIsoDate(l_devSub_0.expirationDate):GetValues();
    local v20 = string.format("%d/%d/%d", l_Values_0.Month, l_Values_0.Day, l_Values_0.Year);
    return v8({
        monthlyPrice = {
            "Feature.DevSubs.UserManagement.MonthlyPrice"; 
            robuxAmount = l_devSub_0.price
        }, 
        renewalDate = {
            "Feature.DevSubs.Label.RenewalDate"; 
            date = v20
        }, 
        expirationDate = {
            "Feature.DevSubs.Label.ExpirationDate"; 
            date = v20
        }, 
        discontinueDate = {
            "Feature.DevSubs.Label.DiscontinueDate"; 
            date = v20
        }
    })(function(v21)
        return l_withStyle_0(function(v22)
            local l_props_0 = v17.props;
            local l_devSub_1 = l_props_0.devSub;
            local l_layoutOrder_0 = l_props_0.layoutOrder;
            local l_maxSize_0 = l_props_0.maxSize;
            local l_hasFullDivider_0 = l_props_0.hasFullDivider;
            local l_onActivated_0 = l_props_0.onActivated;
            local v29 = nil;
            local v30 = nil;
            if not l_hasFullDivider_0 then
                v29 = UDim2.new(1, v13.RIGHT, 0, 1);
                v30 = UDim2.new(0, 0, 0, -v13.TOP);
            else
                v29 = UDim2.new(1, v13.LEFT + v13.RIGHT, 0, 1);
                v30 = UDim2.new(0, -v13.LEFT, 0, -v13.TOP);
            end;
            local v31 = nil;
            if not l_devSub_1.isAutoRenewing then
                v31 = {
                    Font = v22.Font.CaptionHeader.Font, 
                    TextSize = v22.Font.BaseSize * v22.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v22.Theme.TextEmphasis.Color, 
                    TextTransparency = v22.Theme.TextEmphasis.Transparency, 
                    Text = v21.expirationDate
                };
                if l_devSub_1.planStatus ~= "Open" then
                    v31.Text = v21.discontinueDate;
                end;
            else
                v31 = {
                    Font = v22.Font.CaptionBody.Font, 
                    TextSize = v22.Font.BaseSize * v22.Font.CaptionBody.RelativeSize, 
                    TextColor3 = v22.Theme.TextDefault.Color, 
                    TextTransparency = v22.Theme.TextDefault.Transparency, 
                    Text = v21.renewalDate
                };
            end;
            local l_createElement_0 = v3.createElement;
            local v33 = "Frame";
            local v34 = {
                Size = UDim2.new(1, 0, 0, l_maxSize_0.Y), 
                LayoutOrder = l_layoutOrder_0, 
                BackgroundTransparency = 1
            };
            local v35 = {
                SizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = l_maxSize_0
                }), 
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v13.TOP), 
                    PaddingLeft = UDim.new(0, v13.LEFT), 
                    PaddingRight = UDim.new(0, v13.RIGHT)
                })
            };
            local l_createElement_1 = v3.createElement;
            local l_v7_0 = v7;
            local v38 = {
                Image = "LuaApp/icons/navbar_more", 
                AnchorPoint = Vector2.new(1, 0), 
                Size = UDim2.new(0, 26, 0, 26), 
                Position = UDim2.new(1, 0, 0, 18), 
                BackgroundTransparency = 1
            };
            local v39 = false;
            if l_devSub_1.status == v10.Active then
                v39 = l_devSub_1.planStatus == v11.Open;
            end;
            v38.Visible = v39;
            v38[v3.Event.Activated] = function(v40)
                l_onActivated_0(v40.AbsolutePosition, v40.AbsoluteSize);
            end;
            v35.MoreButton = l_createElement_1(l_v7_0, v38);
            v35.TextFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -(v13.RIGHT + 26), 1, 0)
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                Title = v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 22), 
                    LayoutOrder = 1, 
                    Font = v22.Font.Header2.Font, 
                    TextSize = v22.Font.BaseSize * v22.Font.Header2.RelativeSize, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor3 = v22.Theme.TextDefault.Color, 
                    TextTransparency = v22.Theme.TextDefault.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Text = l_devSub_1.name
                }), 
                PriceFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 17), 
                    LayoutOrder = 2
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    Icon = v3.createElement(v6, {
                        BackgroundTransparency = 1, 
                        Image = "LuaApp/icons/robux-hex", 
                        Size = UDim2.new(0, 17, 0, 17), 
                        LayoutOrder = 1
                    }), 
                    Text = v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -21, 1, 0), 
                        LayoutOrder = 2, 
                        Font = v22.Font.CaptionBody.Font, 
                        TextSize = v22.Font.BaseSize * v22.Font.CaptionBody.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v22.Theme.TextDefault.Color, 
                        TextTransparency = v22.Theme.TextDefault.Transparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Text = l_devSub_1.price
                    })
                }), 
                RenewalDate = v3.createElement("TextLabel", v5.Dictionary.join(v31, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 17), 
                    LayoutOrder = 3, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }))
            });
            v35.Divider = v3.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundColor3 = v22.Theme.Divider.Color, 
                BackgroundTransparency = v22.Theme.Divider.Transparency, 
                Size = v29, 
                Position = v30
            });
            return l_createElement_0(v33, v34, v35);
        end);
    end);
end;
return v12;
