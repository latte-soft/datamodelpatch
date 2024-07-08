local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v4 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v5 = require(l_script_FirstAncestor_0.Context.LoginContext);
AuthenticationScreen = function(v6)
    local l_state_0 = v2.useContext(v5).state;
    return v2.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            Text = "AuthenticationScreen", 
            Size = UDim2.new(1, 0, 0, 50), 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.fromRGB(0, 0, 0), 
            TextSize = 24
        }), 
        UserIdentifier = v2.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = "User Identifier: " .. (not not l_state_0 and l_state_0.userIdentifier or ""), 
            Size = UDim2.new(1, 0, 0, 50), 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.fromRGB(0, 0, 0), 
            TextSize = 24
        }), 
        UserIdentifierType = v2.createElement("TextLabel", {
            LayoutOrder = 3, 
            Text = "ID type: " .. (not not l_state_0 and l_state_0.userIdentifierType or ""), 
            Size = UDim2.new(1, 0, 0, 50), 
            BackgroundTransparency = 1, 
            TextColor3 = Color3.fromRGB(0, 0, 0), 
            TextSize = 24
        }), 
        Button = v2.createElement("TextButton", {
            LayoutOrder = 2, 
            Text = "Navigate to Login", 
            Size = UDim2.new(0, 200, 0, 50), 
            BackgroundColor3 = Color3.fromRGB(255, 0, 0), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            [v2.Event.Activated] = function()
                v6.navigation.navigate(v4.LoginScreenV2);
            end
        })
    });
end;
return AuthenticationScreen;
