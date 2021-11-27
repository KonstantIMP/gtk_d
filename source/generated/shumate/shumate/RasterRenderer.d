module shumate.RasterRenderer;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import shumate.DataSource;
private import shumate.MapSource;
private import shumate.c.functions;
public  import shumate.c.types;


/** */
public class RasterRenderer : MapSource
{
	/** the main Gtk struct */
	protected ShumateRasterRenderer* shumateRasterRenderer;

	/** Get the main Gtk struct */
	public ShumateRasterRenderer* getRasterRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateRasterRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateRasterRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateRasterRenderer* shumateRasterRenderer, bool ownedRef = false)
	{
		this.shumateRasterRenderer = shumateRasterRenderer;
		super(cast(ShumateMapSource*)shumateRasterRenderer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_raster_renderer_get_type();
	}

	/**
	 * Creates a new [class@RasterRenderer] that uses the given data source.
	 *
	 * Params:
	 *     dataSource = a [class@DataSource] to provide tile image data
	 *
	 * Returns: a newly constructed [class@RasterRenderer]
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(DataSource dataSource)
	{
		auto __p = shumate_raster_renderer_new((dataSource is null) ? null : dataSource.getDataSourceStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateRasterRenderer*) __p, true);
	}

	/**
	 * Creates a new [class@RasterRenderer] that fetches tiles from the given URL
	 * using a [class@TileDownloader] data source.
	 *
	 * Equivalent to:
	 *
	 * ```c
	 * g_autoptr(ShumateTileDownloader) source = shumate_tile_downloader_new (url_template);
	 * ShumateRasterRenderer *renderer = shumate_raster_renderer_new (source);
	 * ```
	 *
	 * Params:
	 *     urlTemplate = a URL template to fetch tiles from
	 *
	 * Returns: a newly constructed [class@RasterRenderer]
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string urlTemplate)
	{
		auto __p = shumate_raster_renderer_new_from_url(Str.toStringz(urlTemplate));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_url");
		}

		this(cast(ShumateRasterRenderer*) __p, true);
	}

	/**
	 * Creates a new [class@RasterRenderer] with the given details and a data
	 * source.
	 *
	 * Params:
	 *     id = the map source's id
	 *     name = the map source's name
	 *     license = the map source's license
	 *     licenseUri = the map source's license URI
	 *     minZoom = the map source's minimum zoom level
	 *     maxZoom = the map source's maximum zoom level
	 *     tileSize = the map source's tile size (in pixels)
	 *     projection = the map source's projection
	 *     dataSource = a [class@DataSource] to provide tile image data
	 *
	 * Returns: a newly constructed [class@RasterRenderer]
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string id, string name, string license, string licenseUri, uint minZoom, uint maxZoom, uint tileSize, ShumateMapProjection projection, DataSource dataSource)
	{
		auto __p = shumate_raster_renderer_new_full(Str.toStringz(id), Str.toStringz(name), Str.toStringz(license), Str.toStringz(licenseUri), minZoom, maxZoom, tileSize, projection, (dataSource is null) ? null : dataSource.getDataSourceStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_full");
		}

		this(cast(ShumateRasterRenderer*) __p, true);
	}

	/**
	 * Creates a new [class@RasterRenderer] with the given details and a data
	 * source.
	 *
	 * Params:
	 *     id = the map source's id
	 *     name = the map source's name
	 *     license = the map source's license
	 *     licenseUri = the map source's license URI
	 *     minZoom = the map source's minimum zoom level
	 *     maxZoom = the map source's maximum zoom level
	 *     tileSize = the map source's tile size (in pixels)
	 *     projection = the map source's projection
	 *     urlTemplate = a URL template to fetch tiles from
	 *
	 * Returns: a newly constructed [class@RasterRenderer]
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string id, string name, string license, string licenseUri, uint minZoom, uint maxZoom, uint tileSize, ShumateMapProjection projection, string urlTemplate)
	{
		auto __p = shumate_raster_renderer_new_full_from_url(Str.toStringz(id), Str.toStringz(name), Str.toStringz(license), Str.toStringz(licenseUri), minZoom, maxZoom, tileSize, projection, Str.toStringz(urlTemplate));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_full_from_url");
		}

		this(cast(ShumateRasterRenderer*) __p, true);
	}
}
