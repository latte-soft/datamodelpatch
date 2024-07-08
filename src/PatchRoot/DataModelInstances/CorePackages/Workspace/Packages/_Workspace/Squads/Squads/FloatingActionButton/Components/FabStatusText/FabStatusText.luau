local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.FloatingActionButton.Common.Enums);
local v2 = require(l_script_FirstAncestor_0.FloatingActionButton.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v3.React;
local l_UIBlox_0 = v3.UIBlox;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
return function(v9)
    local v10 = l_useStyle_0();
    local l_Theme_0 = v10.Theme;
    local l_Font_0 = v10.Font;
    local v13 = l_useLocalization_0({
        letsPlayTitle = "Feature.Squads.Label.LetsPlay", 
        gameInviteTitle = {
            "Feature.Squads.Label.LetsPlayWithUser"; 
            username = not v9.inviter and "" or v9.inviter.name
        }, 
        gamePendingTitle = "Feature.Squads.Label.PreparingExperience", 
        pickAnExperienceDesc = "Feature.Squads.Action.PickAnExperience", 
        joinedTheSquadDesc = "Feature.Squads.Label.JoinedTheSquad"
    });
    local v16 = l_React_0.useCallback(function()
        local l_squadState_0 = v9.squadState;
        local v15 = "";
        if l_squadState_0 == v1.SquadState.Idle.rawValue() then
            return v13.letsPlayTitle;
        elseif not (l_squadState_0 == v1.SquadState.GameInvite.rawValue()) or not v9.inviter then
            if l_squadState_0 == v1.SquadState.GamePending.rawValue() then
                return v13.gamePendingTitle;
            else
                if not (not (l_squadState_0 == v1.SquadState.UserJoin.rawValue()) or not v9.joinedUser) then
                    v15 = v9.joinedUser.name;
                end;
                return v15;
            end;
        else
            return v13.gameInviteTitle;
        end;
    end, l_dependencyArray_0(v13, v9.squadState, v9.inviter, v9.joinedUser));
    local v19 = l_React_0.useCallback(function()
        local l_squadState_1 = v9.squadState;
        local v18 = "";
        if l_squadState_1 == v1.SquadState.Idle.rawValue() then
            return v13.pickAnExperienceDesc;
        elseif not (l_squadState_1 == v1.SquadState.GameInvite.rawValue()) or not v9.experienceName then
            if not (l_squadState_1 == v1.SquadState.GamePending.rawValue()) or not v9.experienceName then
                if not (not (l_squadState_1 == v1.SquadState.UserJoin.rawValue()) or not v9.joinedUser) then
                    v18 = v13.joinedTheSquadDesc;
                end;
                return v18;
            else
                return v9.experienceName;
            end;
        else
            return v9.experienceName;
        end;
    end, l_dependencyArray_0(v13, v9.squadState, v9.experienceName));
    local v20, v21 = l_React_0.useState(v16());
    local v22, v23 = l_React_0.useState(v19());
    l_React_0.useEffect(function()
        v21(v16());
        v23(v19());
    end, l_dependencyArray_0(v16, v19));
    return l_React_0.createElement("Frame", {
        Size = v9.size, 
        BackgroundTransparency = 1, 
        SizeConstraint = Enum.SizeConstraint.RelativeXY
    }, {
        Title = l_React_0.createElement("TextLabel", {
            Text = v20, 
            Font = l_Font_0.CaptionHeader.Font, 
            TextColor3 = l_Theme_0.TextMuted.Color, 
            TextTransparency = l_Theme_0.TextMuted.Transparency, 
            TextSize = v2.TITLE_TEXT_SIZE, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, v2.TITLE_TEXT_SIZE), 
            LayoutOrder = 1, 
            BackgroundTransparency = 1
        }), 
        Description = l_React_0.createElement("TextLabel", {
            Text = v22, 
            Font = l_Font_0.Header1.Font, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextSize = v2.DESCRIPTION_TEXT_SIZE, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, v2.DESCRIPTION_TEXT_SIZE), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }), 
        Layout = l_React_0.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v2.STATUSTEXT_LAYOUT_PADDING)
        })
    });
end;
