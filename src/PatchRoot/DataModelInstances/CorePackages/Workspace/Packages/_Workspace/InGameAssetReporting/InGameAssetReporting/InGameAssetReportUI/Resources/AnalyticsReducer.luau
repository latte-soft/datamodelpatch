local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local _ = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Types);
local v2 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local l_AnalyticsActions_0 = v2.AnalyticsActions;
return function(v4, v5)
    local v6 = table.clone(v4);
    local l_type_0 = v5.type;
    if l_type_0 == l_AnalyticsActions_0.Reset then
        return v2.AnalyticsInitialState;
    elseif l_type_0 == l_AnalyticsActions_0.SetInteractionType then
        v6.interaction_type = v5.interaction_type;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.SetPlaceId then
        v6.place_id = v5.place_id;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.AccumulateForTimeSpent then
        v6.accumulated_time_ms = v6.accumulated_time_ms + v5.accumulated_time_ms * 1000;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.SetReasonSelection then
        v6.reason_selection = v5.reason_selection;
        v6.reason_change_count = v6.reason_change_count + 1;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.SetCommentAdded then
        v6.comment_added = v5.comment_added;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.IncrementNextCount then
        v6.next_count = v6.next_count + 1;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.IncremementAnnotationCount then
        v6.annotation_place_count = v6.annotation_place_count + 1;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.IncremementAnnotationUndoCount then
        v6.annotation_undo_count = v6.annotation_undo_count + 1;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.IncremementAnnotationRedoCount then
        v6.annotation_redo_count = v6.annotation_redo_count + 1;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.SetExtractionResults then
        local l_results_0 = v5.results;
        v6.annotation_final_count = v5.final_annotation_count;
        v6.avatar_final_count = l_results_0.stats.playersCount;
        v6.image_asset_count = #l_results_0.extractedAssets.Image;
        v6.mesh_asset_count = #l_results_0.extractedAssets.Mesh;
        v6.model_asset_count = #l_results_0.extractedAssets.Model;
        v6.package_asset_count = #l_results_0.extractedAssets.Package;
        v6.final_raycast_target_count = l_results_0.stats.raycastTargetCount;
        v6.final_raycast_completed_count = l_results_0.stats.raycastCompletedCount;
        v6.final_raycast_resumption_count = l_results_0.stats.raycastResumptionCount;
        v6.final_raycast_computation_time_us = l_results_0.stats.raycastComputeTime * 1000000;
        v6.hit_count_map_size = l_results_0.stats.hitCountMapSize;
        v6.top_level_objects_size = l_results_0.stats.topLevelObjectsSize;
        v6.instances_traversed_count = l_results_0.stats.instancesTraversed;
        v6.traversal_task_list_size = l_results_0.stats.traversalTaskListSize;
        v6.traversal_tasks_completed_count = l_results_0.stats.traversalTasksCompleted;
        v6.extraction_resumption_count = l_results_0.stats.resumptionCount;
        v6.extraction_computation_time_us = l_results_0.stats.computeTime * 1000000;
        v6.extraction_wall_time_us = l_results_0.stats.wallTime * 1000000;
        return v6;
    elseif l_type_0 == l_AnalyticsActions_0.SetViewportInformation then
        v6.viewport_size_x = v5.viewport_size_x;
        v6.viewport_size_y = v5.viewport_size_y;
        v6.is_portrait_mode = v5.is_portrait_mode;
        return v6;
    else
        if l_type_0 == l_AnalyticsActions_0.SetDidUserResize then
            v6.did_user_resize = v5.did_user_resize;
        end;
        return v6;
    end;
end;
