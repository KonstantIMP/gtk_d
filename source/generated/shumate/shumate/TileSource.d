module shumate.TileSource;

private import glib.Str;
private import shumate.MapSource;
private import shumate.c.functions;
public  import shumate.c.types;


/**
 * The #ShumateTileSource structure contains only private data
 * and should be accessed using the provided API
 */
public class TileSource : MapSource
{
	/** the main Gtk struct */
	protected ShumateTileSource* shumateTileSource;

	/** Get the main Gtk struct */
	public ShumateTileSource* getTileSourceStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateTileSource;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateTileSource;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateTileSource* shumateTileSource, bool ownedRef = false)
	{
		this.shumateTileSource = shumateTileSource;
		super(cast(ShumateMapSource*)shumateTileSource, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_tile_source_get_type();
	}

	/**
	 * Sets the tile source's id.
	 *
	 * Params:
	 *     id = an id
	 */
	public void setId(string id)
	{
		shumate_tile_source_set_id(shumateTileSource, Str.toStringz(id));
	}

	/**
	 * Sets the tile source's license.
	 *
	 * Params:
	 *     license = the licence
	 */
	public void setLicense(string license)
	{
		shumate_tile_source_set_license(shumateTileSource, Str.toStringz(license));
	}

	/**
	 * Sets the tile source's license URI.
	 *
	 * Params:
	 *     licenseUri = the licence URI
	 */
	public void setLicenseUri(string licenseUri)
	{
		shumate_tile_source_set_license_uri(shumateTileSource, Str.toStringz(licenseUri));
	}

	/**
	 * Sets the tile source's maximum zoom level.
	 *
	 * Params:
	 *     zoomLevel = the maximum zoom level
	 */
	public void setMaxZoomLevel(uint zoomLevel)
	{
		shumate_tile_source_set_max_zoom_level(shumateTileSource, zoomLevel);
	}

	/**
	 * Sets the tile source's minimal zoom level.
	 *
	 * Params:
	 *     zoomLevel = the minimal zoom level
	 */
	public void setMinZoomLevel(uint zoomLevel)
	{
		shumate_tile_source_set_min_zoom_level(shumateTileSource, zoomLevel);
	}

	/**
	 * Sets the tile source's name.
	 *
	 * Params:
	 *     name = a name
	 */
	public void setName(string name)
	{
		shumate_tile_source_set_name(shumateTileSource, Str.toStringz(name));
	}

	/**
	 * Sets the tile source's projection.
	 *
	 * Params:
	 *     projection = a #ShumateMapProjection
	 */
	public void setProjection(ShumateMapProjection projection)
	{
		shumate_tile_source_set_projection(shumateTileSource, projection);
	}

	/**
	 * Sets the tile source's tile size.
	 *
	 * Params:
	 *     tileSize = the tile size
	 */
	public void setTileSize(uint tileSize)
	{
		shumate_tile_source_set_tile_size(shumateTileSource, tileSize);
	}
}
