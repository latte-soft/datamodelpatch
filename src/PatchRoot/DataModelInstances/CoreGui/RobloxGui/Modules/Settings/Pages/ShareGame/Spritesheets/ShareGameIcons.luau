local function _(v0, v1)
    return {
        offset = v0, 
        size = v1
    };
end;
local v3 = {
    frames = {
        back = {
            offset = Vector2.new(2, 19), 
            size = Vector2.new(24, 24)
        }, 
        clear = {
            offset = Vector2.new(6, 51), 
            size = Vector2.new(16, 16)
        }, 
        invite = {
            offset = Vector2.new(2, 75), 
            size = Vector2.new(24, 24)
        }, 
        search_border = {
            offset = Vector2.new(11, 1), 
            size = Vector2.new(7, 7)
        }, 
        search_large = {
            offset = Vector2.new(3, 132), 
            size = Vector2.new(22, 22)
        }, 
        search_small = {
            offset = Vector2.new(6, 106), 
            size = Vector2.new(16, 16)
        }, 
        friends = {
            offset = Vector2.new(0, 159), 
            size = Vector2.new(72, 72)
        }, 
        cross = {
            offset = Vector2.new(4, 231), 
            size = Vector2.new(24, 24)
        }, 
        modal_border = {
            offset = Vector2.new(0, 255), 
            size = Vector2.new(7, 7)
        }
    }
};
return {
    GetFrame = function(_, v5)
        return v3.frames[v5];
    end, 
    GetImagePath = function(_)
        return "rbxasset://textures/ui/Settings/ShareGame/icons.png";
    end, 
    ApplyImage = function(v7, v8, v9)
        local l_v7_Frame_0 = v7:GetFrame(v9);
        v8.Image = "rbxasset://textures/ui/Settings/ShareGame/icons.png";
        v8.ImageRectOffset = l_v7_Frame_0.offset;
        v8.ImageRectSize = l_v7_Frame_0.size;
    end
};
