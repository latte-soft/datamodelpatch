local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Thunks_0 = l_Parent_0.Thunks;
local l_Utility_0 = l_Parent_0.Utility;
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Utility_0.GetSegmentFromPosition);
local v9 = require(l_Actions_0.FocusSegment);
local v10 = require(l_Actions_0.HideMenu);
local v11 = require(l_Thunks_0.PlayEmote);
local v12 = v1.PureComponent:extend("EmotesButtons");
local function _(v13, v14)
    local v15 = v13.AbsoluteSize.X / 2;
    local v16 = v15 * v7.InnerCircleSizeRatio;
    local v17 = false;
    if v16 < v14.Magnitude then
        v17 = v14.Magnitude < v15;
    end;
    return v17;
end;
local function v26(v19, v20)
    local v21 = (Vector2.new(v20.Position.X, v20.Position.Y) - v19.AbsolutePosition) - v19.AbsoluteSize / 2;
    v21 = Vector2.new(v21.X, -v21.Y);
    local l_v21_0 = v21;
    local v23 = v19.AbsoluteSize.X / 2;
    local v24 = v23 * v7.InnerCircleSizeRatio;
    local v25 = false;
    if v24 < l_v21_0.Magnitude then
        v25 = l_v21_0.Magnitude < v23;
    end;
    if v25 then
        return v8(v21);
    else
        return 0;
    end;
end;
local function _(v27)
    if #v27 == 0 then
        return ;
    else
        return v27[math.random(1, #v27)];
    end;
end;
local function _(v29)
    return v7.EmotesImage:format(v29);
end;
v12.render = function(v31)
    local l_currentEmotes_0 = v31.props.emotesPage.currentEmotes;
    local l_emotesInfo_0 = v31.props.emotesPage.emotesInfo;
    local v34 = {};
    for v35, v36 in pairs(l_currentEmotes_0) do
        local v37 = l_emotesInfo_0[v36];
        if v7.EmotesPerPage < v35 then
            warn("EmotesMenu: Number of emotes in page exceeds max emotes per page");
            break;
        else
            local v38 = (360 / v7.EmotesPerPage) * (v35 - 1) + v7.SegmentsStartRotation;
            local v39 = v7.InnerCircleSizeRatio / 2;
            local v40 = ((1 - v7.InnerCircleSizeRatio) / 2 - v7.SlotNumberSize) - v7.ImageOutsidePadding;
            local v41 = (v40 / 2 + v7.SlotNumberSize) - v7.ImageOutsidePadding / 2;
            local v42 = math.cos((math.rad(v38)));
            local v43 = (0.5 + v39 * v42) + v41 * v42;
            local v44 = math.sin((math.rad(v38)));
            v34[v35] = v1.createElement("ImageLabel", {
                Image = v7.EmotesImage:format(if #v37 == 0 then nil else v37[math.random(1, #v37)]), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(v43, 0, (0.5 + v39 * v44) + v41 * v44, 0), 
                Size = UDim2.new(v40, 0, v40, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                })
            });
        end;
    end;
    return v1.createElement("TextButton", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        Text = "", 
        [v1.Event.InputChanged] = function(v45, v46)
            local l_UserInputType_0 = v46.UserInputType;
            if not (l_UserInputType_0 ~= Enum.UserInputType.MouseMovement) or l_UserInputType_0 == Enum.UserInputType.Touch then
                local v48 = v26(v45, v46);
                if v48 == v31.props.emotesWheel.focusedSegmentIndex then
                    return ;
                elseif not v31.props.emotesPage.currentEmotes[v48] then
                    v31.props.focusSegment(0);
                else
                    v31.props.focusSegment(v48);
                    return ;
                end;
            end;
        end, 
        [v1.Event.Activated] = function(v49, v50)
            local v51 = v26(v49, v50);
            if v51 == 0 then
                v31.props.hideMenu();
                return ;
            else
                local v52 = v31.props.emotesPage.currentEmotes[v51];
                if v52 then
                    local v53 = v31.props.emotesPage.emotesInfo[v52];
                    if v53 then
                        v31.props.playEmote(v52, v51, if #v53 == 0 then nil else v53[math.random(1, #v53)]);
                        return ;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end;
        end, 
        [v1.Event.MouseLeave] = function()
            v31.props.focusSegment(0);
        end
    }, v34);
end;
return v2.connect(function(v54)
    return {
        displayOptions = v54.displayOptions, 
        emotesPage = v54.emotesPage, 
        emotesWheel = v54.emotesWheel
    };
end, function(v55)
    return {
        playEmote = function(v56, v57, v58)
            return v55(v11(v56, v57, v58));
        end, 
        focusSegment = function(v59)
            return v55(v9(v59));
        end, 
        hideMenu = function()
            return v55(v10());
        end
    };
end)(v12);
