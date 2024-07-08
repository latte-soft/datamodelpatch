local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.AssetCardComponents.AssetCard);
local v5 = require(script.Parent.PlayButton);
local v6 = require(script.Parent.ViewDetailsButton);
local v7 = v2.PureComponent:extend("GameCard");
v7.defaultProps = {
    playText = "Play", 
    viewDetailsText = "View Details", 
    noDescriptionText = "Placeholder: No Description", 
    gameName = nil, 
    gameIcon = nil, 
    gameDescription = nil, 
    contentLoadedCallback = nil, 
    bodyActivated = nil, 
    playabilityStatus = nil, 
    conversationId = nil, 
    universeId = nil, 
    placeId = nil, 
    price = nil, 
    eventStream = nil, 
    playButtonActivated = nil, 
    viewDetailsActivated = nil
};
v7.makeButtons = function(v8, _)
    if v8.props.playabilityStatus then
        local l_isPlayable_0 = v8.props.playabilityStatus.isPlayable;
        if not v8.props.isLoading then
            if l_isPlayable_0 == true then
                return {
                    playButton = v2.createElement(v5, {
                        placeId = v8.props.placeId, 
                        universeId = v8.props.universeId, 
                        text = v8.props.playText, 
                        conversationId = v8.props.conversationId, 
                        onActivated = function()
                            v8.props.onPlayButtonActivated(v8.props);
                        end, 
                        eventStream = v8.props.eventStream
                    })
                };
            else
                return {
                    viewDetails = v2.createElement(v6, {
                        text = v8.props.viewDetailsText, 
                        onActivated = function()
                            v8.props.openDetails(v8.props);
                        end, 
                        eventStream = v8.props.eventStream
                    })
                };
            end;
        else
            return {
                loading = v2.createElement(v3.App.Loading.ShimmerPanel, {
                    Size = UDim2.new(1, 0, 0, 32), 
                    cornerRadius = UDim.new(0, 4)
                })
            };
        end;
    else
        return ;
    end;
end;
v7.render = function(v11)
    return v3.Style.withStyle(function(v12)
        if not v11.props.universeId then
            return v2.createElement(v4, {
                cardTitle = v11.props.gameName or "", 
                cardBodyText = v11.props.gameDescription or "", 
                cardIcon = v11.props.gameIcon or "", 
                isLoading = true
            }, {
                fill = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 32)
                })
            });
        else
            local v13 = nil;
            if v11.props.gameDescription then
                v13 = v11.props.gameDescription:gsub("%s", " ");
                if v13:gsub("^%s+$", "") == "" then
                    v13 = v11.props.noDescriptionText;
                end;
            end;
            return v2.createElement(v4, {
                isLoading = v11.props.isLoading, 
                cardTitle = v11.props.gameName, 
                cardBodyText = v13, 
                cardIcon = v11.props.gameIcon, 
                contentLoadedCallback = v11.props.contentLoadedCallback, 
                shouldUseUnfilteredUI = v11.props.shouldUseUnfilteredUI, 
                bodyActivated = function()
                    v11.props.openDetails(v11.props);
                end
            }, v11:makeButtons(v12));
        end;
    end);
end;
return v7;
