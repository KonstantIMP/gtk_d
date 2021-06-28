module shumate.c.functions;

import std.stdio;
import shumate.c.types;
import linker.loader;

version (Windows)
	static immutable LIBRARY_SHUMATE = ["libshumate-0.0-0.dll;shumate-0.0-0.dll;shumate-0.dll"];
else version (OSX)
	static immutable LIBRARY_SHUMATE = ["libshumate-0.0.0.dylib"];
else
	static immutable LIBRARY_SHUMATE = ["libshumate-0.0.so.0"];

shared static this()
{
	// shumate.Coordinate

	Linker.link(shumate_coordinate_get_type, "shumate_coordinate_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_coordinate_new, "shumate_coordinate_new", LIBRARY_SHUMATE);
	Linker.link(shumate_coordinate_new_full, "shumate_coordinate_new_full", LIBRARY_SHUMATE);

	// shumate.FileCache

	Linker.link(shumate_file_cache_get_type, "shumate_file_cache_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_new_full, "shumate_file_cache_new_full", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_get_cache_dir, "shumate_file_cache_get_cache_dir", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_get_cache_key, "shumate_file_cache_get_cache_key", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_get_size_limit, "shumate_file_cache_get_size_limit", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_get_tile_async, "shumate_file_cache_get_tile_async", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_get_tile_finish, "shumate_file_cache_get_tile_finish", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_mark_up_to_date, "shumate_file_cache_mark_up_to_date", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_purge_cache_async, "shumate_file_cache_purge_cache_async", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_purge_cache_finish, "shumate_file_cache_purge_cache_finish", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_set_size_limit, "shumate_file_cache_set_size_limit", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_store_tile_async, "shumate_file_cache_store_tile_async", LIBRARY_SHUMATE);
	Linker.link(shumate_file_cache_store_tile_finish, "shumate_file_cache_store_tile_finish", LIBRARY_SHUMATE);

	// shumate.Layer

	Linker.link(shumate_layer_get_type, "shumate_layer_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_layer_get_viewport, "shumate_layer_get_viewport", LIBRARY_SHUMATE);

	// shumate.License

	Linker.link(shumate_license_get_type, "shumate_license_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_license_new, "shumate_license_new", LIBRARY_SHUMATE);
	Linker.link(shumate_license_append_map_source, "shumate_license_append_map_source", LIBRARY_SHUMATE);
	Linker.link(shumate_license_get_extra_text, "shumate_license_get_extra_text", LIBRARY_SHUMATE);
	Linker.link(shumate_license_get_xalign, "shumate_license_get_xalign", LIBRARY_SHUMATE);
	Linker.link(shumate_license_prepend_map_source, "shumate_license_prepend_map_source", LIBRARY_SHUMATE);
	Linker.link(shumate_license_remove_map_source, "shumate_license_remove_map_source", LIBRARY_SHUMATE);
	Linker.link(shumate_license_set_extra_text, "shumate_license_set_extra_text", LIBRARY_SHUMATE);
	Linker.link(shumate_license_set_xalign, "shumate_license_set_xalign", LIBRARY_SHUMATE);

	// shumate.Location

	Linker.link(shumate_location_get_type, "shumate_location_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_location_get_latitude, "shumate_location_get_latitude", LIBRARY_SHUMATE);
	Linker.link(shumate_location_get_longitude, "shumate_location_get_longitude", LIBRARY_SHUMATE);
	Linker.link(shumate_location_set_location, "shumate_location_set_location", LIBRARY_SHUMATE);

	// shumate.MapLayer

	Linker.link(shumate_map_layer_get_type, "shumate_map_layer_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_map_layer_new, "shumate_map_layer_new", LIBRARY_SHUMATE);

	// shumate.MapSource

	Linker.link(shumate_map_source_get_type, "shumate_map_source_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_fill_tile_async, "shumate_map_source_fill_tile_async", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_fill_tile_finish, "shumate_map_source_fill_tile_finish", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_column_count, "shumate_map_source_get_column_count", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_id, "shumate_map_source_get_id", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_latitude, "shumate_map_source_get_latitude", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_license, "shumate_map_source_get_license", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_license_uri, "shumate_map_source_get_license_uri", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_longitude, "shumate_map_source_get_longitude", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_max_zoom_level, "shumate_map_source_get_max_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_meters_per_pixel, "shumate_map_source_get_meters_per_pixel", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_min_zoom_level, "shumate_map_source_get_min_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_name, "shumate_map_source_get_name", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_projection, "shumate_map_source_get_projection", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_row_count, "shumate_map_source_get_row_count", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_tile_size, "shumate_map_source_get_tile_size", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_x, "shumate_map_source_get_x", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_get_y, "shumate_map_source_get_y", LIBRARY_SHUMATE);

	// shumate.MapSourceRegistry

	Linker.link(shumate_map_source_registry_get_type, "shumate_map_source_registry_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_registry_new, "shumate_map_source_registry_new", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_registry_new_with_defaults, "shumate_map_source_registry_new_with_defaults", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_registry_add, "shumate_map_source_registry_add", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_registry_get_by_id, "shumate_map_source_registry_get_by_id", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_registry_populate_defaults, "shumate_map_source_registry_populate_defaults", LIBRARY_SHUMATE);
	Linker.link(shumate_map_source_registry_remove, "shumate_map_source_registry_remove", LIBRARY_SHUMATE);

	// shumate.Marker

	Linker.link(shumate_marker_get_type, "shumate_marker_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_new, "shumate_marker_new", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_animate_in, "shumate_marker_animate_in", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_animate_in_with_delay, "shumate_marker_animate_in_with_delay", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_animate_out, "shumate_marker_animate_out", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_animate_out_with_delay, "shumate_marker_animate_out_with_delay", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_get_child, "shumate_marker_get_child", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_get_draggable, "shumate_marker_get_draggable", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_get_selectable, "shumate_marker_get_selectable", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_is_selected, "shumate_marker_is_selected", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_set_child, "shumate_marker_set_child", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_set_draggable, "shumate_marker_set_draggable", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_set_selectable, "shumate_marker_set_selectable", LIBRARY_SHUMATE);

	// shumate.MarkerLayer

	Linker.link(shumate_marker_layer_get_type, "shumate_marker_layer_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_new, "shumate_marker_layer_new", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_new_full, "shumate_marker_layer_new_full", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_add_marker, "shumate_marker_layer_add_marker", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_animate_in_all_markers, "shumate_marker_layer_animate_in_all_markers", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_animate_out_all_markers, "shumate_marker_layer_animate_out_all_markers", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_get_markers, "shumate_marker_layer_get_markers", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_get_selected, "shumate_marker_layer_get_selected", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_get_selection_mode, "shumate_marker_layer_get_selection_mode", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_hide_all_markers, "shumate_marker_layer_hide_all_markers", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_remove_all, "shumate_marker_layer_remove_all", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_remove_marker, "shumate_marker_layer_remove_marker", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_select_all_markers, "shumate_marker_layer_select_all_markers", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_select_marker, "shumate_marker_layer_select_marker", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_set_all_markers_draggable, "shumate_marker_layer_set_all_markers_draggable", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_set_all_markers_undraggable, "shumate_marker_layer_set_all_markers_undraggable", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_set_selection_mode, "shumate_marker_layer_set_selection_mode", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_show_all_markers, "shumate_marker_layer_show_all_markers", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_unselect_all_markers, "shumate_marker_layer_unselect_all_markers", LIBRARY_SHUMATE);
	Linker.link(shumate_marker_layer_unselect_marker, "shumate_marker_layer_unselect_marker", LIBRARY_SHUMATE);

	// shumate.MemoryCache

	Linker.link(shumate_memory_cache_get_type, "shumate_memory_cache_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_memory_cache_new_full, "shumate_memory_cache_new_full", LIBRARY_SHUMATE);
	Linker.link(shumate_memory_cache_clean, "shumate_memory_cache_clean", LIBRARY_SHUMATE);
	Linker.link(shumate_memory_cache_get_size_limit, "shumate_memory_cache_get_size_limit", LIBRARY_SHUMATE);
	Linker.link(shumate_memory_cache_set_size_limit, "shumate_memory_cache_set_size_limit", LIBRARY_SHUMATE);
	Linker.link(shumate_memory_cache_store_texture, "shumate_memory_cache_store_texture", LIBRARY_SHUMATE);
	Linker.link(shumate_memory_cache_try_fill_tile, "shumate_memory_cache_try_fill_tile", LIBRARY_SHUMATE);

	// shumate.NetworkTileSource

	Linker.link(shumate_network_tile_source_get_type, "shumate_network_tile_source_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_new_full, "shumate_network_tile_source_new_full", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_get_max_conns, "shumate_network_tile_source_get_max_conns", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_get_offline, "shumate_network_tile_source_get_offline", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_get_proxy_uri, "shumate_network_tile_source_get_proxy_uri", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_get_uri_format, "shumate_network_tile_source_get_uri_format", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_set_max_conns, "shumate_network_tile_source_set_max_conns", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_set_offline, "shumate_network_tile_source_set_offline", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_set_proxy_uri, "shumate_network_tile_source_set_proxy_uri", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_set_uri_format, "shumate_network_tile_source_set_uri_format", LIBRARY_SHUMATE);
	Linker.link(shumate_network_tile_source_set_user_agent, "shumate_network_tile_source_set_user_agent", LIBRARY_SHUMATE);

	// shumate.PathLayer

	Linker.link(shumate_path_layer_get_type, "shumate_path_layer_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_new, "shumate_path_layer_new", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_add_node, "shumate_path_layer_add_node", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_closed, "shumate_path_layer_get_closed", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_dash, "shumate_path_layer_get_dash", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_fill, "shumate_path_layer_get_fill", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_fill_color, "shumate_path_layer_get_fill_color", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_nodes, "shumate_path_layer_get_nodes", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_outline_color, "shumate_path_layer_get_outline_color", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_outline_width, "shumate_path_layer_get_outline_width", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_stroke, "shumate_path_layer_get_stroke", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_stroke_color, "shumate_path_layer_get_stroke_color", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_get_stroke_width, "shumate_path_layer_get_stroke_width", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_insert_node, "shumate_path_layer_insert_node", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_remove_all, "shumate_path_layer_remove_all", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_remove_node, "shumate_path_layer_remove_node", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_closed, "shumate_path_layer_set_closed", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_dash, "shumate_path_layer_set_dash", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_fill, "shumate_path_layer_set_fill", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_fill_color, "shumate_path_layer_set_fill_color", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_outline_color, "shumate_path_layer_set_outline_color", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_outline_width, "shumate_path_layer_set_outline_width", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_stroke, "shumate_path_layer_set_stroke", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_stroke_color, "shumate_path_layer_set_stroke_color", LIBRARY_SHUMATE);
	Linker.link(shumate_path_layer_set_stroke_width, "shumate_path_layer_set_stroke_width", LIBRARY_SHUMATE);

	// shumate.Point

	Linker.link(shumate_point_get_type, "shumate_point_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_point_new, "shumate_point_new", LIBRARY_SHUMATE);

	// shumate.Scale

	Linker.link(shumate_scale_get_type, "shumate_scale_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_scale_new, "shumate_scale_new", LIBRARY_SHUMATE);
	Linker.link(shumate_scale_get_max_width, "shumate_scale_get_max_width", LIBRARY_SHUMATE);
	Linker.link(shumate_scale_get_unit, "shumate_scale_get_unit", LIBRARY_SHUMATE);
	Linker.link(shumate_scale_get_viewport, "shumate_scale_get_viewport", LIBRARY_SHUMATE);
	Linker.link(shumate_scale_set_max_width, "shumate_scale_set_max_width", LIBRARY_SHUMATE);
	Linker.link(shumate_scale_set_unit, "shumate_scale_set_unit", LIBRARY_SHUMATE);
	Linker.link(shumate_scale_set_viewport, "shumate_scale_set_viewport", LIBRARY_SHUMATE);

	// shumate.Tile

	Linker.link(shumate_tile_get_type, "shumate_tile_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_new, "shumate_tile_new", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_new_full, "shumate_tile_new_full", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_etag, "shumate_tile_get_etag", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_fade_in, "shumate_tile_get_fade_in", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_modified_time, "shumate_tile_get_modified_time", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_size, "shumate_tile_get_size", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_state, "shumate_tile_get_state", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_texture, "shumate_tile_get_texture", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_x, "shumate_tile_get_x", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_y, "shumate_tile_get_y", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_get_zoom_level, "shumate_tile_get_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_etag, "shumate_tile_set_etag", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_fade_in, "shumate_tile_set_fade_in", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_modified_time, "shumate_tile_set_modified_time", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_size, "shumate_tile_set_size", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_state, "shumate_tile_set_state", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_texture, "shumate_tile_set_texture", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_x, "shumate_tile_set_x", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_y, "shumate_tile_set_y", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_set_zoom_level, "shumate_tile_set_zoom_level", LIBRARY_SHUMATE);

	// shumate.TileSource

	Linker.link(shumate_tile_source_get_type, "shumate_tile_source_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_source_set_id, "shumate_tile_source_set_id", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_source_set_license, "shumate_tile_source_set_license", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_source_set_license_uri, "shumate_tile_source_set_license_uri", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_source_set_max_zoom_level, "shumate_tile_source_set_max_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_source_set_min_zoom_level, "shumate_tile_source_set_min_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_source_set_name, "shumate_tile_source_set_name", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_source_set_projection, "shumate_tile_source_set_projection", LIBRARY_SHUMATE);
	Linker.link(shumate_tile_source_set_tile_size, "shumate_tile_source_set_tile_size", LIBRARY_SHUMATE);

	// shumate.View

	Linker.link(shumate_view_get_type, "shumate_view_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_view_new, "shumate_view_new", LIBRARY_SHUMATE);
	Linker.link(shumate_view_new_simple, "shumate_view_new_simple", LIBRARY_SHUMATE);
	Linker.link(shumate_view_add_layer, "shumate_view_add_layer", LIBRARY_SHUMATE);
	Linker.link(shumate_view_add_overlay_source, "shumate_view_add_overlay_source", LIBRARY_SHUMATE);
	Linker.link(shumate_view_center_on, "shumate_view_center_on", LIBRARY_SHUMATE);
	Linker.link(shumate_view_get_animate_zoom, "shumate_view_get_animate_zoom", LIBRARY_SHUMATE);
	Linker.link(shumate_view_get_go_to_duration, "shumate_view_get_go_to_duration", LIBRARY_SHUMATE);
	Linker.link(shumate_view_get_overlay_sources, "shumate_view_get_overlay_sources", LIBRARY_SHUMATE);
	Linker.link(shumate_view_get_state, "shumate_view_get_state", LIBRARY_SHUMATE);
	Linker.link(shumate_view_get_viewport, "shumate_view_get_viewport", LIBRARY_SHUMATE);
	Linker.link(shumate_view_get_zoom_on_double_click, "shumate_view_get_zoom_on_double_click", LIBRARY_SHUMATE);
	Linker.link(shumate_view_go_to, "shumate_view_go_to", LIBRARY_SHUMATE);
	Linker.link(shumate_view_insert_layer_above, "shumate_view_insert_layer_above", LIBRARY_SHUMATE);
	Linker.link(shumate_view_insert_layer_behind, "shumate_view_insert_layer_behind", LIBRARY_SHUMATE);
	Linker.link(shumate_view_remove_layer, "shumate_view_remove_layer", LIBRARY_SHUMATE);
	Linker.link(shumate_view_remove_overlay_source, "shumate_view_remove_overlay_source", LIBRARY_SHUMATE);
	Linker.link(shumate_view_set_animate_zoom, "shumate_view_set_animate_zoom", LIBRARY_SHUMATE);
	Linker.link(shumate_view_set_go_to_duration, "shumate_view_set_go_to_duration", LIBRARY_SHUMATE);
	Linker.link(shumate_view_set_map_source, "shumate_view_set_map_source", LIBRARY_SHUMATE);
	Linker.link(shumate_view_set_zoom_on_double_click, "shumate_view_set_zoom_on_double_click", LIBRARY_SHUMATE);
	Linker.link(shumate_view_stop_go_to, "shumate_view_stop_go_to", LIBRARY_SHUMATE);

	// shumate.Viewport

	Linker.link(shumate_viewport_get_type, "shumate_viewport_get_type", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_new, "shumate_viewport_new", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_get_max_zoom_level, "shumate_viewport_get_max_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_get_min_zoom_level, "shumate_viewport_get_min_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_get_reference_map_source, "shumate_viewport_get_reference_map_source", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_get_zoom_level, "shumate_viewport_get_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_latitude_to_widget_y, "shumate_viewport_latitude_to_widget_y", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_longitude_to_widget_x, "shumate_viewport_longitude_to_widget_x", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_set_max_zoom_level, "shumate_viewport_set_max_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_set_min_zoom_level, "shumate_viewport_set_min_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_set_reference_map_source, "shumate_viewport_set_reference_map_source", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_set_zoom_level, "shumate_viewport_set_zoom_level", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_widget_x_to_longitude, "shumate_viewport_widget_x_to_longitude", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_widget_y_to_latitude, "shumate_viewport_widget_y_to_latitude", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_zoom_in, "shumate_viewport_zoom_in", LIBRARY_SHUMATE);
	Linker.link(shumate_viewport_zoom_out, "shumate_viewport_zoom_out", LIBRARY_SHUMATE);
}

__gshared extern(C)
{

	// shumate.Coordinate

	GType function() c_shumate_coordinate_get_type;
	ShumateCoordinate* function() c_shumate_coordinate_new;
	ShumateCoordinate* function(double latitude, double longitude) c_shumate_coordinate_new_full;

	// shumate.FileCache

	GType function() c_shumate_file_cache_get_type;
	ShumateFileCache* function(uint sizeLimit, const(char)* cacheKey, const(char)* cacheDir) c_shumate_file_cache_new_full;
	const(char)* function(ShumateFileCache* fileCache) c_shumate_file_cache_get_cache_dir;
	const(char)* function(ShumateFileCache* fileCache) c_shumate_file_cache_get_cache_key;
	uint function(ShumateFileCache* fileCache) c_shumate_file_cache_get_size_limit;
	void function(ShumateFileCache* self, ShumateTile* tile, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_shumate_file_cache_get_tile_async;
	GBytes* function(ShumateFileCache* self, char** etag, GDateTime** modtime, GAsyncResult* result, GError** err) c_shumate_file_cache_get_tile_finish;
	void function(ShumateFileCache* self, ShumateTile* tile) c_shumate_file_cache_mark_up_to_date;
	void function(ShumateFileCache* self, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_shumate_file_cache_purge_cache_async;
	int function(ShumateFileCache* self, GAsyncResult* result, GError** err) c_shumate_file_cache_purge_cache_finish;
	void function(ShumateFileCache* fileCache, uint sizeLimit) c_shumate_file_cache_set_size_limit;
	void function(ShumateFileCache* self, ShumateTile* tile, GBytes* bytes, const(char)* etag, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_shumate_file_cache_store_tile_async;
	int function(ShumateFileCache* self, GAsyncResult* result, GError** err) c_shumate_file_cache_store_tile_finish;

	// shumate.Layer

	GType function() c_shumate_layer_get_type;
	ShumateViewport* function(ShumateLayer* self) c_shumate_layer_get_viewport;

	// shumate.License

	GType function() c_shumate_license_get_type;
	ShumateLicense* function() c_shumate_license_new;
	void function(ShumateLicense* license, ShumateMapSource* mapSource) c_shumate_license_append_map_source;
	const(char)* function(ShumateLicense* license) c_shumate_license_get_extra_text;
	float function(ShumateLicense* license) c_shumate_license_get_xalign;
	void function(ShumateLicense* license, ShumateMapSource* mapSource) c_shumate_license_prepend_map_source;
	void function(ShumateLicense* license, ShumateMapSource* mapSource) c_shumate_license_remove_map_source;
	void function(ShumateLicense* license, const(char)* text) c_shumate_license_set_extra_text;
	void function(ShumateLicense* license, float xalign) c_shumate_license_set_xalign;

	// shumate.Location

	GType function() c_shumate_location_get_type;
	double function(ShumateLocation* location) c_shumate_location_get_latitude;
	double function(ShumateLocation* location) c_shumate_location_get_longitude;
	void function(ShumateLocation* location, double latitude, double longitude) c_shumate_location_set_location;

	// shumate.MapLayer

	GType function() c_shumate_map_layer_get_type;
	ShumateMapLayer* function(ShumateMapSource* mapSource, ShumateViewport* viewport) c_shumate_map_layer_new;

	// shumate.MapSource

	GType function() c_shumate_map_source_get_type;
	void function(ShumateMapSource* self, ShumateTile* tile, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData) c_shumate_map_source_fill_tile_async;
	int function(ShumateMapSource* self, GAsyncResult* result, GError** err) c_shumate_map_source_fill_tile_finish;
	uint function(ShumateMapSource* mapSource, uint zoomLevel) c_shumate_map_source_get_column_count;
	const(char)* function(ShumateMapSource* mapSource) c_shumate_map_source_get_id;
	double function(ShumateMapSource* mapSource, double zoomLevel, double y) c_shumate_map_source_get_latitude;
	const(char)* function(ShumateMapSource* mapSource) c_shumate_map_source_get_license;
	const(char)* function(ShumateMapSource* mapSource) c_shumate_map_source_get_license_uri;
	double function(ShumateMapSource* mapSource, double zoomLevel, double x) c_shumate_map_source_get_longitude;
	uint function(ShumateMapSource* mapSource) c_shumate_map_source_get_max_zoom_level;
	double function(ShumateMapSource* mapSource, double zoomLevel, double latitude, double longitude) c_shumate_map_source_get_meters_per_pixel;
	uint function(ShumateMapSource* mapSource) c_shumate_map_source_get_min_zoom_level;
	const(char)* function(ShumateMapSource* mapSource) c_shumate_map_source_get_name;
	ShumateMapProjection function(ShumateMapSource* mapSource) c_shumate_map_source_get_projection;
	uint function(ShumateMapSource* mapSource, uint zoomLevel) c_shumate_map_source_get_row_count;
	uint function(ShumateMapSource* mapSource) c_shumate_map_source_get_tile_size;
	double function(ShumateMapSource* mapSource, double zoomLevel, double longitude) c_shumate_map_source_get_x;
	double function(ShumateMapSource* mapSource, double zoomLevel, double latitude) c_shumate_map_source_get_y;

	// shumate.MapSourceRegistry

	GType function() c_shumate_map_source_registry_get_type;
	ShumateMapSourceRegistry* function() c_shumate_map_source_registry_new;
	ShumateMapSourceRegistry* function() c_shumate_map_source_registry_new_with_defaults;
	void function(ShumateMapSourceRegistry* self, ShumateMapSource* mapSource) c_shumate_map_source_registry_add;
	ShumateMapSource* function(ShumateMapSourceRegistry* self, const(char)* id) c_shumate_map_source_registry_get_by_id;
	void function(ShumateMapSourceRegistry* self) c_shumate_map_source_registry_populate_defaults;
	void function(ShumateMapSourceRegistry* self, const(char)* id) c_shumate_map_source_registry_remove;

	// shumate.Marker

	GType function() c_shumate_marker_get_type;
	ShumateMarker* function() c_shumate_marker_new;
	void function(ShumateMarker* marker) c_shumate_marker_animate_in;
	void function(ShumateMarker* marker, uint delay) c_shumate_marker_animate_in_with_delay;
	void function(ShumateMarker* marker) c_shumate_marker_animate_out;
	void function(ShumateMarker* marker, uint delay) c_shumate_marker_animate_out_with_delay;
	GtkWidget* function(ShumateMarker* marker) c_shumate_marker_get_child;
	int function(ShumateMarker* marker) c_shumate_marker_get_draggable;
	int function(ShumateMarker* marker) c_shumate_marker_get_selectable;
	int function(ShumateMarker* marker) c_shumate_marker_is_selected;
	void function(ShumateMarker* marker, GtkWidget* child) c_shumate_marker_set_child;
	void function(ShumateMarker* marker, int value) c_shumate_marker_set_draggable;
	void function(ShumateMarker* marker, int value) c_shumate_marker_set_selectable;

	// shumate.MarkerLayer

	GType function() c_shumate_marker_layer_get_type;
	ShumateMarkerLayer* function(ShumateViewport* viewport) c_shumate_marker_layer_new;
	ShumateMarkerLayer* function(ShumateViewport* viewport, GtkSelectionMode mode) c_shumate_marker_layer_new_full;
	void function(ShumateMarkerLayer* layer, ShumateMarker* marker) c_shumate_marker_layer_add_marker;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_animate_in_all_markers;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_animate_out_all_markers;
	GList* function(ShumateMarkerLayer* layer) c_shumate_marker_layer_get_markers;
	GList* function(ShumateMarkerLayer* layer) c_shumate_marker_layer_get_selected;
	GtkSelectionMode function(ShumateMarkerLayer* layer) c_shumate_marker_layer_get_selection_mode;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_hide_all_markers;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_remove_all;
	void function(ShumateMarkerLayer* layer, ShumateMarker* marker) c_shumate_marker_layer_remove_marker;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_select_all_markers;
	int function(ShumateMarkerLayer* self, ShumateMarker* marker) c_shumate_marker_layer_select_marker;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_set_all_markers_draggable;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_set_all_markers_undraggable;
	void function(ShumateMarkerLayer* layer, GtkSelectionMode mode) c_shumate_marker_layer_set_selection_mode;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_show_all_markers;
	void function(ShumateMarkerLayer* layer) c_shumate_marker_layer_unselect_all_markers;
	void function(ShumateMarkerLayer* self, ShumateMarker* marker) c_shumate_marker_layer_unselect_marker;

	// shumate.MemoryCache

	GType function() c_shumate_memory_cache_get_type;
	ShumateMemoryCache* function(uint sizeLimit) c_shumate_memory_cache_new_full;
	void function(ShumateMemoryCache* memoryCache) c_shumate_memory_cache_clean;
	uint function(ShumateMemoryCache* memoryCache) c_shumate_memory_cache_get_size_limit;
	void function(ShumateMemoryCache* memoryCache, uint sizeLimit) c_shumate_memory_cache_set_size_limit;
	void function(ShumateMemoryCache* self, ShumateTile* tile, GdkTexture* texture, const(char)* sourceId) c_shumate_memory_cache_store_texture;
	int function(ShumateMemoryCache* self, ShumateTile* tile, const(char)* sourceId) c_shumate_memory_cache_try_fill_tile;

	// shumate.NetworkTileSource

	GType function() c_shumate_network_tile_source_get_type;
	ShumateNetworkTileSource* function(const(char)* id, const(char)* name, const(char)* license, const(char)* licenseUri, uint minZoom, uint maxZoom, uint tileSize, ShumateMapProjection projection, const(char)* uriFormat) c_shumate_network_tile_source_new_full;
	int function(ShumateNetworkTileSource* tileSource) c_shumate_network_tile_source_get_max_conns;
	int function(ShumateNetworkTileSource* tileSource) c_shumate_network_tile_source_get_offline;
	const(char)* function(ShumateNetworkTileSource* tileSource) c_shumate_network_tile_source_get_proxy_uri;
	const(char)* function(ShumateNetworkTileSource* tileSource) c_shumate_network_tile_source_get_uri_format;
	void function(ShumateNetworkTileSource* tileSource, int maxConns) c_shumate_network_tile_source_set_max_conns;
	void function(ShumateNetworkTileSource* tileSource, int offline) c_shumate_network_tile_source_set_offline;
	void function(ShumateNetworkTileSource* tileSource, const(char)* proxyUri) c_shumate_network_tile_source_set_proxy_uri;
	void function(ShumateNetworkTileSource* tileSource, const(char)* uriFormat) c_shumate_network_tile_source_set_uri_format;
	void function(ShumateNetworkTileSource* tileSource, const(char)* userAgent) c_shumate_network_tile_source_set_user_agent;

	// shumate.PathLayer

	GType function() c_shumate_path_layer_get_type;
	ShumatePathLayer* function(ShumateViewport* viewport) c_shumate_path_layer_new;
	void function(ShumatePathLayer* layer, ShumateLocation* location) c_shumate_path_layer_add_node;
	int function(ShumatePathLayer* layer) c_shumate_path_layer_get_closed;
	GList* function(ShumatePathLayer* layer) c_shumate_path_layer_get_dash;
	int function(ShumatePathLayer* layer) c_shumate_path_layer_get_fill;
	GdkRGBA* function(ShumatePathLayer* layer) c_shumate_path_layer_get_fill_color;
	GList* function(ShumatePathLayer* layer) c_shumate_path_layer_get_nodes;
	GdkRGBA* function(ShumatePathLayer* layer) c_shumate_path_layer_get_outline_color;
	double function(ShumatePathLayer* layer) c_shumate_path_layer_get_outline_width;
	int function(ShumatePathLayer* layer) c_shumate_path_layer_get_stroke;
	GdkRGBA* function(ShumatePathLayer* layer) c_shumate_path_layer_get_stroke_color;
	double function(ShumatePathLayer* layer) c_shumate_path_layer_get_stroke_width;
	void function(ShumatePathLayer* layer, ShumateLocation* location, uint position) c_shumate_path_layer_insert_node;
	void function(ShumatePathLayer* layer) c_shumate_path_layer_remove_all;
	void function(ShumatePathLayer* layer, ShumateLocation* location) c_shumate_path_layer_remove_node;
	void function(ShumatePathLayer* layer, int value) c_shumate_path_layer_set_closed;
	void function(ShumatePathLayer* layer, GList* dashPattern) c_shumate_path_layer_set_dash;
	void function(ShumatePathLayer* layer, int value) c_shumate_path_layer_set_fill;
	void function(ShumatePathLayer* layer, GdkRGBA* color) c_shumate_path_layer_set_fill_color;
	void function(ShumatePathLayer* layer, GdkRGBA* color) c_shumate_path_layer_set_outline_color;
	void function(ShumatePathLayer* layer, double value) c_shumate_path_layer_set_outline_width;
	void function(ShumatePathLayer* layer, int value) c_shumate_path_layer_set_stroke;
	void function(ShumatePathLayer* layer, GdkRGBA* color) c_shumate_path_layer_set_stroke_color;
	void function(ShumatePathLayer* layer, double value) c_shumate_path_layer_set_stroke_width;

	// shumate.Point

	GType function() c_shumate_point_get_type;
	ShumateMarker* function() c_shumate_point_new;

	// shumate.Scale

	GType function() c_shumate_scale_get_type;
	ShumateScale* function(ShumateViewport* viewport) c_shumate_scale_new;
	uint function(ShumateScale* scale) c_shumate_scale_get_max_width;
	ShumateUnit function(ShumateScale* scale) c_shumate_scale_get_unit;
	ShumateViewport* function(ShumateScale* scale) c_shumate_scale_get_viewport;
	void function(ShumateScale* scale, uint value) c_shumate_scale_set_max_width;
	void function(ShumateScale* scale, ShumateUnit unit) c_shumate_scale_set_unit;
	void function(ShumateScale* scale, ShumateViewport* viewport) c_shumate_scale_set_viewport;

	// shumate.Tile

	GType function() c_shumate_tile_get_type;
	ShumateTile* function() c_shumate_tile_new;
	ShumateTile* function(uint x, uint y, uint size, uint zoomLevel) c_shumate_tile_new_full;
	const(char)* function(ShumateTile* self) c_shumate_tile_get_etag;
	int function(ShumateTile* self) c_shumate_tile_get_fade_in;
	GDateTime* function(ShumateTile* self) c_shumate_tile_get_modified_time;
	uint function(ShumateTile* self) c_shumate_tile_get_size;
	ShumateState function(ShumateTile* self) c_shumate_tile_get_state;
	GdkTexture* function(ShumateTile* self) c_shumate_tile_get_texture;
	uint function(ShumateTile* self) c_shumate_tile_get_x;
	uint function(ShumateTile* self) c_shumate_tile_get_y;
	uint function(ShumateTile* self) c_shumate_tile_get_zoom_level;
	void function(ShumateTile* self, const(char)* etag) c_shumate_tile_set_etag;
	void function(ShumateTile* self, int fadeIn) c_shumate_tile_set_fade_in;
	void function(ShumateTile* self, GDateTime* modifiedTime) c_shumate_tile_set_modified_time;
	void function(ShumateTile* self, uint size) c_shumate_tile_set_size;
	void function(ShumateTile* self, ShumateState state) c_shumate_tile_set_state;
	void function(ShumateTile* self, GdkTexture* texture) c_shumate_tile_set_texture;
	void function(ShumateTile* self, uint x) c_shumate_tile_set_x;
	void function(ShumateTile* self, uint y) c_shumate_tile_set_y;
	void function(ShumateTile* self, uint zoomLevel) c_shumate_tile_set_zoom_level;

	// shumate.TileSource

	GType function() c_shumate_tile_source_get_type;
	void function(ShumateTileSource* tileSource, const(char)* id) c_shumate_tile_source_set_id;
	void function(ShumateTileSource* tileSource, const(char)* license) c_shumate_tile_source_set_license;
	void function(ShumateTileSource* tileSource, const(char)* licenseUri) c_shumate_tile_source_set_license_uri;
	void function(ShumateTileSource* tileSource, uint zoomLevel) c_shumate_tile_source_set_max_zoom_level;
	void function(ShumateTileSource* tileSource, uint zoomLevel) c_shumate_tile_source_set_min_zoom_level;
	void function(ShumateTileSource* tileSource, const(char)* name) c_shumate_tile_source_set_name;
	void function(ShumateTileSource* tileSource, ShumateMapProjection projection) c_shumate_tile_source_set_projection;
	void function(ShumateTileSource* tileSource, uint tileSize) c_shumate_tile_source_set_tile_size;

	// shumate.View

	GType function() c_shumate_view_get_type;
	ShumateView* function() c_shumate_view_new;
	ShumateView* function() c_shumate_view_new_simple;
	void function(ShumateView* view, ShumateLayer* layer) c_shumate_view_add_layer;
	void function(ShumateView* view, ShumateMapSource* mapSource) c_shumate_view_add_overlay_source;
	void function(ShumateView* view, double latitude, double longitude) c_shumate_view_center_on;
	int function(ShumateView* view) c_shumate_view_get_animate_zoom;
	uint function(ShumateView* self) c_shumate_view_get_go_to_duration;
	GList* function(ShumateView* view) c_shumate_view_get_overlay_sources;
	ShumateState function(ShumateView* view) c_shumate_view_get_state;
	ShumateViewport* function(ShumateView* self) c_shumate_view_get_viewport;
	int function(ShumateView* view) c_shumate_view_get_zoom_on_double_click;
	void function(ShumateView* view, double latitude, double longitude) c_shumate_view_go_to;
	void function(ShumateView* view, ShumateLayer* layer, ShumateLayer* nextSibling) c_shumate_view_insert_layer_above;
	void function(ShumateView* view, ShumateLayer* layer, ShumateLayer* nextSibling) c_shumate_view_insert_layer_behind;
	void function(ShumateView* view, ShumateLayer* layer) c_shumate_view_remove_layer;
	void function(ShumateView* view, ShumateMapSource* mapSource) c_shumate_view_remove_overlay_source;
	void function(ShumateView* view, int value) c_shumate_view_set_animate_zoom;
	void function(ShumateView* self, uint duration) c_shumate_view_set_go_to_duration;
	void function(ShumateView* view, ShumateMapSource* mapSource) c_shumate_view_set_map_source;
	void function(ShumateView* view, int value) c_shumate_view_set_zoom_on_double_click;
	void function(ShumateView* view) c_shumate_view_stop_go_to;

	// shumate.Viewport

	GType function() c_shumate_viewport_get_type;
	ShumateViewport* function() c_shumate_viewport_new;
	uint function(ShumateViewport* self) c_shumate_viewport_get_max_zoom_level;
	uint function(ShumateViewport* self) c_shumate_viewport_get_min_zoom_level;
	ShumateMapSource* function(ShumateViewport* self) c_shumate_viewport_get_reference_map_source;
	double function(ShumateViewport* self) c_shumate_viewport_get_zoom_level;
	double function(ShumateViewport* self, GtkWidget* widget, double latitude) c_shumate_viewport_latitude_to_widget_y;
	double function(ShumateViewport* self, GtkWidget* widget, double longitude) c_shumate_viewport_longitude_to_widget_x;
	void function(ShumateViewport* self, uint maxZoomLevel) c_shumate_viewport_set_max_zoom_level;
	void function(ShumateViewport* self, uint minZoomLevel) c_shumate_viewport_set_min_zoom_level;
	void function(ShumateViewport* self, ShumateMapSource* mapSource) c_shumate_viewport_set_reference_map_source;
	void function(ShumateViewport* self, double zoomLevel) c_shumate_viewport_set_zoom_level;
	double function(ShumateViewport* self, GtkWidget* widget, double x) c_shumate_viewport_widget_x_to_longitude;
	double function(ShumateViewport* self, GtkWidget* widget, double y) c_shumate_viewport_widget_y_to_latitude;
	void function(ShumateViewport* self) c_shumate_viewport_zoom_in;
	void function(ShumateViewport* self) c_shumate_viewport_zoom_out;
}


// shumate.Coordinate

alias c_shumate_coordinate_get_type shumate_coordinate_get_type;
alias c_shumate_coordinate_new shumate_coordinate_new;
alias c_shumate_coordinate_new_full shumate_coordinate_new_full;

// shumate.FileCache

alias c_shumate_file_cache_get_type shumate_file_cache_get_type;
alias c_shumate_file_cache_new_full shumate_file_cache_new_full;
alias c_shumate_file_cache_get_cache_dir shumate_file_cache_get_cache_dir;
alias c_shumate_file_cache_get_cache_key shumate_file_cache_get_cache_key;
alias c_shumate_file_cache_get_size_limit shumate_file_cache_get_size_limit;
alias c_shumate_file_cache_get_tile_async shumate_file_cache_get_tile_async;
alias c_shumate_file_cache_get_tile_finish shumate_file_cache_get_tile_finish;
alias c_shumate_file_cache_mark_up_to_date shumate_file_cache_mark_up_to_date;
alias c_shumate_file_cache_purge_cache_async shumate_file_cache_purge_cache_async;
alias c_shumate_file_cache_purge_cache_finish shumate_file_cache_purge_cache_finish;
alias c_shumate_file_cache_set_size_limit shumate_file_cache_set_size_limit;
alias c_shumate_file_cache_store_tile_async shumate_file_cache_store_tile_async;
alias c_shumate_file_cache_store_tile_finish shumate_file_cache_store_tile_finish;

// shumate.Layer

alias c_shumate_layer_get_type shumate_layer_get_type;
alias c_shumate_layer_get_viewport shumate_layer_get_viewport;

// shumate.License

alias c_shumate_license_get_type shumate_license_get_type;
alias c_shumate_license_new shumate_license_new;
alias c_shumate_license_append_map_source shumate_license_append_map_source;
alias c_shumate_license_get_extra_text shumate_license_get_extra_text;
alias c_shumate_license_get_xalign shumate_license_get_xalign;
alias c_shumate_license_prepend_map_source shumate_license_prepend_map_source;
alias c_shumate_license_remove_map_source shumate_license_remove_map_source;
alias c_shumate_license_set_extra_text shumate_license_set_extra_text;
alias c_shumate_license_set_xalign shumate_license_set_xalign;

// shumate.Location

alias c_shumate_location_get_type shumate_location_get_type;
alias c_shumate_location_get_latitude shumate_location_get_latitude;
alias c_shumate_location_get_longitude shumate_location_get_longitude;
alias c_shumate_location_set_location shumate_location_set_location;

// shumate.MapLayer

alias c_shumate_map_layer_get_type shumate_map_layer_get_type;
alias c_shumate_map_layer_new shumate_map_layer_new;

// shumate.MapSource

alias c_shumate_map_source_get_type shumate_map_source_get_type;
alias c_shumate_map_source_fill_tile_async shumate_map_source_fill_tile_async;
alias c_shumate_map_source_fill_tile_finish shumate_map_source_fill_tile_finish;
alias c_shumate_map_source_get_column_count shumate_map_source_get_column_count;
alias c_shumate_map_source_get_id shumate_map_source_get_id;
alias c_shumate_map_source_get_latitude shumate_map_source_get_latitude;
alias c_shumate_map_source_get_license shumate_map_source_get_license;
alias c_shumate_map_source_get_license_uri shumate_map_source_get_license_uri;
alias c_shumate_map_source_get_longitude shumate_map_source_get_longitude;
alias c_shumate_map_source_get_max_zoom_level shumate_map_source_get_max_zoom_level;
alias c_shumate_map_source_get_meters_per_pixel shumate_map_source_get_meters_per_pixel;
alias c_shumate_map_source_get_min_zoom_level shumate_map_source_get_min_zoom_level;
alias c_shumate_map_source_get_name shumate_map_source_get_name;
alias c_shumate_map_source_get_projection shumate_map_source_get_projection;
alias c_shumate_map_source_get_row_count shumate_map_source_get_row_count;
alias c_shumate_map_source_get_tile_size shumate_map_source_get_tile_size;
alias c_shumate_map_source_get_x shumate_map_source_get_x;
alias c_shumate_map_source_get_y shumate_map_source_get_y;

// shumate.MapSourceRegistry

alias c_shumate_map_source_registry_get_type shumate_map_source_registry_get_type;
alias c_shumate_map_source_registry_new shumate_map_source_registry_new;
alias c_shumate_map_source_registry_new_with_defaults shumate_map_source_registry_new_with_defaults;
alias c_shumate_map_source_registry_add shumate_map_source_registry_add;
alias c_shumate_map_source_registry_get_by_id shumate_map_source_registry_get_by_id;
alias c_shumate_map_source_registry_populate_defaults shumate_map_source_registry_populate_defaults;
alias c_shumate_map_source_registry_remove shumate_map_source_registry_remove;

// shumate.Marker

alias c_shumate_marker_get_type shumate_marker_get_type;
alias c_shumate_marker_new shumate_marker_new;
alias c_shumate_marker_animate_in shumate_marker_animate_in;
alias c_shumate_marker_animate_in_with_delay shumate_marker_animate_in_with_delay;
alias c_shumate_marker_animate_out shumate_marker_animate_out;
alias c_shumate_marker_animate_out_with_delay shumate_marker_animate_out_with_delay;
alias c_shumate_marker_get_child shumate_marker_get_child;
alias c_shumate_marker_get_draggable shumate_marker_get_draggable;
alias c_shumate_marker_get_selectable shumate_marker_get_selectable;
alias c_shumate_marker_is_selected shumate_marker_is_selected;
alias c_shumate_marker_set_child shumate_marker_set_child;
alias c_shumate_marker_set_draggable shumate_marker_set_draggable;
alias c_shumate_marker_set_selectable shumate_marker_set_selectable;

// shumate.MarkerLayer

alias c_shumate_marker_layer_get_type shumate_marker_layer_get_type;
alias c_shumate_marker_layer_new shumate_marker_layer_new;
alias c_shumate_marker_layer_new_full shumate_marker_layer_new_full;
alias c_shumate_marker_layer_add_marker shumate_marker_layer_add_marker;
alias c_shumate_marker_layer_animate_in_all_markers shumate_marker_layer_animate_in_all_markers;
alias c_shumate_marker_layer_animate_out_all_markers shumate_marker_layer_animate_out_all_markers;
alias c_shumate_marker_layer_get_markers shumate_marker_layer_get_markers;
alias c_shumate_marker_layer_get_selected shumate_marker_layer_get_selected;
alias c_shumate_marker_layer_get_selection_mode shumate_marker_layer_get_selection_mode;
alias c_shumate_marker_layer_hide_all_markers shumate_marker_layer_hide_all_markers;
alias c_shumate_marker_layer_remove_all shumate_marker_layer_remove_all;
alias c_shumate_marker_layer_remove_marker shumate_marker_layer_remove_marker;
alias c_shumate_marker_layer_select_all_markers shumate_marker_layer_select_all_markers;
alias c_shumate_marker_layer_select_marker shumate_marker_layer_select_marker;
alias c_shumate_marker_layer_set_all_markers_draggable shumate_marker_layer_set_all_markers_draggable;
alias c_shumate_marker_layer_set_all_markers_undraggable shumate_marker_layer_set_all_markers_undraggable;
alias c_shumate_marker_layer_set_selection_mode shumate_marker_layer_set_selection_mode;
alias c_shumate_marker_layer_show_all_markers shumate_marker_layer_show_all_markers;
alias c_shumate_marker_layer_unselect_all_markers shumate_marker_layer_unselect_all_markers;
alias c_shumate_marker_layer_unselect_marker shumate_marker_layer_unselect_marker;

// shumate.MemoryCache

alias c_shumate_memory_cache_get_type shumate_memory_cache_get_type;
alias c_shumate_memory_cache_new_full shumate_memory_cache_new_full;
alias c_shumate_memory_cache_clean shumate_memory_cache_clean;
alias c_shumate_memory_cache_get_size_limit shumate_memory_cache_get_size_limit;
alias c_shumate_memory_cache_set_size_limit shumate_memory_cache_set_size_limit;
alias c_shumate_memory_cache_store_texture shumate_memory_cache_store_texture;
alias c_shumate_memory_cache_try_fill_tile shumate_memory_cache_try_fill_tile;

// shumate.NetworkTileSource

alias c_shumate_network_tile_source_get_type shumate_network_tile_source_get_type;
alias c_shumate_network_tile_source_new_full shumate_network_tile_source_new_full;
alias c_shumate_network_tile_source_get_max_conns shumate_network_tile_source_get_max_conns;
alias c_shumate_network_tile_source_get_offline shumate_network_tile_source_get_offline;
alias c_shumate_network_tile_source_get_proxy_uri shumate_network_tile_source_get_proxy_uri;
alias c_shumate_network_tile_source_get_uri_format shumate_network_tile_source_get_uri_format;
alias c_shumate_network_tile_source_set_max_conns shumate_network_tile_source_set_max_conns;
alias c_shumate_network_tile_source_set_offline shumate_network_tile_source_set_offline;
alias c_shumate_network_tile_source_set_proxy_uri shumate_network_tile_source_set_proxy_uri;
alias c_shumate_network_tile_source_set_uri_format shumate_network_tile_source_set_uri_format;
alias c_shumate_network_tile_source_set_user_agent shumate_network_tile_source_set_user_agent;

// shumate.PathLayer

alias c_shumate_path_layer_get_type shumate_path_layer_get_type;
alias c_shumate_path_layer_new shumate_path_layer_new;
alias c_shumate_path_layer_add_node shumate_path_layer_add_node;
alias c_shumate_path_layer_get_closed shumate_path_layer_get_closed;
alias c_shumate_path_layer_get_dash shumate_path_layer_get_dash;
alias c_shumate_path_layer_get_fill shumate_path_layer_get_fill;
alias c_shumate_path_layer_get_fill_color shumate_path_layer_get_fill_color;
alias c_shumate_path_layer_get_nodes shumate_path_layer_get_nodes;
alias c_shumate_path_layer_get_outline_color shumate_path_layer_get_outline_color;
alias c_shumate_path_layer_get_outline_width shumate_path_layer_get_outline_width;
alias c_shumate_path_layer_get_stroke shumate_path_layer_get_stroke;
alias c_shumate_path_layer_get_stroke_color shumate_path_layer_get_stroke_color;
alias c_shumate_path_layer_get_stroke_width shumate_path_layer_get_stroke_width;
alias c_shumate_path_layer_insert_node shumate_path_layer_insert_node;
alias c_shumate_path_layer_remove_all shumate_path_layer_remove_all;
alias c_shumate_path_layer_remove_node shumate_path_layer_remove_node;
alias c_shumate_path_layer_set_closed shumate_path_layer_set_closed;
alias c_shumate_path_layer_set_dash shumate_path_layer_set_dash;
alias c_shumate_path_layer_set_fill shumate_path_layer_set_fill;
alias c_shumate_path_layer_set_fill_color shumate_path_layer_set_fill_color;
alias c_shumate_path_layer_set_outline_color shumate_path_layer_set_outline_color;
alias c_shumate_path_layer_set_outline_width shumate_path_layer_set_outline_width;
alias c_shumate_path_layer_set_stroke shumate_path_layer_set_stroke;
alias c_shumate_path_layer_set_stroke_color shumate_path_layer_set_stroke_color;
alias c_shumate_path_layer_set_stroke_width shumate_path_layer_set_stroke_width;

// shumate.Point

alias c_shumate_point_get_type shumate_point_get_type;
alias c_shumate_point_new shumate_point_new;

// shumate.Scale

alias c_shumate_scale_get_type shumate_scale_get_type;
alias c_shumate_scale_new shumate_scale_new;
alias c_shumate_scale_get_max_width shumate_scale_get_max_width;
alias c_shumate_scale_get_unit shumate_scale_get_unit;
alias c_shumate_scale_get_viewport shumate_scale_get_viewport;
alias c_shumate_scale_set_max_width shumate_scale_set_max_width;
alias c_shumate_scale_set_unit shumate_scale_set_unit;
alias c_shumate_scale_set_viewport shumate_scale_set_viewport;

// shumate.Tile

alias c_shumate_tile_get_type shumate_tile_get_type;
alias c_shumate_tile_new shumate_tile_new;
alias c_shumate_tile_new_full shumate_tile_new_full;
alias c_shumate_tile_get_etag shumate_tile_get_etag;
alias c_shumate_tile_get_fade_in shumate_tile_get_fade_in;
alias c_shumate_tile_get_modified_time shumate_tile_get_modified_time;
alias c_shumate_tile_get_size shumate_tile_get_size;
alias c_shumate_tile_get_state shumate_tile_get_state;
alias c_shumate_tile_get_texture shumate_tile_get_texture;
alias c_shumate_tile_get_x shumate_tile_get_x;
alias c_shumate_tile_get_y shumate_tile_get_y;
alias c_shumate_tile_get_zoom_level shumate_tile_get_zoom_level;
alias c_shumate_tile_set_etag shumate_tile_set_etag;
alias c_shumate_tile_set_fade_in shumate_tile_set_fade_in;
alias c_shumate_tile_set_modified_time shumate_tile_set_modified_time;
alias c_shumate_tile_set_size shumate_tile_set_size;
alias c_shumate_tile_set_state shumate_tile_set_state;
alias c_shumate_tile_set_texture shumate_tile_set_texture;
alias c_shumate_tile_set_x shumate_tile_set_x;
alias c_shumate_tile_set_y shumate_tile_set_y;
alias c_shumate_tile_set_zoom_level shumate_tile_set_zoom_level;

// shumate.TileSource

alias c_shumate_tile_source_get_type shumate_tile_source_get_type;
alias c_shumate_tile_source_set_id shumate_tile_source_set_id;
alias c_shumate_tile_source_set_license shumate_tile_source_set_license;
alias c_shumate_tile_source_set_license_uri shumate_tile_source_set_license_uri;
alias c_shumate_tile_source_set_max_zoom_level shumate_tile_source_set_max_zoom_level;
alias c_shumate_tile_source_set_min_zoom_level shumate_tile_source_set_min_zoom_level;
alias c_shumate_tile_source_set_name shumate_tile_source_set_name;
alias c_shumate_tile_source_set_projection shumate_tile_source_set_projection;
alias c_shumate_tile_source_set_tile_size shumate_tile_source_set_tile_size;

// shumate.View

alias c_shumate_view_get_type shumate_view_get_type;
alias c_shumate_view_new shumate_view_new;
alias c_shumate_view_new_simple shumate_view_new_simple;
alias c_shumate_view_add_layer shumate_view_add_layer;
alias c_shumate_view_add_overlay_source shumate_view_add_overlay_source;
alias c_shumate_view_center_on shumate_view_center_on;
alias c_shumate_view_get_animate_zoom shumate_view_get_animate_zoom;
alias c_shumate_view_get_go_to_duration shumate_view_get_go_to_duration;
alias c_shumate_view_get_overlay_sources shumate_view_get_overlay_sources;
alias c_shumate_view_get_state shumate_view_get_state;
alias c_shumate_view_get_viewport shumate_view_get_viewport;
alias c_shumate_view_get_zoom_on_double_click shumate_view_get_zoom_on_double_click;
alias c_shumate_view_go_to shumate_view_go_to;
alias c_shumate_view_insert_layer_above shumate_view_insert_layer_above;
alias c_shumate_view_insert_layer_behind shumate_view_insert_layer_behind;
alias c_shumate_view_remove_layer shumate_view_remove_layer;
alias c_shumate_view_remove_overlay_source shumate_view_remove_overlay_source;
alias c_shumate_view_set_animate_zoom shumate_view_set_animate_zoom;
alias c_shumate_view_set_go_to_duration shumate_view_set_go_to_duration;
alias c_shumate_view_set_map_source shumate_view_set_map_source;
alias c_shumate_view_set_zoom_on_double_click shumate_view_set_zoom_on_double_click;
alias c_shumate_view_stop_go_to shumate_view_stop_go_to;

// shumate.Viewport

alias c_shumate_viewport_get_type shumate_viewport_get_type;
alias c_shumate_viewport_new shumate_viewport_new;
alias c_shumate_viewport_get_max_zoom_level shumate_viewport_get_max_zoom_level;
alias c_shumate_viewport_get_min_zoom_level shumate_viewport_get_min_zoom_level;
alias c_shumate_viewport_get_reference_map_source shumate_viewport_get_reference_map_source;
alias c_shumate_viewport_get_zoom_level shumate_viewport_get_zoom_level;
alias c_shumate_viewport_latitude_to_widget_y shumate_viewport_latitude_to_widget_y;
alias c_shumate_viewport_longitude_to_widget_x shumate_viewport_longitude_to_widget_x;
alias c_shumate_viewport_set_max_zoom_level shumate_viewport_set_max_zoom_level;
alias c_shumate_viewport_set_min_zoom_level shumate_viewport_set_min_zoom_level;
alias c_shumate_viewport_set_reference_map_source shumate_viewport_set_reference_map_source;
alias c_shumate_viewport_set_zoom_level shumate_viewport_set_zoom_level;
alias c_shumate_viewport_widget_x_to_longitude shumate_viewport_widget_x_to_longitude;
alias c_shumate_viewport_widget_y_to_latitude shumate_viewport_widget_y_to_latitude;
alias c_shumate_viewport_zoom_in shumate_viewport_zoom_in;
alias c_shumate_viewport_zoom_out shumate_viewport_zoom_out;