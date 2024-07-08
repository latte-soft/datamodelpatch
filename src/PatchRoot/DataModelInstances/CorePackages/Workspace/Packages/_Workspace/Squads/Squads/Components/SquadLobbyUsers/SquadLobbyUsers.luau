local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v8 = require(l_script_FirstAncestor_0.Components.SquadLobbyUserCard.SquadLobbyUserCard);
return function(v9)
    local v10, v11 = l_React_0.useState(0);
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        [l_React_0.Change.AbsoluteSize] = l_React_0.useCallback(function(v12)
            v11(v12.AbsoluteSize.X);
        end, l_dependencyArray_0(v11))
    }, (l_React_0.useMemo(function()
        local l_users_0 = v9.users;
        local v14 = {};
        if v10 == 0 then
            return nil;
        else
            local v15 = math.floor(((v10 - 48) + 24) / (v6.SQUAD_LOBBY_USER_CARD_SIZE.X + 24));
            local v16 = ((v10 - 48) - v15 * v6.SQUAD_LOBBY_USER_CARD_SIZE.X) / (v15 - 1);
            for v17, v18 in ipairs(l_users_0) do
                v14["UserCard" .. v17] = l_Roact_0.createElement(v8, {
                    user = v18, 
                    layoutOrder = v17
                });
            end;
            return l_llama_0.Dictionary.join(v14, {
                UIGridLayout = l_Roact_0.createElement("UIGridLayout", {
                    CellPadding = UDim2.new(0, v16, 0, 24), 
                    CellSize = UDim2.fromOffset(v6.SQUAD_LOBBY_USER_CARD_SIZE.X, v6.SQUAD_LOBBY_USER_CARD_SIZE.Y), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                UIPadding = l_Roact_0.createElement("UIPadding", {
                    PaddingBottom = v9.paddingBottom
                })
            });
        end;
    end, l_dependencyArray_0(v9.paddingBottom, v9.users, v10))));
end;
