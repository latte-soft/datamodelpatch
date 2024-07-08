local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Otter);
ZoomAnimatedFrame = function(v3)
    local l_isZoomEnabled_0 = v3.isZoomEnabled;
    local v5 = v1.useRef(nil);
    if v5.current == nil then
        v5.current = v2.createSingleMotor(0);
    end;
    assert(v5.current, "zoomMotorRef should always exist; assert only needed for the linter");
    local v6, v7 = v1.useBinding(0);
    v1.useEffect(function()
        v5.current:onStep(v7);
    end, {});
    v1.useEffect(function()
        v5.current:setGoal(v2.spring(not l_isZoomEnabled_0 and 0 or 1, {
            frequency = not v3.reducedMotion and 6.5 or 200
        }));
    end, {
        l_isZoomEnabled_0
    });
    return v1.createElement("Frame", {
        Position = v6:map(function(v8)
            local v9 = v8 > 0.9 and 1 or v8;
            return UDim2.fromOffset((-v3.expansionOffsetX * v9) / 2, -v3.expansionOffsetTop * v9 - (not v3.reducedMotion and 0 or 12 + v3.expansionOffsetX / 2) * v9);
        end), 
        Size = v6:map(function(v10)
            local v11 = v10 > 0.9 and 1 or v10;
            return UDim2.new(1, v3.expansionOffsetX * v11, 1, (v3.expansionOffsetTop * v11 + v3.expansionOffsetBottom * v11) + (not v3.reducedMotion and 0 or 12 + v3.expansionOffsetX) * v11);
        end), 
        BackgroundTransparency = 1
    }, v3.children);
end;
return ZoomAnimatedFrame;
