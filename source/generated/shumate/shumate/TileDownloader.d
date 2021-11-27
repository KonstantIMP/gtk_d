module shumate.TileDownloader;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import shumate.DataSource;
private import shumate.c.functions;
public  import shumate.c.types;


/** */
public class TileDownloader : DataSource
{
	/** the main Gtk struct */
	protected ShumateTileDownloader* shumateTileDownloader;

	/** Get the main Gtk struct */
	public ShumateTileDownloader* getTileDownloaderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return shumateTileDownloader;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)shumateTileDownloader;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (ShumateTileDownloader* shumateTileDownloader, bool ownedRef = false)
	{
		this.shumateTileDownloader = shumateTileDownloader;
		super(cast(ShumateDataSource*)shumateTileDownloader, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return shumate_tile_downloader_get_type();
	}

	/**
	 * Creates a new [class@TileDownloader] that fetches tiles from an API and
	 * caches them on disk.
	 *
	 * See [property@url-template] for the format of the URL template.
	 *
	 * Params:
	 *     urlTemplate = a URL template to fetch tiles from
	 *
	 * Returns: a newly constructed [class@TileDownloader]
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string urlTemplate)
	{
		auto __p = shumate_tile_downloader_new(Str.toStringz(urlTemplate));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(ShumateTileDownloader*) __p, true);
	}
}
