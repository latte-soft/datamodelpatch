local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local v9 = require(l_Parent_0.Hooks.usePlayerCombinedName);
local v10 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local v11 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local v12 = require(l_RobloxGui_0.Modules.Flags.getIsUserProfileOnLeaderboardEnabled);
local v13 = require(l_Parent_0.Flags.FFlagRefactorPlayerNameTag);
local v14 = v2.PureComponent:extend("PlayerNameTag");
v14.validateProps = v3.strictInterface({
    player = v6, 
    isTitleEntry = v3.boolean, 
    isHovered = v3.boolean, 
    name = if not v13 then nil else v3.string, 
    textStyle = v3.strictInterface({
        Color = v3.Color3, 
        Transparency = v3.number, 
        StrokeColor = v3.optional(v3.Color3), 
        StrokeTransparency = v3.optional(v3.number)
    }), 
    textFont = v3.strictInterface({
        Size = v3.number, 
        MinSize = v3.number, 
        Font = v3.enum(Enum.Font)
    })
});
if not v13 then
    v14.init = function(v15)
        if v12() then
            v15:setState({
                name = v15.props.player.DisplayName
            });
            v10:query({
                query = v11.Queries.userProfilesCombinedNameByUserIds, 
                variables = {
                    userIds = {
                        (tostring(v15.props.player.UserId))
                    }
                }
            }):andThen(function(v16)
                v15:setState({
                    name = v16.data.userProfiles[1].names.combinedName
                });
            end);
        end;
    end;
end;
v14.render = function(v17)
    return l_WithLayoutValues_0(function(v18)
        return v2.createElement("TextLabel", {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(1, -v18.PlayerIconSizeMobile.X.Offset - v18.PlayerNamePaddingXMobile * 2, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v17.props.textFont.Font, 
            TextSize = v17.props.textFont.Size, 
            TextColor3 = v17.props.textStyle.Color, 
            TextTransparency = v17.props.textStyle.Transparency, 
            TextStrokeColor3 = v17.props.textStyle.StrokeColor, 
            TextStrokeTransparency = v17.props.textStyle.StrokeTransparency, 
            BackgroundTransparency = 1, 
            Text = if not v13 then if v12() then v17.state.name else v17.props.player.DisplayName else v17.props.name, 
            TextTruncate = Enum.TextTruncate.AtEnd
        });
    end);
end;
local function v20(v19)
    return v2.createElement(v14, v4.Dictionary.join(v19, {
        name = v9(tostring(v19.player.UserId), v19.player.DisplayName)
    }));
end;
if not v13 then
    return v14;
else
    return v20;
end;
