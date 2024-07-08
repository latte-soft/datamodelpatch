local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_t_0 = v3.t;
local l_UIBlox_0 = v3.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = require(l_Parent_0.Resources.Assets);
local v13 = require(l_Parent_0.Components.ThemedTextLabel);
local v14 = require(l_Parent_0.Components.Connection.FocusHandler);
local v15 = require(l_Parent_0.Components.Connection.RootedConnection);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local v18 = l_Roact_0.PureComponent:extend("LoadingFriendsError");
v18.validateProps = l_t_0.strictInterface({
    onRetry = l_t_0.callback, 
    canCaptureFocus = l_t_0.boolean
});
v18.init = function(v19)
    v19.buttonRef = l_Roact_0.createRef();
    v19.state = {
        buttonIsInitialized = false
    };
end;
v18.render = function(v20)
    local l_props_0 = v20.props;
    return l_withStyle_0(function(v22)
        return v11({
            errorOccured = "CoreScripts.InGameMenu.InviteFriends.ErrorOccured"
        })(function(v23)
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
                    Image = v12.Images.Friends, 
                    Size = UDim2.new(0, 64, 0, 64), 
                    ImageTransparency = 0.5, 
                    LayoutOrder = 1
                }), 
                TextContainer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_TextService_0:GetTextSize(v23.errorOccured, v22.Font.Body.RelativeSize * v22.Font.BaseSize, v22.Font.Body.Font, Vector2.new(304, math.huge)).Y + 36), 
                    LayoutOrder = 2
                }, {
                    Text = l_Roact_0.createElement(v13, {
                        fontKey = "Body", 
                        themeKey = "TextEmphasis", 
                        Text = v23.errorOccured, 
                        Position = UDim2.new(0, 0, 0, 10), 
                        Size = UDim2.new(1, 0, 1, -36), 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true
                    })
                }), 
                RootedConnection = l_Roact_0.createElement(v15, {
                    render = function(v24)
                        return l_Roact_0.createElement(v14, {
                            isFocused = (l_props_0.canCaptureFocus and v20.state.buttonIsInitialized) and v24, 
                            didFocus = function()
                                l_GuiService_0.SelectedCoreObject = v20.buttonRef:getValue();
                            end
                        }, {
                            RetryButton = not not v24 and l_Roact_0.createElement(l_Button_0, {
                                buttonType = l_ButtonType_0.Secondary, 
                                layoutOrder = 3, 
                                size = UDim2.new(1, 0, 0, 48), 
                                icon = v12.Images.RetryIcon, 
                                onActivated = l_props_0.onRetry, 
                                buttonRef = v20.buttonRef, 
                                onStateChanged = function(_, v26)
                                    if not v20.state.buttonIsInitialized and v26 ~= l_ControlState_0.Initialize then
                                        v20:setState({
                                            buttonIsInitialized = true
                                        });
                                    end;
                                end
                            }) or nil
                        });
                    end
                })
            });
        end);
    end);
end;
return v18;
