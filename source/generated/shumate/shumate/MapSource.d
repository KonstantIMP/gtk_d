module shumate.MapSource;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import shumate.Tile;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * The #ShumateMapSource structure contains only private data
 * and should be accessed using the provided API
 */
public class MapSource : ObjectG
{
	/** the main Gtk struct */
	protected ShumateMapSource* shumateMapSource;

	/** Get the main Gtk struct */
	public ShumateMapSource* getMapSourceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateMapSource;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateMapSource;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateMapSource* shumateMapSource, bool ownedRef = false)
	{
		this.shumateMapSource = shumateMapSource;
		super(cast(GObject*)shumateMapSource, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_map_source_get_type();
	}

	/**
	 * Asynchronous version of shumate_map_source_fill_tile().
	 *
	 * Params:
	 *     tile = a #ShumateTile
	 *     cancellable = a #GCancellable
	 *     callback = a #GAsyncReadyCallback to execute upon completion
	 *     userData = closure data for @callback
	 */
	public void fillTileAsync(Tile tile, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		shumate_map_source_fill_tile_async(shumateMapSource, (tile is null) ? null : tile.getTileStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Gets the success value of a completed shumate_map_source_fill_tile_async()
	 * operation.
	 *
	 * Params:
	 *     result = a #GAsyncResult provided to callback
	 *
	 * Returns: %TRUE if the tile was filled with valid data, otherwise %FALSE
	 *
	 * Throws: GException on failure.
	 */
	public bool fillTileFinish(AsyncResultIF result)
	{
		GError* err = null;

		auto __p = shumate_map_source_fill_tile_finish(shumateMapSource, (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Gets the number of tiles in a column at this zoom level for this map
	 * source.
	 *
	 * Params:
	 *     zoomLevel = the zoom level
	 *
	 * Returns: the number of tiles in a column
	 */
	public uint getColumnCount(uint zoomLevel)
	{
		return shumate_map_source_get_column_count(shumateMapSource, zoomLevel);
	}

	/**
	 * Gets map source's id.
	 *
	 * Returns: the map source's id.
	 */
	public string getId()
	{
		return Str.toString(shumate_map_source_get_id(shumateMapSource));
	}

	/**
	 * Gets the latitude corresponding to this y position in the map source's
	 * projection.
	 *
	 * Params:
	 *     zoomLevel = the zoom level
	 *     y = a y position
	 *
	 * Returns: the latitude
	 */
	public double getLatitude(double zoomLevel, double y)
	{
		return shumate_map_source_get_latitude(shumateMapSource, zoomLevel, y);
	}

	/**
	 * Gets map source's license.
	 *
	 * Returns: the map source's license.
	 */
	public string getLicense()
	{
		return Str.toString(shumate_map_source_get_license(shumateMapSource));
	}

	/**
	 * Gets map source's license URI.
	 *
	 * Returns: the map source's license URI.
	 */
	public string getLicenseUri()
	{
		return Str.toString(shumate_map_source_get_license_uri(shumateMapSource));
	}

	/**
	 * Gets the longitude corresponding to this x position in the map source's
	 * projection.
	 *
	 * Params:
	 *     zoomLevel = the zoom level
	 *     x = a x position
	 *
	 * Returns: the longitude
	 */
	public double getLongitude(double zoomLevel, double x)
	{
		return shumate_map_source_get_longitude(shumateMapSource, zoomLevel, x);
	}

	/**
	 * Gets map source's maximum zoom level.
	 *
	 * Returns: the maximum zoom level this map source supports
	 */
	public uint getMaxZoomLevel()
	{
		return shumate_map_source_get_max_zoom_level(shumateMapSource);
	}

	/**
	 * Gets meters per pixel at the position on the map using this map source's projection.
	 *
	 * Params:
	 *     zoomLevel = the zoom level
	 *     latitude = a latitude
	 *     longitude = a longitude
	 *
	 * Returns: the meters per pixel
	 */
	public double getMetersPerPixel(double zoomLevel, double latitude, double longitude)
	{
		return shumate_map_source_get_meters_per_pixel(shumateMapSource, zoomLevel, latitude, longitude);
	}

	/**
	 * Gets map source's minimum zoom level.
	 *
	 * Returns: the miminum zoom level this map source supports
	 */
	public uint getMinZoomLevel()
	{
		return shumate_map_source_get_min_zoom_level(shumateMapSource);
	}

	/**
	 * Gets map source's name.
	 *
	 * Returns: the map source's name.
	 */
	public string getName()
	{
		return Str.toString(shumate_map_source_get_name(shumateMapSource));
	}

	/**
	 * Gets map source's projection.
	 *
	 * Returns: the map source's projection.
	 */
	public ShumateMapProjection getProjection()
	{
		return shumate_map_source_get_projection(shumateMapSource);
	}

	/**
	 * Gets the number of tiles in a row at this zoom level for this map source.
	 *
	 * Params:
	 *     zoomLevel = the zoom level
	 *
	 * Returns: the number of tiles in a row
	 */
	public uint getRowCount(uint zoomLevel)
	{
		return shumate_map_source_get_row_count(shumateMapSource, zoomLevel);
	}

	/**
	 * Gets map source's tile size.
	 *
	 * Returns: the tile's size (width and height) in pixels for this map source
	 */
	public uint getTileSize()
	{
		return shumate_map_source_get_tile_size(shumateMapSource);
	}

	/**
	 * Gets the x position on the map using this map source's projection.
	 * (0, 0) is located at the top left.
	 *
	 * Params:
	 *     zoomLevel = the zoom level
	 *     longitude = a longitude
	 *
	 * Returns: the x position
	 */
	public double getX(double zoomLevel, double longitude)
	{
		return shumate_map_source_get_x(shumateMapSource, zoomLevel, longitude);
	}

	/**
	 * Gets the y position on the map using this map source's projection.
	 * (0, 0) is located at the top left.
	 *
	 * Params:
	 *     zoomLevel = the zoom level
	 *     latitude = a latitude
	 *
	 * Returns: the y position
	 */
	public double getY(double zoomLevel, double latitude)
	{
		return shumate_map_source_get_y(shumateMapSource, zoomLevel, latitude);
	}
}
