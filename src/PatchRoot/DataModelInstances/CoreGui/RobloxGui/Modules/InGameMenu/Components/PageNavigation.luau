local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Otter_0 = v0.Otter;
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_UIBlox_0 = v0.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v10 = require(l_Parent_0.Actions.SetCurrentPage);
local v11 = require(script.Parent.Pages);
local v12 = require(script.Parent.ThemedTextLabel);
local v13 = require(script.Parent.Divider);
local v14 = require(l_Parent_0.Localization.withLocalization);
local v15 = require(l_Parent_0.Utility.divideTransparency);
local v16 = require(l_Parent_0.Utility.SendAnalytics);
local v17 = require(l_Parent_0.Resources.Constants);
local v18 = l_Roact_0.PureComponent:extend("NavigationButton");
v18.init = function(v19, v20)
    local v21 = not v20.selected and 0 or 1;
    local v22, v23 = l_Roact_0.createBinding(v21);
    v19.fillSize = v22:map(function(v24)
        return UDim2.new(v24, 0, 1, 0);
    end);
    local v25, v26 = l_Roact_0.createBinding(0);
    v19.hoverTransparency = v25;
    v19.setHoverTransparency = v26;
    v19.motor = l_Otter_0.createGroupMotor({
        fillProgress = v21, 
        hoverTransparency = 0
    });
    v19.motor:onStep(function(v27)
        v23(v27.fillProgress);
        v19.setHoverTransparency(v27.hoverTransparency);
    end);
    v19:setState({
        hovering = false, 
        pressing = false
    });
end;
v18.renderWithSelectionCursor = function(v28, v29)
    local l_props_0 = v28.props;
    return v14({
        text = l_props_0.text
    })(function(v31)
        return l_withStyle_0(function(v32)
            local v33 = v28.state.pressing and not l_props_0.selected;
            local v34 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if not v28.state.pressing then
                if v28.state.hovering then
                    v34 = v32.Theme.BackgroundOnHover;
                end;
            else
                v34 = v32.Theme.BackgroundOnPress;
            end;
            return l_Roact_0.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = v34.Transparency, 
                BackgroundColor3 = v34.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = l_props_0.LayoutOrder, 
                Size = UDim2.new(1, 0, 0, 70), 
                Text = "", 
                SelectionImageObject = v29(l_CursorKind_0.Square), 
                [l_Roact_0.Event.Activated] = l_props_0.onActivated, 
                [l_Roact_0.Ref] = l_props_0.LayoutOrder == 1 and l_props_0.mainPageFirstButtonRef or nil, 
                [l_Roact_0.Event.MouseEnter] = function()
                    v28:setState({
                        hovering = true
                    });
                end, 
                [l_Roact_0.Event.MouseLeave] = function()
                    v28:setState({
                        hovering = false, 
                        pressing = false
                    });
                end, 
                [l_Roact_0.Event.InputBegan] = function(_, v36)
                    if not (v36.UserInputType ~= Enum.UserInputType.MouseButton1) or v36.UserInputType == Enum.UserInputType.Touch then
                        v28:setState({
                            pressing = true
                        });
                    end;
                end, 
                [l_Roact_0.Event.InputEnded] = function(_, v38)
                    if not (v38.UserInputType ~= Enum.UserInputType.MouseButton1) or v38.UserInputType == Enum.UserInputType.Touch then
                        v28:setState({
                            pressing = false
                        });
                    end;
                end
            }, {
                ContentContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    ZIndex = 3, 
                    BackgroundTransparency = 1
                }, {
                    Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = l_props_0.image, 
                        ImageColor3 = v32.Theme.IconEmphasis.Color, 
                        ImageTransparency = v15(v32.Theme.IconEmphasis.Transparency, not v33 and 1 or 2), 
                        Position = UDim2.new(0, 28, 0.5, 0), 
                        Size = UDim2.new(0, 36, 0, 36), 
                        ZIndex = 3
                    }), 
                    Text = l_Roact_0.createElement(v12, {
                        fontKey = "Header1", 
                        themeKey = "TextEmphasis", 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 80, 0.5, 0), 
                        Size = UDim2.new(1, -104, 1, 0), 
                        Text = v31.text, 
                        TextTransparency = v15(v32.Theme.TextEmphasis.Transparency, not v33 and 1 or 2), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        ZIndex = 3
                    })
                }), 
                SelectedFill = l_Roact_0.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = v28.fillSize, 
                    BackgroundColor3 = v32.Theme.BackgroundMuted.Color, 
                    ZIndex = 2
                })
            });
        end);
    end);
end;
v18.render = function(v39)
    return l_withSelectionCursorProvider_0(function(v40)
        return v39:renderWithSelectionCursor(v40);
    end);
end;
v18.didUpdate = function(v41)
    v41.motor:setGoal({
        fillProgress = l_Otter_0.spring(not v41.props.selected and 0 or 1, {
            frequency = 2.5
        }), 
        hoverTransparency = l_Otter_0.spring(not v41.state.hovering and 0 or 1, {
            frequency = 5
        })
    });
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v42, _)
    return {
        currentPage = v42.menuPage
    };
end, function(v44)
    return {
        setCurrentPage = function(v45)
            v44(v10(v45));
            v16("open_" .. v45 .. "_tab", v17.AnalyticsMenuActionName, {});
        end
    };
end)(function(v46)
    local v47 = {
        Layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        })
    };
    local v48 = #v11.pagesByIndex;
    local v49 = 1;
    for v50, v51 in ipairs(v11.pagesByIndex) do
        if v51.parentPage == v17.MainPagePageKey then
            v47["Page" .. v51.key] = l_Roact_0.createElement(v18, {
                image = v51.icon, 
                LayoutOrder = v49, 
                selected = v46.currentPage == v51.key, 
                text = v51.title, 
                onActivated = function()
                    v46.setCurrentPage(v51.key);
                end, 
                mainPageFirstButtonRef = v49 == 1 and v46.mainPageFirstButtonRef or nil
            });
            v49 = v49 + 1;
            if v50 < v48 then
                v47["Divider" .. v49] = l_Roact_0.createElement(v13, {
                    LayoutOrder = v49, 
                    Size = UDim2.new(1, -24, 0, 1)
                });
                v49 = v49 + 1;
            end;
        end;
    end;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = v46.Position, 
        Size = UDim2.new(1, -v17.Zone.ContentOffset, 0, v48 * 70 + (v48 - 1))
    }, v47);
end);
