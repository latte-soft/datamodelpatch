local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_t_0 = v0.t;
local l_Text_0 = v0.Text;
local l_memoize_0 = v0.memoize;
local v4 = l_t_0.interface({
    text = l_t_0.string, 
    font = l_t_0.interface({
        Font = l_t_0.Font, 
        RelativeSize = l_t_0.number
    }), 
    baseSize = l_t_0.number
});
return function()
    return l_memoize_0(function(v5, v6, v7)
        assert(v4({
            text = v5, 
            font = v6, 
            baseSize = v7
        }));
        return l_Text_0.GetTextBounds(v5, v6.Font, v6.RelativeSize * v7, Vector2.new(10000, 10000));
    end);
end;
