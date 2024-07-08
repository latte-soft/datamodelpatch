local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UiModeStyleProvider_0 = v1.UiModeStyleProvider;
local v4 = require(script.Parent.mockLocale);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_RadioButtonList_0 = l_UIBlox_0.App.InputButton.RadioButtonList;
local l_RoactRodux_0 = v1.RoactRodux;
local l_Rodux_0 = v1.Rodux;
local v10 = require(l_Parent_0.ApolloClient);
local l_mockApolloClient_0 = require(l_Parent_0.GraphQLServer).ApolloClientTestUtils.mockApolloClient;
local function v17(v12)
    local v13 = {
        "Dark", 
        "Light"
    };
    local v15 = {
        radioButtonList = l_Roact_0.createElement(l_RadioButtonList_0, {
            radioButtons = v13, 
            onActivated = function(v14)
                v12.updateStyle(v13[v14]);
            end, 
            initialValue = table.find(v13, v12.styleName) or 1, 
            elementSize = UDim2.new(1, 0, 0, 40)
        })
    };
    return l_UIBlox_0.Style.withStyle(function(v16)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            sideBar = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(0, v12.width, 1, 0), 
                BackgroundColor3 = v16.Theme.BackgroundDefault.Color, 
                LayoutOrder = 1
            }, v15), 
            viewPort = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, -v12.width, 1, 0), 
                BackgroundColor3 = Color3.fromRGB(222, 255, 255), 
                LayoutOrder = 2
            }, v12[l_Roact_0.Children])
        });
    end);
end;
local function v20()
    return (l_Rodux_0.Store.new(function(v18, v19)
        if v19.type == "receivedStyle" then
            return {
                style = v19.style
            };
        else
            return v18;
        end;
    end, {
        InvisibleMode = {
            NetworkStatus = {
                byUserId = {}
            }
        }, 
        style = "Light"
    }, {
        l_Rodux_0.thunkMiddleware
    }));
end;
local v25 = l_RoactRodux_0.connect(function(v21)
    return {
        styleName = v21.style
    };
end, function(v22)
    return {
        updateStyle = function(v23)
            return v22({
                type = "receivedStyle", 
                style = v23
            });
        end
    };
end)(function(v24)
    return l_Roact_0.createElement(l_UiModeStyleProvider_0, {
        style = {
            themeName = v24.styleName
        }
    }, {
        viewportWithSidebar = l_Roact_0.createElement(v17, {
            width = v24.sideBarWidth, 
            updateStyle = v24.updateStyle, 
            styleName = v24.styleName
        }, {
            Story = l_Roact_0.createElement(v24.story)
        })
    });
end);
return function()
    return function(v26, v27)
        local v28 = l_Roact_0.mount(v4((l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = v20()
        }, {
            l_Roact_0.createElement(v10.ApolloProvider, {
                client = l_mockApolloClient_0({})
            }, {
                container = l_Roact_0.createElement(v25, {
                    story = v26, 
                    sideBarWidth = 100
                })
            })
        }))), v27, "StoryRoot");
        return function()
            l_Roact_0.unmount(v28);
        end;
    end;
end;
