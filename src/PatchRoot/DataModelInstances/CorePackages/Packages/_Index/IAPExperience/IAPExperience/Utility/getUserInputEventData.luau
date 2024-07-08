return function(v0, v1, v2, v3, v4)
    local l_v2_0 = v2;
    if v1 then
        l_v2_0 = v1 .. l_v2_0;
    end;
    return {
        purchase_flow_uuid = v0, 
        purchase_flow = l_v2_0, 
        view_name = v3, 
        purchase_event_type = "UserInput", 
        input_type = v4
    };
end;
