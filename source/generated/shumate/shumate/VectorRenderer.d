module shumate.VectorRenderer;

private import gio.InitableIF;
private import gio.InitableT;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;
private import shumate.DataSource;
private import shumate.MapSource;
private import shumate.c.functions;
public  import shumate.c.types;


/** */
public class VectorRenderer : MapSource, InitableIF
{
	/** the main Gtk struct */
	protected ShumateVectorRenderer* shumateVectorRenderer;

	/** Get the main Gtk struct */
	public ShumateVectorRenderer* getVectorRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateVectorRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateVectorRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateVectorRenderer* shumateVectorRenderer, bool ownedRef = false)
	{
		this.shumateVectorRenderer = shumateVectorRenderer;
		super(cast(ShumateMapSource*)shumateVectorRenderer, ownedRef);
	}

	// add the Initable capabilities
	mixin InitableT!(ShumateVectorRenderer);


	/** */
	public static GType getType()
	{
		return shumate_vector_renderer_get_type();
	}

	/**
	 * Creates a new [class@VectorRenderer] to render vector tiles from @data_source.
	 *
	 * Params:
	 *     dataSource = a [class@DataSource] to provide tile image data
	 *     styleJson = a vector style
	 *
	 * Returns: a newly constructed [class@VectorRenderer]
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(DataSource dataSource, string styleJson)
	{
		GError* err = null;

		auto __p = shumate_vector_renderer_new((dataSource is null) ? null : dataSource.getDataSourceStruct(), Str.toStringz(styleJson), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateVectorRenderer*) __p, true);
	}

	/**
	 * Creates a new [class@VectorRenderer] that fetches tiles from the given URL
	 * using a [class@TileDownloader] data source.
	 *
	 * Equivalent to:
	 *
	 * ```c
	 * g_autoptr(ShumateTileDownloader) source = shumate_tile_downloader_new (url_template);
	 * ShumateVectorRenderer *renderer = shumate_vector_renderer_new (source);
	 * ```
	 *
	 * Params:
	 *     urlTemplate = a URL template to fetch tiles from
	 *     styleJson = a vector style
	 *
	 * Returns: a newly constructed [class@VectorRenderer]
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string urlTemplate, string styleJson)
	{
		GError* err = null;

		auto __p = shumate_vector_renderer_new_from_url(Str.toStringz(urlTemplate), Str.toStringz(styleJson), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_from_url");
		}

		this(cast(ShumateVectorRenderer*) __p, true);
	}

	/**
	 * Creates a new [class@VectorRenderer] to render vector tiles from @data_source.
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
	 * Returns: a newly constructed [class@VectorRenderer] object
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string id, string name, string license, string licenseUri, uint minZoom, uint maxZoom, uint tileSize, ShumateMapProjection projection, DataSource dataSource, string styleJson)
	{
		GError* err = null;

		auto __p = shumate_vector_renderer_new_full(Str.toStringz(id), Str.toStringz(name), Str.toStringz(license), Str.toStringz(licenseUri), minZoom, maxZoom, tileSize, projection, (dataSource is null) ? null : dataSource.getDataSourceStruct(), Str.toStringz(styleJson), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_full");
		}

		this(cast(ShumateVectorRenderer*) __p, true);
	}

	/**
	 * Creates a new [class@VectorRenderer] that fetches tiles from the given URL
	 * using a [class@TileDownloader] data source.
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
	 *     urlTemplate = a template for the URL to fetch tiles from
	 *
	 * Returns: a newly constructed [class@VectorRenderer] object
	 *
	 * Throws: GException on failure.
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string id, string name, string license, string licenseUri, uint minZoom, uint maxZoom, uint tileSize, ShumateMapProjection projection, string urlTemplate, string styleJson)
	{
		GError* err = null;

		auto __p = shumate_vector_renderer_new_full_from_url(Str.toStringz(id), Str.toStringz(name), Str.toStringz(license), Str.toStringz(licenseUri), minZoom, maxZoom, tileSize, projection, Str.toStringz(urlTemplate), Str.toStringz(styleJson), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		if(__p is null)
		{
			throw new ConstructionException("null returned by new_full_from_url");
		}

		this(cast(ShumateVectorRenderer*) __p, true);
	}

	/**
	 * Checks whether libshumate was compiled with vector tile support. If it was
	 * not, vector renderers cannot be created or used.
	 *
	 * Returns: %TRUE if libshumate was compiled with `-Dvector_renderer=true` or
	 *     %FALSE if it was not
	 */
	public static bool isSupported()
	{
		return shumate_vector_renderer_is_supported() != 0;
	}
}
