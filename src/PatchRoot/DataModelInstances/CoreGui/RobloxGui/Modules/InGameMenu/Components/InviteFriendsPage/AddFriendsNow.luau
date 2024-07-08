local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_UIBlox_0 = v3.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v12 = require(l_Parent_0.Localization.withLocalization);
local v13 = require(l_Parent_0.Resources.Assets);
local v14 = require(l_Parent_0.Components.ThemedTextLabel);
local v15 = require(l_Parent_0.Components.Connection.FocusHandler);
local v16 = require(l_Parent_0.Components.Connection.RootedConnection);
local v17 = require(l_Parent_0.Actions.SetCurrentPage);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local v20 = l_Roact_0.PureComponent:extend("AddFriendsNow");
v20.validateProps = l_t_0.strictInterface({
    switchToPlayers = l_t_0.callback, 
    canCaptureFocus = l_t_0.boolean
});
v20.init = function(v21)
    v21.buttonRef = l_Roact_0.createRef();
    v21.state = {
        buttonIsInitialized = false
    };
end;
v20.render = function(v22)
    local l_props_0 = v22.props;
    return l_withStyle_0(function(v24)
        return v12({
            noFriendsText = "CoreScripts.InGameMenu.InviteFriends.NoFriends", 
            makeFriendsNow = "CoreScripts.InGameMenu.InviteFriends.MakeFriendsNow"
        })(function(v25)
            return l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 304, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v13.Images.AddFriend, 
                    Size = UDim2.new(0, 64, 0, 64), 
                    ImageTransparency = 0.5, 
                    LayoutOrder = 1
                }), 
                TextContainer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_TextService_0:GetTextSize(v25.noFriendsText, v24.Font.Body.RelativeSize * v24.Font.BaseSize, v24.Font.Body.Font, Vector2.new(304, math.huge)).Y + 20), 
                    LayoutOrder = 2
                }, {
                    Text = l_Roact_0.createElement(v14, {
                        fontKey = "Body", 
                        themeKey = "TextEmphasis", 
                        Text = v25.noFriendsText, 
                        Position = UDim2.new(0, 0, 0, 4), 
                        Size = UDim2.new(1, 0, 1, -20), 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true
                    })
                }), 
                RootedConnection = l_Roact_0.createElement(v16, {
                    render = function(v26)
                        return l_Roact_0.createElement(v15, {
                            isFocused = (l_props_0.canCaptureFocus and v22.state.buttonIsInitialized) and v26, 
                            didFocus = function()
                                l_GuiService_0.SelectedCoreObject = v22.buttonRef:getValue();
                            end
                        }, {
                            MakeFriendsButton = not not v26 and l_Roact_0.createElement(l_Button_0, {
                                buttonType = l_ButtonType_0.Secondary, 
                                layoutOrder = 3, 
                                size = UDim2.new(1, 0, 0, 48), 
                                text = v25.makeFriendsNow, 
                                onActivated = l_props_0.switchToPlayers, 
                                buttonRef = v22.buttonRef, 
                                onStateChanged = function(_, v28)
                                    if not v22.state.buttonIsInitialized and v28 ~= l_ControlState_0.Initialize then
                                        v22:setState({
                                            buttonIsInitialized = true
                                        });
                                    end;
                                end
                            }) or nil
                        });
                    end
                }), 
                MakeFriendsButton = l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    layoutOrder = 3, 
                    size = UDim2.new(1, 0, 0, 48), 
                    text = v25.makeFriendsNow, 
                    onActivated = l_props_0.switchToPlayers
                })
            });
        end);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v29)
    return {
        switchToPlayers = function()
            v29(v17("Players"));
        end
    };
end)(v20);
