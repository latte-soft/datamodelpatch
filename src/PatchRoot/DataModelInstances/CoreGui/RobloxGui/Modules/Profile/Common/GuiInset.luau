local l_t_0 = require(script:FindFirstAncestor("Profile").dependencies).t;
return {
    validate = l_t_0.strictInterface({
        left = l_t_0.numberMin(0), 
        right = l_t_0.numberMin(0), 
        top = l_t_0.numberMin(0), 
        bottom = l_t_0.numberMin(0)
    })
};
