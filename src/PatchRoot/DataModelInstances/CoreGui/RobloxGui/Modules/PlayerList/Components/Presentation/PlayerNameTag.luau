local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_WithLayoutValues_0 = require(l_Parent_0.Components.Connection.LayoutValues).WithLayoutValues;
local v9 = require(l_Parent_0.Hooks.usePlayerCombinedName);
local v10 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local v11 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local v12 = require(l_RobloxGui_0.Modules.Flags.getIsUserProfileOnLeaderboardEnabled);
local v13 = require(l_Parent_0.Flags.FFlagRefactorPlayerNameTag);
local v14 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local v15 = v3.PureComponent:extend("PlayerNameTag");
v15.validateProps = v4.strictInterface({
    player = v14, 
    isTitleEntry = v4.boolean, 
    isHovered = v4.boolean, 
    layoutOrder = v4.integer, 
    name = if not v13 then nil else v4.string, 
    textStyle = v4.strictInterface({
        Color = v4.Color3, 
        Transparency = v4.number, 
        StrokeColor = v4.optional(v4.Color3), 
        StrokeTransparency = v4.optional(v4.number)
    }), 
    textFont = v4.strictInterface({
        Size = v4.number, 
        MinSize = v4.number, 
        Font = v4.enum(Enum.Font)
    })
});
if not v13 then
    v15.init = function(v16)
        if v12() then
            v16:setState({
                name = v16.props.player.DisplayName
            });
            v11:query({
                query = v10.Queries.userProfilesCombinedNameByUserIds, 
                variables = {
                    userIds = {
                        (tostring(v16.props.player.UserId))
                    }
                }
            }):andThen(function(v17)
                v16:setState({
                    name = v17.data.userProfiles[1].names.combinedName
                });
            end, function()
            end);
        end;
    end;
end;
v15.render = function(v18)
    return l_WithLayoutValues_0(function(v19)
        local l_IconUnSelectedColor_0 = v19.IconUnSelectedColor;
        if v18.props.isHovered then
            l_IconUnSelectedColor_0 = v19.IconSelectedColor;
        end;
        local l_Font_0 = v18.props.textFont.Font;
        local l_Size_0 = v18.props.textFont.Size;
        local l_MinSize_0 = v18.props.textFont.MinSize;
        local v24 = {};
        local l_PlatformName_0 = v18.props.player.PlatformName;
        local v26 = v5.isPlayerVerified(v18.props.player);
        if v19.IsTenFoot and l_PlatformName_0 ~= "" then
            v24.VerticalLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            });
            v24.PlayerPlatformName = v3.createElement("TextLabel", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 0.35, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Font = Enum.Font.SourceSans, 
                TextSize = l_Size_0, 
                TextColor3 = v18.props.textStyle.Color, 
                TextTransparency = v18.props.textStyle.Transparency, 
                TextStrokeColor3 = v18.props.textStyle.StrokeColor, 
                TextStrokeTransparency = v18.props.textStyle.StrokeTransparency, 
                BackgroundTransparency = 1, 
                Text = l_PlatformName_0, 
                LayoutOrder = 2
            });
            v24.RobloxNameFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0.45, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 6)
                }), 
                RobloxIcon = v3.createElement("ImageButton", {
                    Size = UDim2.new(0, 24, 0, 24), 
                    Image = v19.RobloxIconImage, 
                    BackgroundTransparency = 1, 
                    Selectable = false, 
                    ImageColor3 = l_IconUnSelectedColor_0, 
                    LayoutOrder = 1
                }), 
                PlayerNameContainer = v3.createElement(v5.EmojiWrapper, {
                    emoji = not v26 and "" or v5.emoji.verified, 
                    layoutOrder = 2, 
                    mockIsEnrolled = true, 
                    size = UDim2.new(1, -30, 0, 0), 
                    automaticSize = Enum.AutomaticSize.Y, 
                    verticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    PlayerName = v3.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        ClipsDescendants = false, 
                        Size = UDim2.fromScale(0, 1), 
                        Font = l_Font_0, 
                        Text = if not v13 then if v12() then v18.state.name else v18.props.player.Name else v18.props.name, 
                        TextSize = l_Size_0, 
                        TextColor3 = v18.props.textStyle.Color, 
                        TextTransparency = v18.props.textStyle.Transparency, 
                        TextStrokeColor3 = v18.props.textStyle.StrokeColor, 
                        TextStrokeTransparency = v18.props.textStyle.StrokeTransparency, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1
                    })
                })
            });
        else
            v24.PlayerNameContainer = v3.createElement(v5.EmojiWrapper, {
                emoji = not v26 and "" or v5.emoji.verified, 
                anchorPoint = Vector2.new(0, 0.5), 
                position = UDim2.fromScale(0, 0.5), 
                mockIsEnrolled = true, 
                verticalAlignment = Enum.VerticalAlignment.Center, 
                automaticSize = Enum.AutomaticSize.X, 
                size = UDim2.new(0, 0, 0, l_Size_0)
            }, {
                PlayerName = v3.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.fromScale(0, 1), 
                    Font = l_Font_0, 
                    Text = if not v13 then if v12() then v18.state.name else v18.props.player.DisplayName else v18.props.name, 
                    TextSize = l_Size_0, 
                    TextColor3 = v18.props.textStyle.Color, 
                    TextTransparency = v18.props.textStyle.Transparency, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextScaled = true, 
                    TextStrokeColor3 = v18.props.textStyle.StrokeColor, 
                    TextStrokeTransparency = v18.props.textStyle.StrokeTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1
                }, {
                    SizeConstraint = v3.createElement("UITextSizeConstraint", {
                        MaxTextSize = l_Size_0, 
                        MinTextSize = l_MinSize_0
                    })
                })
            });
        end;
        return v3.createElement("Frame", {
            LayoutOrder = v18.props.layoutOrder, 
            Size = v19.PlayerNameSize, 
            BackgroundTransparency = 1
        }, v24);
    end);
end;
local function v28(v27)
    return v3.createElement(v15, v6.Dictionary.join(v27, {
        name = v9(tostring(v27.player.UserId), v27.player.DisplayName)
    }));
end;
if not v13 then
    return v15;
else
    return v28;
end;
